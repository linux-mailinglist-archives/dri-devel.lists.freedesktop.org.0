Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE62F5410
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 21:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129186EC42;
	Wed, 13 Jan 2021 20:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7066EC42
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:25:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id e25so2812071wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=w+kZv9kbYsmHr/JGy5iDhtegSxFGC5KTV0tLyw8dvw8=;
 b=ohigjfj+Kvg5LKBxNhr5js1B2AdGOZOnQHG0tH9Gv+QjQ3iarEg2hAGF+pPhuNUrkN
 mU/z9MRWz7VHMUC23GzaqdRFROIFJmeRJ+Aos1Snd1/8vvz793NH4QkFr0/Ykk7ny+45
 vvE7qPV/VZArWZimeNpeTaBi/gpjz2FMqusxom2KBRRYHmnXNx6RKagghLLD758gNoP1
 cWEJGc21SupCW30xsd+KXw5J8gU3BjMwMMn0Fbpq4LQBb9PPcG6xc4sPgOnCLLqNYRRp
 3+KLe4hGxby3BpakC80ATrAMZrER1juRp3IPouRwdu6HCqntA9EJb/8ery1YiNVirI4L
 /2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w+kZv9kbYsmHr/JGy5iDhtegSxFGC5KTV0tLyw8dvw8=;
 b=lnblENb2I4HEvP2+Z5tZ5+sp63JnJL5RDgYt9xvIWsAY/j4GkrdJ+duuJf9xm/dSfo
 3QPTb75aWm+RWe4/TNjzxzTS09aGWR5cuC6q+h1x/GyqLzcEyXfzW8p8nul6ag/aLK2u
 iCvVj1XgHHG4o3w6jMdUk8R8W8UZAuK+/CA/TdWPZCnDCgHbSG1wK+PHE0+YWWmcFxAN
 lWIaLiMJs4VfQHWeYkQTEHCcai0pIsbcumGF6wp8Dp8WJlNKHBuF9XHVkgxz3qzWvStx
 OVvo5t7BEiVt+0f9e4y9H/mr3Fd0nWSaQPTQJWl2SPx+tlsTkX5p4RFRMwW/Fa4qMTje
 MtIA==
X-Gm-Message-State: AOAM531Bq83cA1tDV5d73UwJk3ku+sKe0JqcbcwQyB6l+NFHWc+S4jkZ
 II2WWhKohH1OPhJnYtlBGfh6cg==
X-Google-Smtp-Source: ABdhPJz/+lJZkI7anapuMcRBn/lk43KTNF/diGn2gD6fqYtQDwiTQc1zvndtf8bPqr6YQRCy/2y+KQ==
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr878238wmf.58.1610569549645; 
 Wed, 13 Jan 2021 12:25:49 -0800 (PST)
Received: from dell ([91.110.221.193])
 by smtp.gmail.com with ESMTPSA id v20sm4490293wml.34.2021.01.13.12.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:25:48 -0800 (PST)
Date: Wed, 13 Jan 2021 20:25:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/31] Rid W=1 warnings from Video
Message-ID: <20210113202546.GG3975472@dell>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
 <20210113190118.GA180942@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113190118.GA180942@ravnborg.org>
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
Cc: "Eddie C. Dost" <ecd@skynet.be>, linux-fbdev@vger.kernel.org,
 Anthony Tong <atong@uiuc.edu>, Alex Kern <alex.kern@gmx.de>,
 dri-devel@lists.freedesktop.org, Oliver Kropp <dok@directfb.org>,
 Software Engineering <lg@denx.de>, Antonino Daplas <adaplas@pol.net>,
 Frodo Looijaard <frodol@dds.nl>, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Urs Ganse <ursg@uni.de>, Thibaut VARENE <varenet@parisc-linux.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Helge Deller <deller@gmx.de>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Ani Joshi <ajoshi@unixbox.com>,
 Emmanuel Marty <core@ggi-project.org>,
 "Mark D. Studebaker" <mdsxyz123@yahoo.com>,
 Alex Dewar <alex.dewar90@gmail.com>, daniel.mantione@freepascal.org,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 carter@compsci.bristol.ac.uk, Alan Cox <alan@redhat.com>,
 Jeff Garzik <jgarzik@pobox.com>, Ilario Nardinocchi <nardinoc@cs.unibo.it>,
 Jakub Jelinek <jakub@redhat.com>, Ani Joshi <ajoshi@shell.unixbox.com>,
 "Thomas J. Moore" <dark@mama.indstate.edu>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Fremlin <vii@users.sourceforge.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 William Rucklidge <wjr@cs.cornell.edu>, Paul Mundt <lethal@chaoticdreams.org>,
 Brad Douglas <brad@neruo.com>, Ralph Metzler <rjkm@thp.uni-koeln.de>,
 James Simmons <jsimmons@users.sf.net>, Ghozlane Toumi <gtoumi@laposte.net>,
 Jim Hague <jim.hague@acm.org>,
 Egbert Eich <Egbert.Eich@physik.tu-darmstadt.de>,
 Jes Sorensen <jds@kom.auc.dk>, Gerd Knorr <kraxel@goldbach.in-berlin.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Martin Mares <mj@ucw.cz>,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Hannu Mallat <hmallat@cc.hut.fi>, Philip Edelbrock <phil@netroedge.com>,
 Jakub Jelinek <jj@ultra.linux.cz>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBKYW4gMjAyMSwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMDI6NDk6MzhQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBj
bGVhbi11cCBXPTEKPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3Zlcndo
ZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiBuaWdnbHkgbGl0dGxlIHdhcm5pbmdzLgo+ID4gCj4g
PiBUaGlzIHBhdGNoLXNldCBjbGVhcnMgYWxsIG9mIHRoZSBXPTEgd2FybmluZ3MgY3VycmVudGx5
IHJlc2lkaW5nCj4gPiBpbiBkcml2ZXJzL3ZpZGVvLgo+IAo+IEkgYW0gc29ycnkgdG8gc2F5IHRo
YXQgSSBleHBlY3QgbW9zdCBvZiB5b3VyIG5pY2UgcGF0Y2hlcyB0byBjbGFzaAo+IHdpdGggcGF0
Y2hlcyB0aGF0IGlzIGFscmVhZHkgcHJlc2VudCBpbiBkcm0tbWlzYy1uZXh0Lgo+IAo+IGRyaXZl
cnMvdmlkZW8vIGFyZSB3YXJuaW5nIGZyZWUgd2l0aCBXPTEgaW4gZHJtLW1pc2MtbmV4dCB0b2Rh
eS4KPiAKPiBJIGRvIG5vdCBrbm93IHdoeSBkcm0tbWlzYy1uZXh0IGlzIG5vdCB5ZXQgcHVsbGxl
ZCBpbnRvIGxpbnV4LW5leHQuCgpXZWxsIHRoYXQga2luZGEgc3Vja3MuICBXaGF0IGFyZSB0aGUg
Y2hhbmNlcyBvZiB0aGF0PwoKTW9zdCBvZiBteSBwYXRjaGVzIGZpeCBpc3N1ZXMgdGhhdCBoYXZl
IGJlZW4gdGhlcmUgZm9yIHllYXJzIQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3Ig
VGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdp
dHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
