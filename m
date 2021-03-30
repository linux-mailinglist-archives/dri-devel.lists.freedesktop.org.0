Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4C134F2D8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 23:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408216E982;
	Tue, 30 Mar 2021 21:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46D16E982
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 21:12:42 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id j7so12991503qtx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvg5KeeLafDks20d9MA0DVK+cDxKZn2jW/3PZAzDQ/c=;
 b=k33NE2CXIobJjoB4dL34gEB0xWjLB3X1YdTxpiNE4m0w39+avHYjIPTlPYWXgE++hd
 CGQkltFiOHlY66qiAVKRvXxWVeakz1vHzUgjMGABg2PdcXzfe4r3i+hllFqwhr/VX80V
 uTac3mVQxYNW6lBVUmFdY/ZTI21BQcj9z97C+l86gNTTNqfOUpNO1cef3VITKGOdj5ZS
 ptEdf7sJdINv/ay1cfflAq7AeGQma+759sqdmJKNeuL+0T3qU0k3TxjPWmmAuFuQt/qP
 SnTM8sTfRkspWWUd4gwPfQngwZ66vFuqI7L5F8zrbvx6YUTXzNQsV6Apc9bQGppT2onR
 AZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rvg5KeeLafDks20d9MA0DVK+cDxKZn2jW/3PZAzDQ/c=;
 b=Ij5LCs5HZBkw+WoAfPOkpbts0HcP7QVn4QNAjK3nEBWyMUuulp8G74qxlOI6KzUtXE
 CiG51tReyEtJbz+I8niCdTHmYOEdm/EeB0YIPIpEvD6VnZeOMMO/HY3mRaaNgon2/bNa
 /AT40EGUCg/fpzDBBDSgPprBTrAH5uDpiAiCdU8GMpiRx8MBkLSPbCuNQmIE0P3yse/0
 xHx64fED/gtDVXa1lNYJ6rerxTQjt8V7tQ+GXSHm5alh7ga5nbOB/FWYV0rUcPxKNu/z
 vrBsgkHh44d/qaVZFHej/fVFHPagdAClB7ghp861voqyVCP/VBPEY9OcGJ5KDnfgp9b1
 McrQ==
X-Gm-Message-State: AOAM531IdhxxT6M2XxHcIlvlT/HSP9LqJClw3jQ48ZEEdp2C8rQbSoZ9
 7Cwb4I5TA4SdpTiwTJevTkU=
X-Google-Smtp-Source: ABdhPJzBICbv2tB+pZHOQUhX9mgUx+2f/OIMBmWy7u6Wt0v1ME2jB1BtLU0fWk8lwylmTW63ROdomw==
X-Received: by 2002:a05:622a:454:: with SMTP id
 o20mr28861530qtx.292.1617138762074; 
 Tue, 30 Mar 2021 14:12:42 -0700 (PDT)
Received: from Gentoo ([143.244.44.215])
 by smtp.gmail.com with ESMTPSA id b2sm119921qtb.54.2021.03.30.14.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:12:41 -0700 (PDT)
Date: Wed, 31 Mar 2021 02:42:21 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 14/30] Revert "s3c24xx-dma.c: Fix a typo"
Message-ID: <YGOUNbCJOHLmeHm9@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
 <YGNgFuLWc91aGoQj@vkoul-mobl.Dlink>
MIME-Version: 1.0
In-Reply-To: <YGNgFuLWc91aGoQj@vkoul-mobl.Dlink>
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
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Content-Type: multipart/mixed; boundary="===============0961233958=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0961233958==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yapxdGUX50HbkJ4L"
Content-Disposition: inline


--yapxdGUX50HbkJ4L
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 22:59 Tue 30 Mar 2021, Vinod Koul wrote:
>On 29-03-21, 05:23, Bhaskar Chowdhury wrote:
>> s/transferred/transfered/
>>
>> This reverts commit a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.
>
>This is not upstream, why not squash in. Also would make sense to write
>sensible changelog and not phrases and use the right subsystem
>conventions!
>
Changes like this don't deserve a history to tell, specific to changelog, one
line is suffice.

>Droped the series now
>
This is a bad commit slip in , not suppose to be there, thanks for catching
it.

Sorry for the noise.
>
>--
>~Vinod

--yapxdGUX50HbkJ4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBjlDIACgkQsjqdtxFL
KRXbEQf9HOVQ3RETxBGqN9aTy39IsbyS5nu7/kFDhcZEJysEreLDXKPWNNQ2PX5w
cirIvKOlvWXDyrO8kTzZj7lyhdV4i20kBx+wWdBZ5Pzgxv7EsC29/u3MLwHH9eWk
/yvTPpfI8KLYpPNMU8bMS8NKR+hP+75gM0gGO4zmirTubaAIH9709n3MVg4A7Qlj
ZdJE1MCUqt+VHUnBqZzu2Afv10gBlrsy671OsH0K/m8/ZOWoIKg50Epc7s2/LPEg
DnYTel5gyXWtZh4thSXcjV0hm5Q6jzE0DQjGE7NDxeI8yIz4c6hZBJ2OOTXp1h2A
O5yOuKgqXzo95RFK6W9QSbfhv3erIA==
=mURO
-----END PGP SIGNATURE-----

--yapxdGUX50HbkJ4L--

--===============0961233958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0961233958==--
