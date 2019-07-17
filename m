Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F65B6B739
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B505B6E276;
	Wed, 17 Jul 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006AA89EB7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 03:02:30 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f17so6092131pfn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 20:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mRX9TlAeUtyXQ5rQBl4frqjOwkqHx09X+c4ROvlgZ74=;
 b=H8uCixIDshjHO0khG9VAho3CnMcyY73QuR+0QUG6/PRk/30hGAVILxaqhNLma84dok
 mfgkxT4/AUKL7/WEdS6v0YvFVHMx1bDzDeZhGTRhaOBa7zv/UI89GjasLXHR6+SzZ7+h
 sVBvEN6YpwistonZ0t/lRYTI04lDAzsBpNn3HPezlMn2+qvfChmWO5qm5AvnD+SD7hTv
 ts32jxRPyZBn2ZWJzQK5jXhwtjS/b/sKppeTcFfvwe7HDAaFAxcvLwD5X1trDv0926ND
 Oe2woeMrc3LhWXJj9SwWJv6FTtte9nWbUzqNd21lWiVXHpYTGg4dC6Wko9FBMARf4smI
 ELSw==
X-Gm-Message-State: APjAAAXbMDYFz+cJRSdoFaODUVbqh5l8C9uVl+lxhTV3jXHnd7Ubam1B
 4ith6+n2mBoM48uRjZA1G3YwWg==
X-Google-Smtp-Source: APXvYqwqqqHTOl9WI+4Q6WMPGE4ns8EQLwo8Gpn5YY3/i4zhWjU57zokH9ytJ9mERR3gLD2KJjT7aw==
X-Received: by 2002:a17:90a:71ca:: with SMTP id
 m10mr41370885pjs.27.1563332550525; 
 Tue, 16 Jul 2019 20:02:30 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id y22sm19984787pgj.38.2019.07.16.20.02.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 20:02:29 -0700 (PDT)
Date: Wed, 17 Jul 2019 08:32:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 02/10] video: sa1100fb: Remove cpufreq policy notifier
Message-ID: <20190717030227.pxqgq7strhzqyvfq@vireshk-i7>
References: <cover.1563270828.git.viresh.kumar@linaro.org>
 <7163e57cfa1780d42732fa6b5ec424c24d1d4dc8.1563270828.git.viresh.kumar@linaro.org>
 <CGME20190716122549eucas1p2c757e92ae6b02f02123f2510415372d8@eucas1p2.samsung.com>
 <8b0f9adf-8462-eeba-afd1-52201f4e7f47@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b0f9adf-8462-eeba-afd1-52201f4e7f47@samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mRX9TlAeUtyXQ5rQBl4frqjOwkqHx09X+c4ROvlgZ74=;
 b=Xpr7jSjR/IEv0BXRNnCER6aPr/CInT7jFn/4GjHwo98RjlqW2Y2qf0J5dG2WyZ+7el
 dslAWSvGzSpR3TGqTbhS+6aSlFLxvf/26RfWZfayQ/4xFwL5726B3JB61hNfoJweUIsv
 tz5R3G/NbYJ5E5E6ijoP850+4jdKVAe/xEb1Jw9wBYUJN4KfAOpYAzQtjqkFdnMHRded
 lUG+2qKUGmMG1fas9JShxaaqlNbJp1Zk+Q8g5e8KQe2mGiFIoFyaiqW3coT/pdM8BaQc
 yHfD6AEeYPPCUWECtO9zox2U33Rsj2EVAgX9c7WhFtGiYOVJvvqCRYie6CTOeEdvIvvw
 OzSQ==
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
Cc: linux-fbdev@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYtMDctMTksIDE0OjI1LCBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IHdyb3RlOgo+IAo+
IEhpIFZpcmVzaCwKPiAKPiBQbGVhc2UgYWx3YXlzIENjOiBtZSBvbiBmYmRldiBwYXRjaGVzLgoK
VGhhdCBoYXBwZW5lZCBiZWNhdXNlIEkgdXNlZCBwYXR0ZXItZGVwdGg9MSBpbiBteSBzY3JpcHQg
Zm9yIGZpbmRpbmcKbWFpbnRhaW5lcnMgZnJvbSBnZXRfbWFpbnRhaW5lcnMuIFNvcnJ5IGFib3V0
IHRoYXQuIEkgaGF2ZSBpbmNyZW1lbnRlZAp0aGF0IGJ5IG9uZSBub3cuCgotLSAKdmlyZXNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
