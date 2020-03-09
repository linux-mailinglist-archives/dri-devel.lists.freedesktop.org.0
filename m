Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDE17E3A7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 16:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628326E199;
	Mon,  9 Mar 2020 15:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F936E199
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 15:33:31 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e18so10399383ljn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 08:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7cxo62zLP6dhwr8DIAkFFPPT5ngihMtJqVPFYe7peuk=;
 b=gC8FLa91cX7ZfYvwZgRoFfhJixbUEUKEbqeTve3yOp9GyLC7M+IYjS6v4Dk/e01/ch
 crvhUSs9vasYfyq8VReYEBSeD4nZewylQxqmn2uYwHge7x1J7NcZV8dlczgTZgP2Gbmt
 fFmIUt23tN+ShVTGwu/i1WndtTJ5fAChii7TKtzKxE1/Lez+lr07suWqcxRcPAIJnYAw
 9phU9HZ/AAmcO467GWnNMnGmZ6XMxLtNED1/EqjMJpEh1EWxm634Eh3xP6u0MnY8fUjo
 fTG4nXuu/jt5iMQ7PQ7jo+uwDISlVxlLBUtiRg1OAOZXXw4RLFlDj0l20fO3VayI45MC
 eHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7cxo62zLP6dhwr8DIAkFFPPT5ngihMtJqVPFYe7peuk=;
 b=dT1NUZVx/6h/SgRSK6REI4eIVNc0dpqLFOWHNPZDrl0ZfTPCO4csiDxr7M4qJPMSz8
 b3ftRSm7HxkyzPnpJd6tiqDnzaeqvyhCvhN7fLn31VHVgYLkmmDAIqlQ34kqajZckwHE
 A0qsChNQk/egqJSPnpdnx3Y64d2FHhR8idtSfjZ5yCbH/0LN9aPYuawkjRbPdO4dTEET
 Pn3xanCkAmTqrxEJ/OzDMuuWzJBNvZ6Mxram8w0VZEeJkVim9MpbVemj5ESxDBAdpVRD
 yjZsdCxrYIfl27k3GPkxmLG7dZnLAWeM5Dt+fK51nLeI1CvFVD/aAEbE/werwh32iP2D
 0waw==
X-Gm-Message-State: ANhLgQ2OOnH4VKkYRkNE9nyWXZyFJRAWE+aN8OvxfLdjxoF+cVvISEPW
 gs/zBmpuGxt/wyJSYXtk/Ws0pj/EV5LHlXQPiRFwfROO
X-Google-Smtp-Source: ADFU+vvxdLtUyMbjMyef+XgVOho8xygezu8kd4B10tbWtV7VEyiWDYHzmeQtnLYBTleLQH0RYeigr23vyBluy5vpwyo=
X-Received: by 2002:a2e:894d:: with SMTP id b13mr8865782ljk.99.1583768010289; 
 Mon, 09 Mar 2020 08:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200302203452.17977-2-ville.syrjala@linux.intel.com>
 <20200309133644.32385-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200309133644.32385-1-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Mar 2020 16:33:19 +0100
Message-ID: <CACRpkdaWKLhjqvFnkUJasKZmTqgPD7+btW7PiGyveCHJEa892Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/33] drm/panel-novatek-nt35510: Fix dotclock
To: Ville Syrjala <ville.syrjala@linux.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgOSwgMjAyMCBhdCAyOjM2IFBNIFZpbGxlIFN5cmphbGEKPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFRoZSBkb3RjbG9jayBpcyB0aHJlZSBvcmRl
cnMgb2YgbWFnbml0dWRlIG91dC4gRml4IGl0Lgo+Cj4gdjI6IEp1c3Qgc2V0IGl0IHRvIDIwTUh6
IChMaW51cykKPgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51
cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
