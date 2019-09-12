Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2AAB18E2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A246EEAB;
	Fri, 13 Sep 2019 07:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70086EE2D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 21:05:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i1so7893060pfa.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=89ShEvziG8rBiCJO9zLD5mOcoBzxTK66+hxIC8sSJK8=;
 b=de1iMX4o+rR/MVtruroSweVDGNx6b+O1UAi2NTNppwObvIEeM3x3uzQWb3RK8tyP2f
 flPo5H//+UiBeiW2Z+uKSn6UjY92BAwS0XP2NkiP4csUgaLXbfZbx+NeyftZXsJldnYm
 7jNR3320uikRE3hCioWX/Clwe+rZ3AbUzaY1Z2AeSdlEQgJmL56VF3upCPQYpw5W3n2b
 ptmt7SUqIquujkaH8KiMuhBW1kp9CcyByyNxuFdalCmmQye9ojQF+3wkdmDz9GqVkoNJ
 hh8wfRYnpUKJLmiFtyb1C66VXEtodT10aI/oRTCLqxVZE3JOtiKa5efDIOlBb2txJbng
 wyrA==
X-Gm-Message-State: APjAAAXqk3ZeRLo98/uUXV7itVMx55qlmhrFyI8257352UkNIFAsItPH
 eAyAqlJYqjUDwijp0OGgJXM=
X-Google-Smtp-Source: APXvYqw324Q0aq50D6G0m+g6RLfGgdw1WtVnZtIZvuwae8SureLQrhTg6dolsGhepELZ7ApO8fow2g==
X-Received: by 2002:aa7:9688:: with SMTP id f8mr50362833pfk.77.1568322329446; 
 Thu, 12 Sep 2019 14:05:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id d5sm13316226pfn.160.2019.09.12.14.05.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 14:05:28 -0700 (PDT)
Date: Thu, 12 Sep 2019 14:05:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v2 2/2] drm/bridge: add it6505 driver
Message-ID: <20190912210526.GA16171@roeck-us.net>
References: <1567507915-9844-1-git-send-email-allen.chen@ite.com.tw>
 <1567507915-9844-3-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567507915-9844-3-git-send-email-allen.chen@ite.com.tw>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=89ShEvziG8rBiCJO9zLD5mOcoBzxTK66+hxIC8sSJK8=;
 b=e3gFSTKenIfWnODa9bgd6LjRElXwYzouFer3zbdPo6nD37ebAFKnyH0m9h5e7oqKOD
 lN6Yhnh2gkyHYfcXytlP/XaE6B7ttzHFeUp8fA2NzjWkimUcvZ//Cmrl3TRqYAzP+gXR
 zKLhWRf6fflJwgDid2SlhAasYCP5KmLRzS0pAbrSVhWyRVx+o+q/l25t6DPPtpiaP1I2
 rcuQekbOkAzY2GmovIiXCMFyKIZr1rXnde+OEB64L+XpitLkC3lJOEXE54CrXC7NQb8t
 vhII+xQkWwN3DEODdwwLcBYAWOGC3ylC4My6Jn2igfTGUpabQHqcznp+RAtrOLmO0RVl
 +gUg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: no To-header on input <>, Archit Taneja <architt@codeaurora.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Yilun Lin <yllin@google.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIFNlcCAwMywgMjAxOSBhdCAwNjo1MTo1NFBNICswODAwLCBhbGxlbiB3cm90
ZToKPiBGcm9tOiBBbGxlbiBDaGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+Cj4gCj4gVGhpcyBh
ZGRzIHN1cHBvcnQgZm9yIHRoZSBpVEUgSVQ2NTA1Lgo+IFRoaXMgZGV2aWNlIGNhbiBjb252ZXJ0
IERQSSBzaWduYWwgdG8gRFAgb3V0cHV0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8
aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZaWx1biBMaW4gPHlsbGlu
QGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUu
Y29tLnR3PgoKSSB0cmllZCB0byBwcm92aWRlIGZlZWRiYWNrIG9uIHRoaXMgcGF0Y2gsIGJ1dCBp
dCBpcyBmYXIgZnJvbSBjb21waWxpbmcKYWdhaW5zdCB0aGUgdXBzdHJlYW0ga2VybmVsIChvciAt
bmV4dCksIGFuZCBpdCBoYXMgYSBudW1iZXIgb2Ygb2J2aW91cwpwcm9ibGVtcyBzdWNoIGFzIG1p
c3NpbmcgaW5jbHVkZSBmaWxlcywgdmFyaWFibGUgdHlwZSBtaXNtYXRjaGVzLCBhbmQKc2V0IGJ1
dCB1bnVzZWQgdmFyaWFibGVzLiBJdCBkb2VzIGNvbXBpbGUgYWdhaW5zdCB2NC4xOS55LCBidXQg
ZXZlbiB0aGVyZQppdCBnZW5lcmF0ZXMgYSBudW1iZXIgb2YgYnVpbGQgd2FybmluZ3MuCgpJIHdv
dWxkIHN1Z2dlc3QgdG8gZml4IHRob3NlIHByb2JsZW1zIGFuZCB0byBtYWtlIHN1cmUgdGhhdCB0
aGUgZHJpdmVyCmJ1aWxkcyB3aXRob3V0IHdhcm5pbmdzIG9uIHRvcCBvZiB0aGUgbWFpbmxpbmUg
a2VybmVsIGJlZm9yZSByZXN1Ym1pdHRpbmcuCgpUaGFua3MsCkd1ZW50ZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
