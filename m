Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878C1C4E8D
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72A06E511;
	Tue,  5 May 2020 06:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC7B89134
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 20:02:26 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id k22so14704733eds.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RSpCgKfL7JCSmus/UXR6Za233ubwnh9hyhg0p9wIVEA=;
 b=gMy2OHwMAnlkz0siAvZmpj2bDjAz+O9TkwWvbI/ledNy4d/WH38D7A6GdJ1KnxMkjj
 C12/pPtkybiUXflbRSElG6jTBjf3zZTEslbn9WHvSJ5/wX45MiL58028f0bnRnH/PQK4
 ML7AmVyP0WVDMh28HPa727MQiFneRGdGhVEKyNYebX54YRBbMn4oX33iE/w+NGBaQpaZ
 zb+4G2upO86rO3uWP7UKM7lsJHXCZyHlxgQj22TcNBrN0izKmZSuxhV6oIEOqJWZBnEH
 N45aK0FafO+YWzBcuk8aE+gLm7+UEZoc0dARTB3mYrbWUjD44TfK46PIWnp6xrRDQgHG
 azCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSpCgKfL7JCSmus/UXR6Za233ubwnh9hyhg0p9wIVEA=;
 b=UFWgcS+uSQSJo/8XiqdRczRpyEs7uEw2LXqAWB4zVdK/FeegXswPnBad/ikqDVfMwd
 AAWkDK49VUsouyoLUerp2j0DFTDcGdo5KPUkhPHGa183ZoVCrkY9mH/rH6s3V8HMj7jm
 Ulgd1fNJzS4CrLENkxPkvxnP+FOlIKGPO5IQ1PFqdPgpRGzXhnGHOljCgl84HYOOLU4j
 xyzi3hnXGjVEwFIUINHyeLe4UcGK0s6Vqjx2JKsNFOsAsyx+NGGf3gfjrEtXF81djsjV
 75P4OXQ/Kk7rA8KsiOlU7QYktIcTRMiuhlZJhFxCnCmnbF64wT1+rZ85OB0XFbN9f5Vm
 xD2A==
X-Gm-Message-State: AGi0PuadVVY0+EWAsBSYQLeBH2deCyJiEzmPau3SpCcXQdFD2zu8E92P
 /DZrTuic3fKNwNWSD/aE4fUd56wZc6iefAMM4IE=
X-Google-Smtp-Source: APiQypL8RLQnne0BIQocFtjLB2yCMb7qjYkb15FB9wOc4Sk+L8KmBl73GyNAjVv9VTZx9iajc2cfqWGLCPKqg9A4L7w=
X-Received: by 2002:aa7:db0b:: with SMTP id t11mr15168028eds.304.1588622544842; 
 Mon, 04 May 2020 13:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200504193816.126299-1-konradybcio@gmail.com>
 <20200504193816.126299-2-konradybcio@gmail.com>
 <a9a381eb-6d85-5c6e-f377-0b9815bd36a5@infradead.org>
In-Reply-To: <a9a381eb-6d85-5c6e-f377-0b9815bd36a5@infradead.org>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Mon, 4 May 2020 22:01:48 +0200
Message-ID: <CAMS8qEWFgsmZNj6iKH4QHLmFBMyqKKi910Xsm5fqVoZN6ZiT_g@mail.gmail.com>
Subject: Re: [v2 PATCH 1/2] drivers: drm: panel: Add ASUS TM5P5 NT35596 panel
 driver
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============2060571560=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2060571560==
Content-Type: multipart/alternative; boundary="00000000000077b3d205a4d80201"

--00000000000077b3d205a4d80201
Content-Type: text/plain; charset="UTF-8"

I just sent out a v3. Hope it solves the issue.

Konrad

--00000000000077b3d205a4d80201
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">I just sent out a v3. Hope it solves the issue.<div><br></div><div>Konrad</div></div>

--00000000000077b3d205a4d80201--

--===============2060571560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2060571560==--
