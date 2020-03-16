Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E118664D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 09:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441616E364;
	Mon, 16 Mar 2020 08:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C986E353
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 08:05:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02G7x3fB004532; Mon, 16 Mar 2020 09:05:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=aAX015zEGt1iDYd9fLCWz8ZRf1VeNZVoWYmUVUrHks0=;
 b=f2vC4EaeDXBjoM0/YX0nT/EhpV5U2WjmtwN+wNbFsRnKDCeUC4oxyYFOqzbtdOIaNKB3
 38gSfGtLXWQ9j/VNRqXm9g4HxG5gPGd3pSc0uVeQdAWo5tG0OWarn6hQsVEYu3WFrVSI
 6pAG1WgNVMvdwub+41DryELM43TBY/RZUaYgUTD3ducrNqLOanuXoBS/wTJNiePSlZ6x
 tFPbnlKLUznJv6yWirKahnHEcKlnEHU0uU7Zq060Q5dkRjHac2XKCATtEdA/q2vtWMuJ
 IzHKMbTxYIOnts2a5c08j76MjtmAh3ZFAK2xI8q5wj2TMwktQGrVN0u1j/FRkq2Jj9Y7 FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yrqa9e9hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Mar 2020 09:05:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B18E410003B;
 Mon, 16 Mar 2020 09:05:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1DF221E687;
 Mon, 16 Mar 2020 09:05:07 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 16 Mar
 2020 09:05:07 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 16 Mar 2020 09:05:07 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: adjust to VIVANTE GPU schema conversion
Thread-Topic: [PATCH] MAINTAINERS: adjust to VIVANTE GPU schema conversion
Thread-Index: AQHV+ppWk7Ve7/6Ys0G/uL6TUzmfJKhKzTwA
Date: Mon, 16 Mar 2020 08:05:07 +0000
Message-ID: <18450dfa-a150-45df-5b9c-c543c110c478@st.com>
References: <20200315072109.6815-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200315072109.6815-1-lukas.bulwahn@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <6D3788AD8A1BE941B64C12E7789BE437@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-16_02:2020-03-12,
 2020-03-16 signatures=0
X-Mailman-Approved-At: Mon, 16 Mar 2020 08:21:33 +0000
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
Cc: Joe Perches <joe@perches.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/15/20 8:21 AM, Lukas Bulwahn wrote:
> Commit 90aeca875f8a ("dt-bindings: display: Convert etnaviv to
> json-schema") missed to adjust the DRM DRIVERS FOR VIVANTE GPU IP entry
> in MAINTAINERS.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>    warning: no file matches \
>    F: Documentation/devicetree/bindings/display/etnaviv/
>
> Update MAINTAINERS entry to location of converted schema.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Thanks
> ---
> applies cleanly on next-20200313
>
> Benjamin, please ack.
> Rob, please pick this patch (it is not urgent, though)
>
>
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 77eede976d0f..50a7a6d62e06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5766,7 +5766,7 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   F:	drivers/gpu/drm/etnaviv/
>   F:	include/uapi/drm/etnaviv_drm.h
> -F:	Documentation/devicetree/bindings/display/etnaviv/
> +F:	Documentation/devicetree/bindings/gpu/vivante,gc.yaml
>   
>   DRM DRIVERS FOR ZTE ZX
>   M:	Shawn Guo <shawnguo@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
