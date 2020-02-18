Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929316276A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 14:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F83E6E2EC;
	Tue, 18 Feb 2020 13:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2035C6E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 13:51:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w12so24037590wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=9p6OXHKsM023NhocmqOZnADdz+HERBrvBoyGsV+UlKE=;
 b=i+APoOGnnmlCIGHizJMEvzNQdV+k0wmdevVDYJirpQWMZ6wd1KbrIasKsmtHgrk8qy
 xKAxXUkz8FeK6SRZsVUAbXIouvTfpc49e/A82u4y6Qd5N2ZPkB3QCGJ/0/BZKkOvU5m1
 kd5GgA+mKNooGJf61agRotmNXxAFavcq+41qEYaPsAR1FYCqT2Hil8f5AfRwGR/a4xWh
 /XzkbvRNmkds4jezM25NtZGsCANvVSAakLvmx0PH1EmFnL23BDk81Kbd0//8rZ6bAoBQ
 JhnAnaB+l26mhKBL54I26Vq9om6erS/E+UosyCAs7BQqTeEikve34Fo7ns7nvVVYVuVJ
 BKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=9p6OXHKsM023NhocmqOZnADdz+HERBrvBoyGsV+UlKE=;
 b=oCnkpfuq8rsHSD8FYarbZmaZunDfy3w1ms9UMHgGYAs1AxVAGUL5Y2u9+OuYYWRYru
 NbhT92Zha5ajH+OWIOeOjVEvK9RIfTnlQc8JSNJJ0AS4TrstQP7K3VtSJ1gIgP9QoqmV
 jn4/l4glEIZTbxbishI26RfEO7iMHKNEHMBeaDyVqMLUgJBnOb+kBkXccLo4S8Ph9JMQ
 44TWn/hahJS09uk5EqHntyFn6HgP0GDval2HVON0xcQYLPUCkVuUoUVrTpJuxqssgxYy
 eTdWaxafHpbqq4wrqEh4MSVSV4qaQ0Lf4zIl1pVoBcyxT+XbJXquoXxFOzL16+H1zxwY
 E5kA==
X-Gm-Message-State: APjAAAUVmSU3yEKpaPXHyp4mORacxrRoryjrefS7zxNWfqdJ8jordu+j
 xl9B0CdaYZBOrMPYig5BH4SDpQ==
X-Google-Smtp-Source: APXvYqwXJi+BRLCWb7f7jxO0dAGaoQy1ZP8L6u0Vtd85ei679by+qE09DpmnnIWAAebNG5Pv+P5d0A==
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr30076715wrs.423.1582033911637; 
 Tue, 18 Feb 2020 05:51:51 -0800 (PST)
Received: from dell ([2.31.163.122])
 by smtp.gmail.com with ESMTPSA id w8sm3675899wmm.0.2020.02.18.05.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 05:51:51 -0800 (PST)
Date: Tue, 18 Feb 2020 13:52:19 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200218135219.GC3494@dell>
References: <20200105183202.GA17784@duo.ucw.cz> <20200106084549.GA14821@dell>
 <20200211172900.GH64767@atomide.com> <20200212201638.GB20085@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212201638.GB20085@amd>
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net,
 Tony Lindgren <tony@atomide.com>, jingoohan1@gmail.com, merlijn@wizzup.org,
 martin_rysavy@centrum.cz, kernel list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, sre@kernel.org, nekit1000@gmail.com,
 tomi.valkeinen@ti.com, jjhiblot@ti.com, linux-omap@vger.kernel.org,
 agx@sigxcpu.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMiBGZWIgMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+ID4g
PiBJdCB3b3VsZCBiZSBnb29kIHRvIGdldCBMRUQgYmFja2xpZ2h0IHRvIHdvcmsgaW4gY2xlYW4g
d2F5IGZvciA1LjYKPiA+ID4gPiBrZXJuZWwuCj4gPiAuLi4KPiA+ID4gPiBbSWYgeW91IGhhdmUg
YW4gaWRlYSB3aGF0IGVsc2UgaXMgbmVlZGVkLCBpdCB3b3VsZCBiZSB3ZWxjb21lOyBpdAo+ID4g
PiA+IHdvcmtzIGZvciBtZSBpbiBkZXZlbG9wbWVudCB0cmVlIGJ1dCBub3QgaW4gdHJlZSBJJ2Qg
bGlrZSB0bwo+ID4gPiA+IHVwc3RyZWFtLl0KPiA+ID4gPiAKPiA+ID4gPiBMZWUsIHdvdWxkIHlv
dSBiZSB3aWxsaW5nIHRvIHRha2UgImJhY2tsaWdodDogYWRkIGxlZC1iYWNrbGlnaHQKPiA+ID4g
PiBkcml2ZXIiPyBXb3VsZCBpdCBoZWxwIGlmIEkgZ290ICJsZWRzOiBBZGQgbWFuYWdlZCBBUEkg
dG8gZ2V0IGEgTEVECj4gPiA+ID4gZnJvbSBhIGRldmljZSBkcml2ZXIiIGFuZCAibGVkczogQWRk
IG9mX2xlZF9nZXQoKSBhbmQgbGVkX3B1dCgpIiBpbnRvCj4gPiA+ID4gZm9yX25leHQgdHJlZSBv
ZiB0aGUgTEVEIHN1YnN5c3RlbT8KPiA+ID4gCj4gPiA+IEl0IGxvb2tzIGxpa2UgeW91IGhhdmUg
YW4gb3BlbiBxdWVzdGlvbiBmcm9tIFRvbnkgb24gdjEwLgo+ID4gPiAKPiA+ID4gSXMgdGhhdCBw
YXRjaCBvcnRob2dvbmFsLCBvciBhcmUgdGhlcmUgZGVwZW5ke2FudHMsZW5jaWVzfT8KPiA+IAo+
ID4gVWhoIGxvb2tzIGxpa2Ugd2UgbWVzc2VkIHVwIGEgYml0IHdpdGggaW50ZWdyYXRpb24uIE5v
dyBkcm9pZDQKPiA+IExDRCBiYWNrbGlnaHQgY2FuIG5vIGxvbmdlciBiZSBlbmFibGVkIGF0IGFs
bCBtYW51YWxseSBpbiB2NS42LXJjMQo+ID4gd2l0aG91dCB0aGUgImFkZCBsZWQtYmFja2xpZ2h0
IGRyaXZlciIgcGF0Y2guLiBTaG91bGQgd2UganVzdAo+ID4gbWVyZ2UgaXQgdG8gZml4IGl0IHJh
dGhlciB0aGFuIHN0YXJ0IHNjcmFtYmxpbmcgd2l0aCBvdGhlcgo+ID4gdGVtcG9yYXJ5IGhhY2tz
Pwo+IAo+IFdlIHNob3VsZCBqdXN0IG1lcmdlIHRoZSAiYWRkIGxlZC1iYWNrbGlnaHQgZHJpdmVy
Ii4gRXZlcnl0aGluZyBzaG91bGQKPiBiZSByZWFkeSBmb3IgaXQuIEknbSBzb3JyeSBpZiBJIGJy
b2tlIHNvbWV0aGluZyB3b3JraW5nLCBJIHdhcyBub3QKPiBhd2FyZSBpdCB3b3JrZWQgYXQgYWxs
Lgo+IAo+IFVuZm9ydHVuYXRlbHksIHRoaXMgaXMgYmFja2xpZ2h0IGNvZGUsIG5vdCBMRUQsIHNv
IEkgY2FuJ3QganVzdCBtZXJnZSBpdC4KClBsZWFzZSBnbyBhaGVhZC4gIEFwcGx5IG15IEFja2Vk
LWJ5IGFuZCBtZXJnZSBhd2F5IEFTQVAuCgpBY2tlZC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRl
Y2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
