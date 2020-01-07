Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDA13235E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 11:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421236E821;
	Tue,  7 Jan 2020 10:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FC86E821
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 10:17:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so53170684wrl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=wADUiklQGqkVRHS/MFhQD6ufQzvydVIjp5oA5mx3O5c=;
 b=aXIdqgLXGcmv5XCWk5/AXFvt6fEui+64l98g2DfWsHjiicwC53+ccrVBEOWxGu6r0Z
 OeX/eWnGUKmDmWq7Gm8cMLjPFpnCFP9nsTKP6jENm0v0ulgpfhpaLkQTsM42fLOdPXyi
 qeIUzoNItiGkVJOOoxvkNLtbZG7kSBpRqWXtQcwKWgprkCWjkmey0lApcH1eahUlZuEq
 vAtZMKN8dRXjrlg6LeuOpKVvZodzVc/EhPQ31bmlhdOF470N7/qIQr287KSbaJyx8DdH
 k/2w1gbE3JFdqVDxXHkkkuUgrYBSo+9xRGMKdA1Q1tGNlLlJJLBySBzZ8tYjR/O3eebQ
 H+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wADUiklQGqkVRHS/MFhQD6ufQzvydVIjp5oA5mx3O5c=;
 b=k4N49+sW0qw0U/kyzmkfpR6qen5dpMJg23wWBGh+GFpDprr0HZ7cpn7HSaNGFOltHX
 pnZBugubP7ICQdCL0MJPBgMLLEIPIN24qTDM2gnVmr3Y+hDxS1Gc6z2z/J3enYiXW+F4
 Zvufr5loQ9T0VOR04RkNzCb9kXYr7nFPaGMNQLDMpW/JkgF0JbwYGBi0wXTS/0e9VEv4
 RH337RaI/ESilNRStqC4LhJJXDlsc/50AJu6iNisE0T0lDlB3faC9MP+Xc2CatTrXpVQ
 8qhUMOX77dCH7Y/fLQHfhBDCcBuxmUMErB9J1g9EBbZFmE7/IccNTushx3UzBhkeCzFt
 li9w==
X-Gm-Message-State: APjAAAW5CLd+3dzzwVsShF1ktGjZ4GmlG6FXm9m+hss6FSM/82+FRe3s
 KK581Jp1nMMr+HKkMcOgHO7Aaw==
X-Google-Smtp-Source: APXvYqz4Rj4ufV3lelc5BTGQJhC+R/z8hRz+z92FuK07DVJDQcMJSplOxlPh60gzjWH8pqwxktrksA==
X-Received: by 2002:a05:6000:367:: with SMTP id
 f7mr105722054wrf.174.1578392266202; 
 Tue, 07 Jan 2020 02:17:46 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id u22sm80773920wru.30.2020.01.07.02.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 02:17:45 -0800 (PST)
Date: Tue, 7 Jan 2020 10:17:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [GIT PULL] Immutable branch between MFD and DRM due for the v5.6
 merge window
Message-ID: <20200107101748.GC14821@dell>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com, sam@ravnborg.org,
 peda@axentia.se, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1GRCBwYXJ0cyBmb3IgdGVzdGluZzoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgZTQyNjE3YjgyNWY4MDczNTY5ZGE3NmRjNDUxMGJmYTAxOWIxYzM1YToKCiAgTGludXgg
NS41LXJjMSAoMjAxOS0xMi0wOCAxNDo1Nzo1NSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbGVlL21mZC5naXQgdGFncy9pYi1tZmQtZHJtLXY1LjYKCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byAxMGY5MTY3NjY0MzYyYmFjNmY0NDgxMzY4N2NmNTJmZWM5ZDE1
ODQ1OgoKICBtZmQ6IGF0bWVsLWhsY2RjOiBSZXR1cm4gaW4gY2FzZSBvZiBlcnJvciAoMjAyMC0w
MS0wNyAxMDowODo1OCArMDAwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW1tdXRhYmxlIGJyYW5jaCBiZXR3ZWVuIE1G
RCBhbmQgRFJNIGR1ZSBmb3IgdGhlIHY1LjYgbWVyZ2Ugd2luZG93CgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNsYXVkaXUg
QmV6bmVhICgyKToKICAgICAgbWZkOiBhdG1lbC1obGNkYzogQWRkIHN0cnVjdCBkZXZpY2UgbWVt
YmVyIHRvIHN0cnVjdCBhdG1lbF9obGNkY19yZWdtYXAKICAgICAgbWZkOiBhdG1lbC1obGNkYzog
UmV0dXJuIGluIGNhc2Ugb2YgZXJyb3IKCiBkcml2ZXJzL21mZC9hdG1lbC1obGNkYy5jIHwgMTgg
KysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRl
Y2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
