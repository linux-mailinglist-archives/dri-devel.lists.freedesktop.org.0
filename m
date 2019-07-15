Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467E6A050
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6AC6E063;
	Tue, 16 Jul 2019 01:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 313 seconds by postgrey-1.36 at gabe;
 Mon, 15 Jul 2019 13:27:28 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB957895C1;
 Mon, 15 Jul 2019 13:27:28 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.73.93]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ls95v-1iSYdq1YpL-013rmK; Mon, 15
 Jul 2019 15:22:09 +0200
To: Fuqian Huang <huangfq.daxian@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20190715114332.24634-1-huangfq.daxian@gmail.com>
Subject: Re: drm/amd/powerplay: remove redundant memset
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d74e5147-7429-8f11-a7dc-389714315e38@web.de>
Date: Mon, 15 Jul 2019 15:22:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715114332.24634-1-huangfq.daxian@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:eYVxtKWpPIVM//grDzhiG+tY7JJ5HMsXKHXr4CQuneDbme5j7EC
 iIrveOorAUbirnp2M6dj3yXy/Bgx1NVCzmbkDi608QvcLUSYyA3JAR6ktvVNAqEP3gV9t85
 BIUqLE6tMZ8jPxzK8g2Upk43pMnAifv8jJP0PbmL99EDt5mZDsX11dTy6RaFwhzfm3jJLYh
 DSFch7UQTcbdDLr+sy92g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yvjIBAVskn0=:zMm/gelBmTtmC9Uf3AnwLe
 5e7TG0p5vh1DoAAWWO15k+vsHmhktJdOvy8dOsyGnlHTb5T4QRrDwDOT2Ffygtm2c2wKUCM4U
 Twi1SrVO4xXQPv8lR93vLGPeLqF+eUpmWAVO4iS3rmATcdzDHFkJuZoyjrAq/4+M2oR+Vddxh
 tyZ8gj0KsZZ6jlYedKanbdggx9wFFee9Z6dpMjfNGwNhtQscdHBkDb25UWELjOWbbomyYvnWH
 yKe6npC/zZC0jPqzfYY/t+/Vz8n/OYuEqk7Igro6tA1nFsjZ09C67/mpg9jwz2UXBNtMn8urq
 H9FI0BEodFHpSysIvvoLp31GPJS0RXDDBG8NWjVALcNQahMFbuzgHLPufUWDJ+quuet/57/pU
 u89QSnIp26N8j02MbT/28ThxTz/SFno1OHYj0lYpC+nhizVO8rUDgabC/4jQik2QVViW7ryBz
 ABqdDThSNdhqDriYIpJAqqy3M8VmrPK5L4wc4gWvtI0pW31rIOD0vHxBBOHyvYoO0hpp+EciZ
 PxtMfDhmN2L9Z7e8jUcGSCnb7yFcIl646MxkoabkpQYR3Owa6dfZjgaWy8hgBX5/ar3RxI4qs
 fRE36jlzx5HgpzBiJAWR5W5bCGrOR59knRHiA93XNHAQqqvrFaAELuLPajyOEGrLIkeqgARH7
 TuejfWwz70sJwvKNtHYlVMmExcD043c+s+soo0UAyRAjwHQXxrEolWLqngmNAeQo9OKFS31fa
 rbU3rFUunh8pKVUszx8P4xtVA85lYU1YCZpYoIw292G4oBsqOzeSgm50WGWYGAcXAP3FQSKE7
 Lk44ONMOhR7vmBLUMwmhcfEk2AqVeC6S0G08fYPJhsdi+SzhrtMv4jtfOs12KYQnqaMVRCRhf
 iBMPxaRauhQDP2820Jp27ZTcC0VEUNscywJg2watE5Cd9tYNC4pzV+cGtvMjqGE5v/ugCJjl9
 beAJbXYQjThW14cjcdPGosSPCPrltIJNK5Lj0SHf0IVK79zuLY4TTTi+p8M5beMs3PUR008Pk
 p/94pYY0hBdyeg2asEFsYl324DH5KqF3faLok3/s4Kff33ZHaIJK7xCk/gi+psGG10gCLPPK2
 5EHwobNy1zpIuzl1Pymi1dnjHrngIwyZ2PG
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1563197243;
 bh=m3ETQIoQjM+lw0ppVqdyQxr42kV7UN1emuY55x6te74=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=XB0uA8Cx2BuSi5bfTwHNUYddiWt9+YdlSbSSuaqym6sTMh+MKHbG2Q+XggD519yzp
 gkKNuspKp+jumNYTk3PlFIZrPxwPbt4JS2JD4V00Lm8W4+jgR9jHu/Sz3lVRE1qyJc
 n0iSzXNKKpTtcPMF9tSrkHpE2ziTVJ5l6PEtKRT4=
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBremFsbG9jIGhhcyBhbHJlYWR5IHplcm9lZCB0aGUgbWVtb3J5Lgo+IFNvIHRoZSBtZW1zZXQg
aXMgdW5uZWVkZWQuCgpTZWUgYWxzbyBhIHByZXZpb3VzIHBhdGNoOgpkcm0vYW1kL3Bvd2VycGxh
eTogRGVsZXRlIGEgcmVkdW5kYW50IG1lbW9yeSBzZXR0aW5nIGluIHZlZ2EyMF9zZXRfZGVmYXVs
dF9vZDhfc2V0dHRpbmdzKCkKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9kZTNmNmE1ZS04
YWM0LWJjOGUtMGQwYy0zYTRhNWRiMjgzZTlAd2ViLmRlLwpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9wYXRjaHdvcmsvcGF0Y2gvMTA4OTY5MS8KaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8x
Ny80NjAKClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
