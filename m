Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FC29CEB9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FE6EC5D;
	Wed, 28 Oct 2020 08:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F9C6EC42
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:16:32 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l28so3950348lfp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NZ/QoULjtElXVXQH2NSCFi85fHMToCHynpanEMruLAo=;
 b=W01C0YxDJA+JZP7S2bioKHSYjG2/2Ev1CsLzkaCvkGY6p5KDwKm77oEDUYGG4FELCi
 kzBdBCEdFEmfeoXiZnHElufMHoAsgDlmpjvAiBIgQxsjWS1DQYGRxYNzvkW+IlfB2MCy
 PSC0W7v13wyWzy3LE6D+WmefS9/IIwzmftdOaN7W7d8IHWoeAeQ2UcYkLoTmpihETbJ8
 PfuKxM1xunWQdbcvLDJqWpRG921c60S13LrXcSQBv2cMwDsLkt4YKkbYc7HZhdd+BkY0
 EEbDfRLKjeFDnasxFUGOjYGrVJChOEexx3+MdVTE5AAhbwZlScabGL5AFIMlQ0MKFKh/
 kyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NZ/QoULjtElXVXQH2NSCFi85fHMToCHynpanEMruLAo=;
 b=mkdZP2b4fhKSfKebN+2/nydXM6t94C8Gs/5JBfE/bHoEfSJNTxMrS4Lg0cbVQbDjwf
 UzFCZusFb6MOX+53lqzwvDPKHAW0Cueav+25KQjgV674dTcAve8t2vAblVIO4GJlYwQp
 r1VgP/dJ1iE8PMBqkbMrlvrl6fxpefN7pPjOECOQRMmGX11z7NraV+ubmAfAWdSVZwaN
 888k+QSCcYxHq8JV/pXBVlum0uAYNQB5PV/AWt5/4DPi4xMtgsdUrILyoasTkBc3cdQA
 gkjXt1o1og80nHx/FbUdzcTynXgfCm/gzk0MFtXFEx1CaFSkLcjcT2YnYC8EcgNeG1hV
 zRMQ==
X-Gm-Message-State: AOAM531D38oU2lPvM892knnPa0bHy3MCBFjPXMX6fOvjzB9YhZ6fbOim
 RGeyH1iUPcR3OTFRXqb7/as=
X-Google-Smtp-Source: ABdhPJzhElyTa1Nm+0EwsDbXiq6YOVoLV9mChM3jCyg8PWOvYvdZKxeME2v9jB1jCLHlQP8elBRK5w==
X-Received: by 2002:a19:550d:: with SMTP id n13mr1374492lfe.526.1603829790828; 
 Tue, 27 Oct 2020 13:16:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id t66sm241138lff.85.2020.10.27.13.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:16:30 -0700 (PDT)
Subject: Re: [PATCH v6 13/52] dt-bindings: memory: tegra124: emc: Document new
 interconnect property
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-14-digetx@gmail.com> <20201027102506.GB17089@kozik-lap>
 <f38984b6-d53f-a43d-0387-e787b3c1924d@gmail.com>
 <20201027194833.GE140636@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0a7aeebf-c5ab-13ea-3927-fa39512afd87@gmail.com>
Date: Tue, 27 Oct 2020 23:16:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027194833.GE140636@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAyMjo0OCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFR1
ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjE5OjI4UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gMjcuMTAuMjAyMCAxMzoyNSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+
Pj4gT24gTW9uLCBPY3QgMjYsIDIwMjAgYXQgMDE6MTY6NTZBTSArMDMwMCwgRG1pdHJ5IE9zaXBl
bmtvIHdyb3RlOgo+Pj4+IEV4dGVybmFsIG1lbW9yeSBjb250cm9sbGVyIGlzIGludGVyY29ubmVj
dGVkIHdpdGggbWVtb3J5IGNvbnRyb2xsZXIgYW5kCj4+Pj4gd2l0aCBleHRlcm5hbCBtZW1vcnku
IERvY3VtZW50IG5ldyBpbnRlcmNvbm5lY3QgcHJvcGVydHkgd2hpY2ggdHVybnMKPj4+PiBFeHRl
cm5hbCBNZW1vcnkgQ29udHJvbGxlciBpbnRvIGludGVyY29ubmVjdCBwcm92aWRlci4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+
PiAtLS0KPj4+PiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEx
MjQtZW1jLnlhbWwgICB8IDcgKysrKysrKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmExMjQtZW1jLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0
ZWdyYTEyNC1lbWMueWFtbAo+Pj4+IGluZGV4IDI3ODU0OWY5ZTA1MS4uYWMwMDgzMmNlYWMxIDEw
MDY0NAo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMTI0LWVtYy55YW1sCj4+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEx
MjQtZW1jLnlhbWwKPj4+PiBAQCAtMjksNiArMjksOSBAQCBwcm9wZXJ0aWVzOgo+Pj4+ICAgICAg
aXRlbXM6Cj4+Pj4gICAgICAgIC0gY29uc3Q6IGVtYwo+Pj4+ICAKPj4+PiArICAiI2ludGVyY29u
bmVjdC1jZWxscyI6Cj4+Pj4gKyAgICBjb25zdDogMAo+Pj4+ICsKPj4+PiAgICBudmlkaWEsbWVt
b3J5LWNvbnRyb2xsZXI6Cj4+Pj4gICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy9waGFuZGxlCj4+Pj4gICAgICBkZXNjcmlwdGlvbjoKPj4+PiBAQCAtMzI3LDYgKzMz
MCw3IEBAIHJlcXVpcmVkOgo+Pj4+ICAgIC0gY2xvY2tzCj4+Pj4gICAgLSBjbG9jay1uYW1lcwo+
Pj4+ICAgIC0gbnZpZGlhLG1lbW9yeS1jb250cm9sbGVyCj4+Pj4gKyAgLSAiI2ludGVyY29ubmVj
dC1jZWxscyIKPj4+Cj4+PiBBbm90aGVyIHJlcXVpcmVkIHByb3BlcnR5LCB3aGF0IGFib3V0IGFs
bCBleGlzdGluZyB1c2VycyBvZiB0aGlzIGJpbmRpbmc/Cj4+Cj4+IEVNQy9kZXZmcmVxIGRyaXZl
cnMgY2hlY2sgcHJlc2VuY2Ugb2YgdGhlIG5ldyBwcm9wZXJ0aWVzIGFuZCBhc2sgdXNlcnMKPj4g
dG8gdXBncmFkZSB0aGUgRFQuIFRoZSBrZXJuZWwgd2lsbCBjb250aW51ZSB0byB3b3JrIGZpbmUg
dXNpbmcgb2xkZXIKPj4gRFRCcywgYnV0IGRldmZyZXEgZHJpdmVyIHdvbid0IGxvYWQuCj4gCj4g
SWYgdGhlIGRldmZyZXEgd2FzIHdvcmtpbmcgZmluZSBiZWZvcmUgKHdpdGggdGhlc2Ugb2xkZXIg
RFRCcyBhbmQgb2xkZXIKPiBrZXJuZWwpIHRoZW4geW91IGJyZWFrIHRoZSBmZWF0dXJlLgo+IAo+
IElmIGRldmZyZXEgd2FzIG5vdCB3b3JraW5nIG9yIHdhcyBub3Qgc3RhYmxlIGVub3VnaCwgdGhl
biBub3RoaW5nIGlzCj4gYnJva2VuIHNvIHN1Y2ggY2hhbmdlIGlzIGFjY2VwdGVkLgo+IAo+IFdo
aWNoIG9uZSBpcyB0aGVuPwoKRGVmaW5pdGVseSB0aGUgbGF0dGVyLiBUaGUgY3VycmVudCBkZXZm
cmVxIHdvcmtzIG9rYXknaXNoLCBidXQgd2UgcmVseQpvbiBoYXJkd2FyZSB0byByZWNvdmVyIGZy
b20gdGVtcG9yYWwgRklGTyB1bmRlcmZsb3dzIGFuZCBpdCdzIGEKdXNlci12aXNpYmxlIHByb2Js
ZW0gd2hpY2ggdGhpcyBzZXJpZXMgYWRkcmVzc2VzLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
