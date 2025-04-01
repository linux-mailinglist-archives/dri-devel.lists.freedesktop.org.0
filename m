Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B5A7746D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 08:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2CE896E9;
	Tue,  1 Apr 2025 06:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Pt4YSK/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A8910E27A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 06:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1743488323; x=1744093123; i=markus.elfring@web.de;
 bh=mLFMFxxnB4HFSX6cDRqMCxHvEjCtGqBL4hrLzV0ECUE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Pt4YSK/zYh+UA82LaARDoYmDSkd0lZnfWq6RXeTcOXwUGsoRLgsoVuYZvMfThuSU
 K+h5c9mRfWTtdLTqHQeGs4yvXAQ2FIGQUZ0ZVb6kfEqNEG71WcIdVZvSvQXIgFGVW
 O+bThJOb447UFWCEZ7x6S0SA4B3HkbwJMid02tT4ma3ADWYFEEEtB2g2tAsJFVm3e
 Qs7Z++WO/DYQx+v6JPlr/eUdLmq3UcH9CPRhXjovwHWHD6V57AI7vlJviWFA/wcnz
 OVysp82Uxs787dvfiWsQWNj4A8ackQ3uX3s86dBIANcPFSSLmbHp5vtWZFHbNecR/
 1WiPI4bU5lCCyWJ5iw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0PR-1tpMUQ30kX-00HN8H; Tue, 01
 Apr 2025 08:18:43 +0200
Message-ID: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
Date: Tue, 1 Apr 2025 08:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Thompson
 <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>
References: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fE8a327Xw3HBuN0WBwRxTiZD/qUsUvAEGdxo9UcXdU5HnFaYLaI
 +FoMTSCp8Lg7iDnfCBbuNl1sE1pLfKHC4xozs+wJZ8huc67ozhOpwGyPYxxMPzp80k7ZqiE
 bH/yd+EwqIVCMOpQC18ultCSGDlsUGk4jwxcsSdT1IQ3YSYyJqao/27E4nUY5tqi1fBHiJg
 /LH9gnCVJNtzEMfEzqysA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d3sUKZn9w+s=;wE54zuIyP2XuKXbOn8VcSGOkHTl
 d7PiJE3oGyNxhsgi/OJjVjeH25IeI9Gg+AJGkLqGKmB65IFw9pJlaSyar62RRx6fR6lAbqyDG
 cui99ULsjroq5fT78lJU0kDfee4QwXOJXwl1+CAT+0jbv9xk+Z26HImfZZk6SgH6ozKuPYBFV
 PG763niyRRTFqSrdMRhNbcEjh+3MyVazz0LVO5F+brS6bHBiNQJSHXRbhEjqgOa1GBooFg5fZ
 eEGrX6WRKBQSkin5RCCivnlGDh1cfHgY2e4xMA20L9rUW4F8Quqa17M29oz6VA0QzvLaCRg/R
 ifF2Z0Ny22q4ZABjnflBipFYqosQB/Tzo/bnptVkF8oS1tI4ZgdzfvCNf+Ap5UXGeoD6Inu/2
 TTrVX6VMPOwbUV+OeP9hgRIadFCor6BweG/vf3UoD76ZGoa+XcWQdh3PpGW7mJNQpmo1yxdz1
 Nl9gpF3aCW3PdL9hJiUXpFzM/H5dHxCPKD8qTwWC8OF0h6P6D79zO+muBi0qNuDPP7k2O+MxI
 LcifHxpKCgcqGfVW0Es3yO0uPrHlTD3XXM1FS9nPb4f7yMgiYjTiymUqnhT80ootOEP1EEh1S
 71yOqu5vnzKB7fmZ+Xu6doklWpfem4PAEOKJulCY3dYSzn3fjSpRDPb3xi1Kd0aSPFlxDJXJu
 f5U932OGNsJIrI6DE8RvY4fAVsSS5UOcj7XEWTJl8eNPGrOteqgXCkZf5Lx4ZFli/mP0b2MCE
 8gKSzib5L8P4wlcl1CI7G27ZrGiEziUCtClNqpNBGl+W4RHpwr6ziXpiuf6W8h3aFk84J7KWK
 S0UcgOnckCsblFfsefDC/GFIH/75mdSSNIHuo/thPeVnWsG++BS47pzG6AtbSXpIW6fKVtKo1
 nmKNGyNW+rHPH4MSsaCK4B4pS82rnhWJyUXBO8UUvLUaM7ayWtrr03Mis9K5CZjGW7twYm4si
 k5r5BNR7qRmXWYm2kst9x463CdGjKJcdyWEW7J1OXRpwr8NWe482CCUeqIklWf6XjUsjZHc0n
 JDyv4opqFeKEroiTjH60KwkU8cxHicg2cgh8RNdPfKd5u6wzQGIytveirDOcl022RpXeIc4aF
 xMAKq+7dv2r9F7RUtKxiyAIT5k0oVhD+T6CaS3NbJlJa/HHdIQ07JLU8Lg2TiLYgHaFpfHti0
 lK2TZFLu1L8lJkH7Jc2hgBTSs+PBhSv/zWYYCmlFxoBsL4QU1E/1Al19Ku2XL1t1DU5O6WA1o
 g3LM8L4R9KS/22udR8U1ibK1/+d47uyXP3BZ8WM8oliJeAyUaxUcSxOMSPP70vLaDUA4QXWDi
 MPNv/Ym4+lkHMo+lyYjj+wu/SBBBobFeJE4qS839FI4fYMQ3yC27gJ6ZtxBGVdNSrTpMUKXIi
 ck/1IgE64jVi13crHdke9uv3B1CBcNdFwKm4sKzOnikvIvbOAiQm+M21Nqykd8aUgZTcIm/of
 PtB0mpMUVd+IXklbmDPcKQUTnbhdVEs00NzzcNGFtvBvyAC6xUu/GtmFRhflPGM2+gVP8tg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> devm_kasprintf() return NULL if memory allocation fails. Currently,
=E2=80=A6
                call?                               failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you propose to improve this function implementation a bit more?

Regards,
Markus
