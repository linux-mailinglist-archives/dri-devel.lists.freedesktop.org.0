Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C2119F1CD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 10:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E206E22B;
	Mon,  6 Apr 2020 08:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7312E6E07B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 08:49:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j19so14890151wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hB/cttD2PIQJrbz4bzuL3i++GH0OSgasFqo3xqjEQAo=;
 b=KlcQa7lIt+n/wVEV8JdYNkiUDQQp+hGTfkU1Mu02PywtjHqp63UeXe/YmyUw018Kdc
 lpl1WphuIEEQUPCuEbfiYH37JUXWUTrg26Sf4c64ZSxRRDOVgszt6TP6yfeIKKv4bnBC
 w3jj2IBcjWCz177Pxk5VvdWa2Y40lDC/vS6pXi98sdU+jDGOH7l9ozbD6p+C4Ah8Nsap
 AB/D6Od+pOXPDjy792trBcGT+iJ0/81trVcYIVx4YxoA9gCgCvFxxtHf0GNkk09CRmxo
 BTql6k2kwaGkNcIiaIY/53x86i7F0xHwY9eXlCwZPZzQEaMUhBuLdt9X9dmS8LyJB3ZM
 EsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hB/cttD2PIQJrbz4bzuL3i++GH0OSgasFqo3xqjEQAo=;
 b=R6jWKgsHxikVXy0g1AcqqKpSACf3RQfX3vFUebKcM5zR153CKjo4P7flSFqtTIBJ6M
 yUKl6/5LYZO8WzcrKi9h5uUYagi5ngfK6FO1rGyieg5QIe1k/YQtrbmd/4HC7DJbFKrv
 oyyKKZRc0ZS7dhOjDMclEzVTaRhmIjGXiC/Cpet9Ivcwk+N4GUgchhelXqm1CO69E2ih
 7+XpeTX5t3FviBMb2/WlINUDrnBlKBjM2ecwmSTFyzYQ+9ApVRV2CQBwXPpv5OEIgl+o
 cuvPayVJhIEzR/VTRWfCqkBh8Luk3k+YfEW5fbSpRJh6mqEehtan/wMAP7lg/c15Gy+l
 mLOg==
X-Gm-Message-State: AGi0PuaHe3h8NhpcsLmWtY9tVLCvGja7fLUAS5UtwU8UaFNMBvbUku9Y
 Pqjv99Ox8KEMhn+l5C3lSpCMXg==
X-Google-Smtp-Source: APiQypL6NsZE4UH6W7CHGi4ojlUeqMxw4vdKpXkAYqw432CMd+116S8Nw19uLsayC9FcZNch4FCf5A==
X-Received: by 2002:a1c:9d84:: with SMTP id g126mr6730754wme.184.1586162968744; 
 Mon, 06 Apr 2020 01:49:28 -0700 (PDT)
Received: from dell ([2.27.35.179])
 by smtp.gmail.com with ESMTPSA id t26sm14548888wmj.12.2020.04.06.01.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:49:27 -0700 (PDT)
Date: Mon, 6 Apr 2020 09:50:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200406085024.GF30614@dell>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
 <20200331175401.GA9791@bogus>
 <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
 <20200403114651.m6rholzufzqinanc@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403114651.m6rholzufzqinanc@holly.lan>
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
Cc: mark.rutland@arm.com, kgunda@codeaurora.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMyBBcHIgMjAyMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBGcmksIEFw
ciAwMywgMjAyMCBhdCAwNDo0NTo0OVBNICswNTMwLCBrZ3VuZGFAY29kZWF1cm9yYS5vcmcgd3Jv
dGU6Cj4gPiBPbiAyMDIwLTAzLTMxIDIzOjI0LCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gT24g
TW9uLCBNYXIgMjMsIDIwMjAgYXQgMTE6MTY6NTVQTSArMDUzMCwgS2lyYW4gR3VuZGEgd3JvdGU6
Cj4gPiA+ID4gZGlmZiAtLWdpdAo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L3Fjb20td2xlZC55YW1sCj4gPiA+ID4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcWNvbS13bGVkLnlhbWwKPiA+
ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiA+IGluZGV4IDAwMDAwMDAuLjhhMzg4YmYK
PiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3Fjb20td2xlZC55YW1sCj4gPiA+ID4gQEAgLTAs
MCArMSwxODQgQEAKPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5Cj4gPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiA+ICstLS0KPiA+ID4gPiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9sZWRzL2JhY2tsaWdodC9xY29tLXdsZWQueWFtbCMKPiA+
ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCj4gPiA+ID4gKwo+ID4gPiA+ICt0aXRsZTogQmluZGluZyBmb3IgUXVhbGNvbW0gVGVjaG5v
bG9naWVzLCBJbmMuIFdMRUQgZHJpdmVyCj4gPiA+ID4gKwo+ID4gPiA+ICttYWludGFpbmVyczoK
PiA+ID4gPiArICAtIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+IAo+ID4g
PiBTaG91bGQgYmUgdGhlIGgvdyBvd25lciAoeW91KSwgbm90IHdobyBhcHBsaWVzIHBhdGNoZXMu
Cj4gPiA+IAo+ID4gd2lsbCBhZGRyZXNzIGluIG5leHQgcG9zdC4KPiA+IDxzbmlwPgo+ID4gd2ls
bCBhZGRyZXNzIGluIG5leHQgcG9zdC4KPiA+IDxzbmlwPgo+ID4gd2lsbCBhZGRyZXNzIGluIG5l
eHQgcG9zdC4KPiA+IDxzbmlwPgo+ID4gd2lsbCBhZGRyZXNzIGluIG5leHQgcG9zdC4KPiA+IDxz
bmlwPgo+ID4gd2lsbCBhZGRyZXNzIGluIG5leHQgcG9zdC4KPiA+IDxzbmlwPgo+ID4gd2lsbCBh
ZGRyZXNzIGluIG5leHQgcG9zdC4KPiA+IDxzbmlwPgo+ID4gd2lsbCBhZGRyZXNzIGluIG5leHQg
cG9zdC4KPiA+IDxzbmlwPgo+ID4gd2lsbCBhZGRyZXNzIGluIG5leHQgcG9zdC4KPiA+IDxzbmlw
Pgo+ID4gd2lsbCBhZGRyZXNzIGluIG5leHQgcG9zdC4KPiAKPiBJZiB5b3UgYWdyZWUgb24gYWxs
IHBvaW50cyByYWlzZWQgSSBkb3VidCB0aGVyZSBpcyBhbnkgbmVlZCBmb3IgYSBwb2ludAo+IGJ5
IHBvaW50IHJlcGx5IHNpbmNlIGV2ZXJ5b25lIHdobyByZWFkcyBpdCB3aWxsIGhhdmUgdG8gc2Ny
b2xsIGRvd24KPiBzaW1wbHkgdG8gZmluZCBvdXQgdGhhdCB5b3UgYWdyZWUgb24gYWxsIHBvaW50
cy4KPiAKPiBCZXR0ZXIganVzdCB0byBhY2tub3dsZWRnZSB0aGUgZmVlZGJhY2sgYW5kIHJlcGx5
IHRvIHRoZSBmaXJzdCBvbmUKPiBzYXlpbmcgeW91J2xsIGFncmVlIG9uIGFsbCBwb2ludHMgYW5k
IHdpbGwgYWRkcmVzcyBhbGwgZmVlZGJhY2sgaW4gdGhlCj4gbmV4dCByZXZpc2lvbiAoYW5kIHRo
ZW4gdHJpbSB0aGUgcmVwbHkgdG8ga2VlcCBpdCBzaG9ydCkuCgpPciBiZXR0ZXIgc3RpbGwsIGp1
c3Qgc3VibWl0IHRoZSBuZXh0IHJldmlzaW9uIHdpdGggYWxsIHRoZSBmaXhlcy4gOikKCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
