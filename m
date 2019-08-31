Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADAA4FC4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FAC89BFF;
	Mon,  2 Sep 2019 07:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Sat, 31 Aug 2019 09:22:17 UTC
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB1D6E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 09:22:17 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.129.60]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MXHt7-1hjODj0cab-00WIUk; Sat, 31
 Aug 2019 11:15:26 +0200
To: Denis Efremov <efremov@linux.com>, Joe Perches <joe@perches.com>
References: <20190829165025.15750-1-efremov@linux.com>
Subject: Re: [PATCH v3 01/11] checkpatch: check for nested (un)?likely() calls
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
Date: Sat, 31 Aug 2019 11:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190829165025.15750-1-efremov@linux.com>
Content-Language: en-US
X-Provags-ID: V03:K1:qKSdXHHLYLKjlRCvxxm0CG4/ObWxvY7GHVNBMu8mxxGycRrayx8
 4PbzO2dvqjNnF+AFg4bA1W4zmeQSpNZ7vt9DbPnL5lk34WKJYWD9NUPM0PlrCLMjYkm1F6U
 BXfMva6PP5qxs+6jegtT9nR1r+jzSjNeTTC2AqMHglXEtSWbQLq9Fa4eMsUVMGo2eepnDXr
 VwnOxGgwPijQTQTX/f+uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H6gMtbzIPLg=:gHtLMrVUPpC9EACtnudAjs
 6gGLY4aOoSCTa5hpDZnyHMaAtw/0OFtX2eLiscuphpsyRFM28EwtFIHcOFUR/POF9rnInz4h1
 L/QucSEVmvIKMN1E9EcL5+Lm2uGNe1hVVRom6jYko6OuXZ82KMcgK3YURYeOxaQyaQXFFRi82
 hJ6n6co7dSCXZhZSQxFvHAbTjvSgFxAMmZANsbevd7AkIf1gmrjsfV2ss/Iiwzye6Pa6XzKNS
 TBP50p1eaSwIsLR3I55Dcgt97h0dS+mNMPRY1w4SaJGwFubJ3l7AEoK1hRMwHAKORTQqVJqge
 s0Z0sER1F5ZhrGwKyV5UicE8h/ZRFzJOPErlC0nbWB9rK8aqAgLAI9g5TS47kwJJYIXO9dWTT
 /Gl3Vrv3SpBMuNuzBYezRowta99H3nRnyC9y+j2LcvWbX3o+vK2aTkHw9890/0KiqTzBpHX9c
 TWa91c8pNbeY36QglKaGC3ZxAkYzoMhO2Rb1JIBYm5+FoESnRWMxPTyhbhpMKK/EsvZB8d2U9
 YnGZRT96PST2rn9DvrjYFWcE5KKywmts+bIoj8WUANJNCL/NLMWZWKmtdWwxvmLOK6Mz+8Dfi
 7JQTKJcc8kPW5QzXQ8i9JSD6sgrD2wt19HzuR2W/wbtxryEtE07DOg9fP0+FZlbfq36VOEDur
 sTaG6YAQYz6VXOrJ/hPBdqnHtRxVRIUu4HnHq8CzFzP1ZYJsCyGLJ3lw1Cy8emAcuW2Z548rr
 3ENA3myF9ToRaxMK1vAkgA6GH2g0WTiYZBXyhf4siOcOkwnca9h1vy4n7ZGYyvPd/7rqn/PtF
 BaFbmuPmYcNHfdXJxx1uPSSSl/8L3YQdTHn4oxNWQFo1ZgBQ9Y7ye2d2OreAXSNNBKpSGLqt+
 7vTidg7X/m9ChqNWz7+d1NGxZTH3f1iemsqXuEOvPZ5yAisSRcCot07+XOvbP4MMWFOcTLzRC
 J4ih9+35bbxlUYFMkWq+6o7m5XXfAcE9JxlfhO/1s+tlPsV0IBvWqv+8CjsuISBnYf8DeEJPP
 r5FSIFxTR0VqIaw+lUCM4z6N67pWIVCHv8LvFb/JD1rXu4SsxzaaW4g2DaPX+i4/HDfglK5u0
 f20JBCS6QtdWff8hCOa6IP59UG2EpYF3dkG4NJ/D4YDVEO5CMJNdcVrH2OtAZBILzIr2slNj9
 NTy/2+CNqgF7V+rMiK26ziNroccNm2hkTS14nUI4tozfiZ1VrAXq8VjOBJqEeWBq7F0EI7vQl
 cItTU9BKCEHiioG6s675LqrhWDGRcu3XvttVr3DxJJKtXP81jHn3RsYp7tFXB2TijGookHGiH
 5vDzODPIiuX7SQf0QylR6HNV1A8it39zfAzQHXtziqzMf7MBowe53vmtwQ/UR8eV5Nu9k0Zea
 3gRTwRF9QW+txwvgiJ3RndIwSabPTh2UnaD06xTAfw4TqwHuvJmWWQGpqhqyXVpnVtTGQvRhe
 MEXt1IgNOp4A==
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1567243329;
 bh=W42yxbYmQCv9tl6YPZs0YFC5fDpZrDuUEO40d5+J5IY=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=dP5+TfUfce1t3Mj07pkj4YRkoZKRP64m7gvwcfNTcNrFs7gL+5W7Rx0QacMZ82NRo
 TsaZ1jFiZCNWYFs0UmqRZC2sdPQ8OwYr7ZkBmAf4WP3ktPIpioRvJy6hXaCVVrdpDq
 uzdxBmc5K6HiUeZUlZc938eaMYNA8q3YTfpdcqxk=
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, linux-wimax@intel.com,
 Enrico Weigelt <lkml@metux.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiArIyBuZXN0ZWQgbGlrZWx5L3VubGlrZWx5IGNhbGxzCj4gKwkJaWYgKCRsaW5lID1+IC9cYig/
Oig/OnVuKT9saWtlbHkpXHMqXChccyohP1xzKihJU19FUlIoPzpfT1JfTlVMTHxfVkFMVUUpP3xX
QVJOKS8pIHsKPiArCQkJV0FSTigiTElLRUxZX01JU1VTRSIsCgpIb3cgZG8geW91IHRoaW5rIGFi
b3V0IHRvIHVzZSB0aGUgc3BlY2lmaWNhdGlvbiDigJwoPzpJU19FUlIoPzpfKD86T1JfTlVMTHxW
QUxVRSkpP3xXQVJOKeKAnQppbiB0aGlzIHJlZ3VsYXIgZXhwcmVzc2lvbj8KClJlZ2FyZHMsCk1h
cmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
