Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3A19F0E1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676A089FF6;
	Mon,  6 Apr 2020 07:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E4589FF6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:38:10 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h6so6452879lfc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 00:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=y/vsYsSK347NGcDbBlGxiDR9TuwfcgK2h148wOGntc4=;
 b=XVFFvRbAinJ+BEsDnYgB57PWfp/Zf34UTwGrxCy+CdkaFTalmpdRS0+g4zeQ+OmwgT
 NEbliAskkDuy5dwWijf2RLOxFzD6ehO71UcWeNzdAyOFj/9nvi87ZY+UkIAdBBVjFsxY
 28H3pHsbVySs6m5BIa51U6z9aEMmTtp1uj3TAOsIAY4Zqh1mzS8Ra7yvBol4EnCAJM1s
 TQJWMsXiryOI/xmDyiyxQcH4FUmw/nt9uTyngk0hzawq1QlU5crlder39jaJc/Qp9+6o
 9ecgPZh9uMNUuzxJIfzdWv/q2YVmzYEZyuiGVf6Gv49B9JKBpZjM7Asp5HcTcURFbLK9
 IKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=y/vsYsSK347NGcDbBlGxiDR9TuwfcgK2h148wOGntc4=;
 b=sTiwDsE+mb11Ovf2W8YbKCWscmlZKTp2qjeqNTBQDxo6mPLrDcoEnBQeRq0JpbUVDt
 d8bhEveEdByEB4oLzVB7smixvIwNi/C9aDx9uAul/cm9btW+U0KyhJFggcp33T5a6eDR
 7RZjy611VWESkQCK5R1FR8kW0lptnu9P+nHkJtf8ZutYwNVgZyMxGUi+78yM/+AVRiM9
 UHY0Tn3YlHWMFlNKjJg9BwT5PEWpFqBXN/NCYNBQR/O6/WDGedHQSTtGn2tp7RYmY+eP
 tVMoVH+6OFPcUn52ArSXb9ZOtIWvb3LqRhLeX6eLjxeHlXQX+2mxZJ9PLmiIfXQQo6mB
 mxrQ==
X-Gm-Message-State: AGi0PuYtr38Y3NoULIXgpTQKY73GIf8S+MUliIPxeZshBFug6uwxTx6y
 06QnDbz+R0Gh6EEbMsQnfbw=
X-Google-Smtp-Source: APiQypKmxIdXHjYcrf9rWedfxk/q8eOWs3j3tEDFVxuTYOnVr8JpxLKWuqGbNLAiGXMLO9cTmrq+Rw==
X-Received: by 2002:a19:ef0e:: with SMTP id n14mr12220596lfh.61.1586158688577; 
 Mon, 06 Apr 2020 00:38:08 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r206sm3703618lff.65.2020.04.06.00.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 00:38:08 -0700 (PDT)
Date: Mon, 6 Apr 2020 10:37:58 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200406103758.1be49f78@eldfell.localdomain>
In-Reply-To: <20200401151332.GU1922688@smile.fi.intel.com>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
 <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
 <20200401151332.GU1922688@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Petr Mladek <pmladek@suse.com>, linux-media@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============1122116835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1122116835==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DiWGmGA9BuE3BQZbAQv63qz"; protocol="application/pgp-signature"

--Sig_/DiWGmGA9BuE3BQZbAQv63qz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Apr 2020 18:13:32 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Apr 01, 2020 at 04:13:51PM +0200, Hans Verkuil wrote:
> > On 4/1/20 4:05 PM, Sakari Ailus wrote: =20
> > > Add a printk modifier %ppf (for pixel format) for printing V4L2 and D=
RM
> > > pixel formats denoted by 4ccs. The 4cc encoding is the same for both =
so
> > > the same implementation can be used. =20
>=20
> %p4cc ?
>=20

> Another possibility
>=20
> 	u8 ch[8];
>=20
> 	if (*fourcc & BIT(31)) {
> 		put_unaligned_be32(tmp, &ch[0]);
> 		strcpy(&ch[4], "-BE");
> 	} else {
> 		put_unaligned_le32(tmp, &ch[0]);
> 		strcpy(&ch[4], "-LE");
> 	}
> 	return string(buf, end, &ch[0], spec);
>=20

Hi,

mind, if I guess right what that code does, I think this would confuse
the fourcc code endianness and the pixel data endianness. I think fourcc
codes are always crafted machine-endian, regardless of how the pixel
data is. At least, that is what drm_fourcc.h seems to be doing with
fourcc_code(). That has nothing to do with DRM_FORMAT_BIG_ENDIAN which
refers to the pixel data.


Thanks,
pq

--Sig_/DiWGmGA9BuE3BQZbAQv63qz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6K3FcACgkQI1/ltBGq
qqcp8A/+MFQ/BvUrgpGrroUNyMx5PPIdWVMcfUFCr9qFTvHtgEGi27qifT7TYdgK
91dOR+rQKOE4Dhx7/3NPtr+qq8LSI2/zV199rrbCFhiCsqRLQLQwNDUF9oPqRXDh
FRQXaniCSLU6ROYj5xxVA0SYYB5SxrP7k5H6fHnzodu83HQg/yWmUrHoWLZscdap
Vj09jcfbCzICbwet9l+1fXfR1BNQPp9FQQxfclCQWDyeLDhMmYUcXT+7bayUlzLs
lAeO6gIZBjafsipFnf7sb6viVRVa7lmzhnzLuqoSaCdWoYfmyBCrP+sUYDZbkv7K
mEKeulPbDldxaWl11h6yJvVZusRoX4XM5xLl1JzVG5yTmqsU/oSjt11guMG5Z/0t
/Ipfu1TK4F7/dD2A03+DX2PnRgFtK0L9xVSmAhxj3Z1qwvo9Myvjqkbu+cHu0q1N
TUYT8ILBVmhgYKk3BqM1YYQo4OMmOglzDxnxWlnSPXxdEo1zaH8p3VaCxBPJQob4
XIurW+oIJwKHepmOt34RLbOaIAr4ypfaw4vtUmOLLSiTO8RkeFpeWQpiMqA4gRLq
bJuD2UJzykFx1uwsKwLmE18eT32q14R0JSkQP8WXj9BioAcOE6gct+RltRngK+gL
2G94ro4TnIBTJihF1srsE2EqE/m/wd6wdNM3GaYAAmJSOkj0Q5I=
=8lW6
-----END PGP SIGNATURE-----

--Sig_/DiWGmGA9BuE3BQZbAQv63qz--

--===============1122116835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1122116835==--
