Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739BFD2B9B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF386EB42;
	Thu, 10 Oct 2019 13:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BCA6EB42
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:44:37 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r16so5483923edq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 06:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=hoJ6TorxaA0ueOkAnVcY7UKvB59REF8/krI4QbdE3rY=;
 b=GXZORCnFt0V2A6hyOvntYF7Ykn09z+Gj28AquVr0wxgtfC28snwg2JqvvWDqBtwqAS
 ckd5kSNV4K1ViEo0uUkLJ4z0SXK6fxm71WaA3yMEsDDUccnFrmdYeHrYZbnTRS0vvgut
 g9d3scgE7UuJlbO3eENNpgbzfu7UkRA6tNQrjXIk9X2tlNRehxQ/cHwRKLYJP1dgohOK
 +5+Y2/VOsms6uT4Pnz/tVGF2tNSeyPurg/b0vkva6e+iZ8xMWtbuteHRmbItpElaHkNq
 rfIJnZPpJtkmvxMxOBrm4UHkfuwydbKq8D1k+COdt6Xt3plK8SdE8poV3fsGRX+FBFbL
 67Dw==
X-Gm-Message-State: APjAAAWM0p5azBaTWfsaOsl9JF/36+8I2l8XLcvdHmR73IMoTKdx+fGZ
 j/H5eVuIgKsGc6mPdoXwEJ76FA==
X-Google-Smtp-Source: APXvYqzHiMfMRhzP+ce4ioVGwJmdp6neoxytw+JQPQJ8tg7kmLQo7v1y826ew96r7MuwZnWxO0ymAA==
X-Received: by 2002:a17:906:a986:: with SMTP id
 jr6mr7585993ejb.158.1570715076498; 
 Thu, 10 Oct 2019 06:44:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r18sm974451edx.94.2019.10.10.06.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 06:44:35 -0700 (PDT)
Date: Thu, 10 Oct 2019 15:44:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191010134433.GY16989@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Qian Cai <cai@lca.pw>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>
References: <20191010131448.482da2b2@canb.auug.org.au>
 <20191010080207.GA22099@gmail.com>
 <20191010222210.1365d50b@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010222210.1365d50b@canb.auug.org.au>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=hoJ6TorxaA0ueOkAnVcY7UKvB59REF8/krI4QbdE3rY=;
 b=AfuUb30BN2fwLHvc++JsHy0F39WOPWyY6n5BemTQw4OffXIs9XPV8OEKc91w7W4+g5
 hrlPzv1yXu60ZCX+CWlLe8CNYfo2zJTFzNtQS/MD5/GwzPcnvFN3neUhaveUI3Q8qoVC
 VH1RNyOOxQ0acee6EjhlHOvgQbsStXwga5L2c=
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
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@elte.hu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTA6MjM6MjFQTSArMTEwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBJbmdvLAo+IAo+IE9uIFRodSwgMTAgT2N0IDIwMTkgMTA6MDI6MDcgKzAy
MDAgSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEkgc3VzcGVj
dCAtbmV4dCB3aWxsIGhhdmUgdG8gY2FycnkgdGhpcyBzZW1hbnRpYyBtZXJnZSBjb25mbGljdCAK
PiA+IHJlc29sdXRpb24gdW50aWwgdGhlIERSTSB0cmVlIGlzIG1lcmdlZCB1cHN0cmVhbS4KPiAK
PiBZZXAsIGl0cyBub3QgYSByZWFsIHByb2JsZW0sIEkgZ2V0IGEgZmV3IGxpa2UgdGhpcyBldmVy
eSBjeWNsZS4KClllYWggdG90YWxseSB3aXRoaW4gZXhwZWN0YXRpb25zIHdoZW4gSSBhY2tlZCB0
aGF0IGNsZWFudXAgcGF0Y2guIFdlJ2xsCnByb2JhYmx5IGhhdmUgYSBmZXcgbW9yZSBsb2NrZGVw
IGFubm90YXRpb24gcGF0Y2hlcy9jaGFuZ2VzIHRoYXQgd2lsbApjb25mbGljdCBpbiBkcm0uCi1E
YW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
