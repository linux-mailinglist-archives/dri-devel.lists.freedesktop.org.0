Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9248647509
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EEA89272;
	Sun, 16 Jun 2019 14:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B20A892BD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 18:56:03 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n2so2026351pgp.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 11:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vi9HOqhVGYAs7GQ1RGU6Au5JJxjAyVHZ1t3+UITLDWM=;
 b=uSeR252ZQzIfs+HFXoYf9Miu5nk3j/T+2hvX+Ij29+TjctipgCqQ5iRjGDYe5VsoPO
 8ukvzGPykaX+sFpu8D3rshhYhAo4Si82J0Wk5nNx0itTqTM2EpcJe5KDwAim5OfJ2r8i
 5noTfJEaBWxHN6VJ+pEx5QkfNcsm0SFwoidkjgRjQsYXTzcFt87sSaWR26OC8QiCM4L9
 Gewcpg2gFh+MkaP1doyBA9WwwKIBywbjam7kJy/fyIbQgikr8e89MHVv4q6oTkNVRr2a
 EWVpkFAa+8ao+XOtiVDhmn306CatM1FtyuvLf0ONGpOiLTXovlZ46OcXYtBjoFlPIWXl
 Kxeg==
X-Gm-Message-State: APjAAAU2RQB1upLdznzn5IyfE7f6HlePALVIrqaQJh+UnNys4yHlI3TK
 3Sz1ZoCAiShW/Kr2q7faKNX2DSzeZUEPvkPc3pjX/A==
X-Google-Smtp-Source: APXvYqwU93ybihiYA9qI1ZfNbjRei7zFHARUnTO+Rc8QUH+8TNozlwasI5X3wqGb0bv42HyvcYj6+f7tryRZXmfjnTI=
X-Received: by 2002:a63:306:: with SMTP id 6mr24242533pgd.263.1560538563050;
 Fri, 14 Jun 2019 11:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
In-Reply-To: <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Jun 2019 11:55:52 -0700
Message-ID: <CAKwvOdkcYfeKSwvGHRmvj4xUT1vJ=vU5ubxrqrkPC1STNuOz5w@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To: Sean Paul <sean@poorly.run>
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Vi9HOqhVGYAs7GQ1RGU6Au5JJxjAyVHZ1t3+UITLDWM=;
 b=KcCX5mU37AGn3G3Wc0liG/jc8GtXaM2IsJzf9mOsShHLTiWFHUKFqTCT42vg2eB+Q7
 8PSsg1gghWwbdHmqGZMVPntXTFyG6yoY0N90EQ36+PBbZeMfTxZcpRTKLZfl6//wrAK4
 SDvVd5e0150rwYewbq+DsFK3frIYOG5SX6HN9BaLhVvd3vwCmrAnC3PoxI2sD4j4uNqX
 5EMYKvnnMmd95YfKhE1dM44Fzwap2ygjtdKBzCLirgKWHiGYnKemGVp9hq6IsL59iU2V
 X3UZlVy2HJxDiz7/YrvBkRz77XWOLJ77jsf2S8FQ0anVH2r26eX84KzTevp62JW/eRmX
 komA==
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathan Huckleberry <nhuck@google.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTo1MCBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCA0OjEzIFBNIE5hdGhhbiBIdWNr
bGViZXJyeSA8bmh1Y2tAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGV5IGFsbCwKPiA+Cj4g
PiBJJ20gbG9va2luZyBpbnRvIGNsZWFuaW5nIHVwIGlnbm9yZWQgd2FybmluZ3MgaW4gdGhlIGtl
cm5lbCBzbyB3ZSBjYW4KPiA+IHJlbW92ZSBjb21waWxlciBmbGFncyB0byBpZ25vcmUgd2Fybmlu
Z3MuCj4gPgo+ID4gVGhlcmUgYXJlIHNldmVyYWwgdW51c2VkIHZhcmlhYmxlcyBpbiBkcHVfZm9y
bWF0cy5jCj4gPiAoJ2RwdV9mb3JtYXRfbWFwX3RpbGUnLCAnZHB1X2Zvcm1hdF9tYXBfcDAxMCcs
Cj4gPiAnZHB1X2Zvcm1hdF9tYXBfcDAxMF91YndjJywgJ2RwdV9mb3JtYXRfbWFwX3RwMTBfdWJ3
YycpLgo+ID4gVGhleSBsb29rIGxpa2UgbW9kaWZpZXJzIHRoYXQgd2VyZSBuZXZlciBpbXBsZW1l
bnRlZC4gSSdkIGxpa2UgdG8KPiA+IHJlbW92ZSB0aGVzZSB2YXJpYWJsZXMgaWYgdGhlcmUgYXJl
IG5vIHBsYW5zIG1vdmluZyBmb3J3YXJkIHRvCj4gPiBpbXBsZW1lbnQgdGhlbS4gT3RoZXJ3aXNl
IEknbGwganVzdCBsZWF2ZSB0aGVtLgo+Cj4gV2UgY2FuIHByb2JhYmx5IHJlbW92ZSB0aGVtIGZv
ciBub3cgYW5kIGlmIHNvbWVvbmUgd2FudHMgdG8gYWRkCj4gc3VwcG9ydCwgdGhleSBjYW4gZHJl
ZGdlIHRoZW0gYmFjayB1cC4KClllcCwgdGhpcyBoYXMgYmVlbiB0aGUgZmVlZGJhY2sgZm9yIG90
aGVyIHBhdGNoZXMgZm9yIHRoaXMgd2FybmluZwp3aGVuIHRoZSBjb2RlIHdhcyBkZWFkIG9yIG5v
dCBvYnZpb3VzbHkgc29tZSBraW5kIG9mCmJ1Zy90eXBvL2NvcHktcGFzdGEuCgpOYXRoYW4sIHBs
ZWFzZSBzdWJtaXQgYSBwYXRjaCByZW1vdmluZyB0aGUgZGVhZCBjb2RlOyBpdCBtYXkgYmUKcmV2
ZXJ0ZWQgbGF0ZXIgd2hlbiBpdCdzIGFjdHVhbGx5IHdpcmVkIHVwLiAgTm90aGluZyBpcyB0cnVs
eSBsb3N0IHcvCmdpdCouCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
