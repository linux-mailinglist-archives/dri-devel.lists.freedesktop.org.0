Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6013319C18E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 14:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B676EA87;
	Thu,  2 Apr 2020 12:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2996EA87
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 12:58:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i7so3991693edq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=9evEKXpMQs4hMH1CeFYBrj++VJkhkh/uSjh4IowfIYI=;
 b=iVkJu47tmYjQ61RtRPOn9VzRk+ZqKRIzny94k2ACQPzPOwLqHDi+l1kBy00BTO2qyf
 8Zuw0j/ummFMfzxk2bxduSHE2PFTzCsTH4Bpl8ngWbYdy3aPasH5Q3maXBK95C3Du7Ez
 fF5fZh0o8Bdvh9AK3efTUqWAZT3G7kAjLBTC6pAkNNn72+eLv/E9GZ2Pfbh/bG78anie
 A8hjggMomRxxSxyPdPau2GRJU6cL8YBUScvJHygUSAR8A5Ti0b2otDBl+g8A8Rcta+0L
 93FFk8yOUAPLm9RDIAQSoctct4zLwKcY8VbUi5p9TVZGhal/PgmbaKPCdTW6wsa6MfgP
 FJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=9evEKXpMQs4hMH1CeFYBrj++VJkhkh/uSjh4IowfIYI=;
 b=JGbFtwkm1KXXk2owjE7V6FeHYo4mnNYCuuiBZFf7BPaRPu5zjX7nUaVKcJl/77Kg6A
 YNLRDOLarF50PXop0dOBGzGSKOaRayqblJwbM347Zw2+0ecCFbUymj4xW3XF8jiOlZIe
 iCUpOogVVoTyEnxWgntmIXlznR25cfFnOiNhwtAYxHsOBGFH1mFVYhA92UVm4qUZQwGl
 4KdfjsMVctd/Y+gGE8CYLQ47+k2+a9IyKHq5AXpHnL3UoyhDKIs8ZdM+kcveqXjPr5vd
 x7aj29W3aTleQ0QsZ5nomKOu8LAE9PBabV0eSBtNCBnv0NI6GqWPaMC8JgVnZc4jFJgt
 ePfQ==
X-Gm-Message-State: AGi0Pua5y6zqge+lPLhp4UOUTufoQUYYt6KLm792J0azfh1/C6+WqH3w
 C2R1/G7CIEmsqaU+ul8xeTk=
X-Google-Smtp-Source: APiQypJ89VG/VbaZTs9u54hHYSj9DeNzuAty+fI9QqVZU/0Qng/AUZKv2ZMd7yb3soIx5WRR11AdyA==
X-Received: by 2002:a2e:8602:: with SMTP id a2mr2013459lji.160.1585831783766; 
 Thu, 02 Apr 2020 05:49:43 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d19sm3084423lji.95.2020.04.02.05.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 05:49:43 -0700 (PDT)
Date: Thu, 2 Apr 2020 15:49:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: How to handle disconnection of eDP panels due to dynamic
 display mux switches
Message-ID: <20200402154934.04917382@eldfell.localdomain>
In-Reply-To: <20200402113925.2zvatduiyqld7pj2@wunner.de>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
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
Cc: Daniel Dadap <ddadap@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2004073000=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2004073000==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vtMO/AjXHku=qA1FI4k/Ih4"; protocol="application/pgp-signature"

--Sig_/vtMO/AjXHku=qA1FI4k/Ih4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Apr 2020 13:39:25 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> Note that vga_switcheroo is currently controlled via debugfs.
> That is a historic artefact.  The kernel has since gained a
> mux subsystem in drivers/mux/ which could be used to represent
> the display mux in a standardized way in regular sysfs.

Hi,

if mux control was in sysfs, then how would userspace figure out
which mux state refers to which DRM device and its connector?

Maybe some DRM connector property referring to the mux and its state?

How would a display server running as a regular user gain access to
sysfs to control the mux?


Thanks,
pq

--Sig_/vtMO/AjXHku=qA1FI4k/Ih4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6F314ACgkQI1/ltBGq
qqf3MRAAolbTeRdHglgfGXrhaP37D9zgg3FIjmi66pb4HHf5IPQ/s1GPpi39Ur5S
XOY5XU13wzZtQ8P9lhopHVSQkXCV1f/ldqVrCa6qSz+L+HJmt20TAozUTWM9A+Dq
uTcuxGWpJn8tzF17zfl5U21Q2EwOFuZMmUfrcR5R9zwVAtregoVB3NHJFs18RbNq
SVdOxhGdbFByde4ZsVWe4PDT8J2J/pJac2noFBrZTp/XXCSzt51CRsZtmXgd1Gqp
sCh6TVLJ5Q2KyVo8BK5hlIWDWtRLwevGmpfLmbYaJWuy/B1Q1Y7L4lcRI14z/6Mm
OLRN1TG/PW2PC5LF25HHjBt8X3S1bs+C7CFxzuYkBd23wNZXNu7OomphJx7roSKS
fcbUwgfjUbmJKCF9DUmx+7msw7YAduUeRBU2xEPnvW0IKAukKagIUUQY+syC+OzH
O41CC9k3XMQVnziZymz5V3PTVOko4E8FDogHquZIV1D5zq5Xp3V0QZMTJjcjRa7W
dLNbTndZslWsZ0ps+3GC0twdjbsckDMUfvvyvvoICzUo2VGqeq3N/mg2s5aZxuNS
ZU0tvIpSjnRkggieUk2eSXoBKXw2yQH6cSSWWv6LPEdje+4FrcRXtEwOkSnvt6tn
TXLWEYOpJBwe2EPZaJ5uNMUOOKS0AnBIi0WSM287dWM/ZdyvVuA=
=7YJK
-----END PGP SIGNATURE-----

--Sig_/vtMO/AjXHku=qA1FI4k/Ih4--

--===============2004073000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2004073000==--
