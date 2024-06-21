Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179B911C91
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8336D10EAF4;
	Fri, 21 Jun 2024 07:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CbtwExNg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C77010EAFD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:14:35 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57d331cc9feso193616a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718954073; x=1719558873; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=I1d26+FYwmfD9Tc9dF0H8tsiQttz7MrvNQjmOX9mk7s=;
 b=CbtwExNgFLSIpxwYV2r+dB20/IC+J8hX2gd1akS2LYK52T9mdAnE0sbC+maGTggivW
 VA/xzj+W20FeCB7KlPEzbE0mdTU0AozACzNtymUOse3JVAx+WHO0XzHR7NmMQoJSOh7r
 pUDgPEY858ydjtyiHzpqv2S0t3yJ4PQIviLrGbDIDpumlw0fm1YiedGQMTM3QgL/ucBD
 CGhVK0j0okSJe61x4avTL+hk71CCFCtzF4B0Yifk6GZY/cZ2Ezeyknfh5nA6STlCIfi+
 Rmicr5JoS6l5oPKV7xCmAthqJozoBoOKZi2Dn2Qs3cPPYcQ5Hh0gXekuaV68ueGuD8SD
 9+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718954073; x=1719558873;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I1d26+FYwmfD9Tc9dF0H8tsiQttz7MrvNQjmOX9mk7s=;
 b=rmLECzIQI4fqEH14Z4fRabmC0UqpZUZUlsAM04vYlBQjx/aCGJeZdqQlwaTZbKUs95
 V0CefNhFiF4DlHqWaZRg+5f5+ehW+xxVprjDztys1LUizvZ673mBKRti3B/q8TQOxJpY
 0BYslXsILqAZySZdXRUJfGJn1TQ7uWNxt7++PaGIbqNKfjySGN9cmaH0s6VYzv97fOTi
 YWTydbnFzOwqrSit8FH2HFVEjyTea98I5GC78zMZZJ6v12cZkENRUYaphMjcbshFEgCl
 xkNuYrfHGWmb6vj2A1k4X0Oo9QTTJDm+jG7uTEeBsoN8NsX2zpS0MBmnb/oH1arME798
 h/oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtt4CvWVK5dumz6ECETkvfRILJHkuWF1ykfQoE66+JD1cgPgRXIMcfOJAzbKtmY0vwkLXhuZc4NqgjXqLru6cYLQ54b1bSIeJ5aN69t6Nf
X-Gm-Message-State: AOJu0YxDsMjox0L9LXXLy6q+w9zHFUykSWiv77tCWSNBduEcBob8uV/Z
 LMWmBBX2JU0YrEgw5ydHzFXiwhWOm9OaABjlENurVGCPNZ6WX8bN
X-Google-Smtp-Source: AGHT+IHJQ1yPK263/uUvL42ye22QYzUxYEagwPu/zDgRslXQjOwm4KteKF6Tb6SaGoGeiBRNCTcVaA==
X-Received: by 2002:a50:c050:0:b0:57d:22ef:d055 with SMTP id
 4fb4d7f45d1cf-57d22efd0e0mr2481140a12.24.1718954073269; 
 Fri, 21 Jun 2024 00:14:33 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba?
 (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de.
 [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d305351dbsm527719a12.77.2024.06.21.00.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 00:14:32 -0700 (PDT)
Message-ID: <b7283f9458047e63e7d8c8b80daf2bd6232403cb.camel@gmail.com>
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, lkp@intel.com, Paul Cercueil
 <paul@crapouillou.net>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, 
 linux-iio@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 oe-kbuild-all@lists.linux.dev,  LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Julia Lawall
 <julia.lawall@inria.fr>, Randy Dunlap <rdunlap@infradead.org>
Date: Fri, 21 Jun 2024 09:18:23 +0200
In-Reply-To: <ZnUnFeum1Z2ahm9M@matsya>
References: <202406191014.9JAzwRV6-lkp@intel.com>
 <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de> <ZnRUSaHJhz7XLcKa@matsya>
 <20240620170522.GU3029315@google.com> <ZnUnFeum1Z2ahm9M@matsya>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2024-06-21 at 12:39 +0530, Vinod Koul wrote:
> On 20-06-24, 18:05, Lee Jones wrote:
> > On Thu, 20 Jun 2024, Vinod Koul wrote:
> >=20
> > > On 20-06-24, 12:45, Markus Elfring wrote:
> > > > =E2=80=A6
> > > > > All errors (new ones prefixed by >>):
> > > > >=20
> > > > > > > drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump =
from
> > > > > > > this goto statement to its label
> > > > > =C2=A0=C2=A0=C2=A0 1715 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_dmabuf_u=
nmap_attachment;
> > > > =E2=80=A6
> > > >=20
> > > > Which software design options would you like to try out next
> > > > so that such a questionable compilation error message will be avoid=
ed
> > > > finally?
> > >=20
> > > The one where all emails from Markus go to dev/null
> >=20
> > Play nice please.
>=20
> Would love to... but Markus has been repeat offender
>=20
> Sadly, I am yet to see a constructive approach or even better a helpful
> patch which improve something, rather than vague suggestions on the list
>=20

Yeah, just look at how many automatic replies he get's from Greg pretty muc=
h
saying to ignore his comments.

- Nuno S=C3=A1
