Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9881AD968
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 11:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9636E3D8;
	Fri, 17 Apr 2020 09:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86436E3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 09:05:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u15so1263027ljd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=e8kOpv98LzmKW3f6/Aqb5L7ubDGfPOnZg7un0agq4Dc=;
 b=qm0t239P6LTCOVyXcUzlduSsLPtycQ7oACPeMWcpdrHT9xG551Yh/vgI/4thIxjBg7
 +nFtnvSaseHVvkhvXtObbCHyJa3XUrGv3Fx69yuB4uJAFBBpu+2yfl/JGZ8K6+UWbBF7
 jQjsXizyYeJE2khSW9s8zpxxREntHBteM9LZ3nef0vORwDpAxF8DIaSxGubW5mLbtlvB
 ubuOE2cG7JINBnecwkUBrGopLv7B8iJFlwdDzMkGfiueZ9Umnnfrvx0nXI0kby2QFpoc
 ffGC7OvYTAZMzxQ+SFq14fptzrMGIYFZl2NygGpTvfkiFEXlIQQL77qR7vgWDY3t9U9d
 t2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=e8kOpv98LzmKW3f6/Aqb5L7ubDGfPOnZg7un0agq4Dc=;
 b=PyjVvEzmZXkPHq1HJLW0O+d4bQt0PdKxkoNjIhkrkByhbcf+6EumPFfWVy7euTGlsk
 7G6gBi3AE7FQT9F9trSNCPg6dPWzXHZESDM2iaufuonMgAjUKSrzthbA/WeBxIp+pgIP
 X6DNpOoJkVfaFhmSWu9K9DhfacfuPmXVCdVPqLlTk/N6QLhefKIysD5t1IMbXGs76F14
 i8nLYJuEqDgnmuPcv1KRcxxenV+uVTi4nBgnsma6kLlfbp9//seqp+2/xC7C7yGSzuVR
 FC/wYvzAU6uRQThm/PbZGdVuYHNNvnS2R9Vd6FNzUPlYNJYPRO9esTjZiX5859n2sQf2
 ayBQ==
X-Gm-Message-State: AGi0PuZdo0siunzt1e58xcsWs9KHptrNRcDYZI7uvBHU8Cn3LpWnUcH7
 QC2uy6nS/zxZxhN2glGljEU=
X-Google-Smtp-Source: APiQypJ515wp178XFYQNpV7+xTTqEqWrVKMz5i7KIwQviT+gbXm81ZF+LYsSeslKy2t9oh6HfVWWeA==
X-Received: by 2002:a2e:994a:: with SMTP id r10mr1497730ljj.105.1587114311236; 
 Fri, 17 Apr 2020 02:05:11 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y199sm17594854lfa.80.2020.04.17.02.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:05:10 -0700 (PDT)
Date: Fri, 17 Apr 2020 12:05:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rajat Jain <rajatja@google.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <mpearson@lenovo.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200417120506.16db8df9@eldfell.localdomain>
In-Reply-To: <87pnc84frl.fsf@intel.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <CACK8Z6HZe0iiyYUR57LvQVJjZCt+dbK9Vc9Tr+Ch8fUuh0h-gw@mail.gmail.com>
 <87pnc84frl.fsf@intel.com>
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: multipart/mixed; boundary="===============2006245895=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2006245895==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d0Z=XobJBDCcO6h7Krk2QRY"; protocol="application/pgp-signature"

--Sig_/d0Z=XobJBDCcO6h7Krk2QRY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Apr 2020 00:10:06 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Wed, 15 Apr 2020, Rajat Jain <rajatja@google.com> wrote:

> > * I think having 2 properties might be a confusing UAPI. Also, we have
> > existing properties like link-status that can be changed by both the
> > user and the hardware. =20
>=20
> I think the consensus is that all properties that get changed by both
> userspace and the kernel are mistakes, and the way to handle it is to
> have two properties.

Yes, I very much agree with Jani.

I don't like KMS properties that are writable by both the driver and
userspace. It's awkward to handle in userspace and fundamentally racy
aside from tricks like "what you wrote is not what you read back". I
have ranted against that when looking at HDCP properties, e.g.:
https://lists.freedesktop.org/archives/dri-devel/2019-July/226424.html

See also my other email in this thread about how userspace uses atomic
KMS UAPI: you must expect that userspace will always write the
property for any KMS update, even if it does not change its value, so
any change done by the kernel is randomly lost unless the property is
read-only or otherwise weird.


Thanks,
pq

--Sig_/d0Z=XobJBDCcO6h7Krk2QRY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6ZcUIACgkQI1/ltBGq
qqf9EBAAok7A69ZnHeZlCAWyl90qov+2vdTMl0GFxBob7J3OHI8tNfAfCkMzMWRO
Sf/mevhncofjOnZsTYE2rUBqlf+sazvyMnVQdSmkwIcIrcAnySwtHDBY3l184Xet
vPuC9sLjR/uZvTN0ZndFR6PtZqu7CSB66UNWqAYHzWv+b5nBQi70g8/7dHl6KY+6
9xnZbac06pVKZRRjQJE13VkQoNOKiL6HEluEY1N5LY6+Pdn8N7jGaF6B2owSEfBh
ev9ZAiHiAt0FiPEMsDVOD6WyI+Odl7D1uWREGnyl5wuoz5Q3aUINAblabuWCPkjz
vBDD+YEll+Abgk3ztDq4aK0dujCKbZIY8BLQG7csTRT2FYVT+m52Sd2PH3+nZZGY
dYg2cIT9kIRLjWG3zd84BJx5TwaRv9Z5JVCSs2RA8sWuKhOG04vMZzBCJ88Nt6qa
tBpMLAetTjGukV3mLzhxICwNHcReZnC8URJpVb4wp4/niHgXYZYYm4gF4HXhVvpO
00v3oqHdQfkxusU9bSKf+iyVYXldhCDMk20bkoExtChlCQdGwxM+90bNBGlZU454
6Ihd+eH6W0BabjR2h8qQ2XFkVFcM3nWWWAqtmV+9KYZdBljAoz9kej3yjzb0vqhC
i08yXs68GaQpmm3Pf53lDEWuhrFk/zr6t5nDLKM2/SpNedY0L68=
=47GD
-----END PGP SIGNATURE-----

--Sig_/d0Z=XobJBDCcO6h7Krk2QRY--

--===============2006245895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2006245895==--
