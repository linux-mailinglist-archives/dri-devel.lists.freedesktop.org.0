Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6635974E7BD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576EC10E323;
	Tue, 11 Jul 2023 07:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A41910E323
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:14:58 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso83402281fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 00:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689059693; x=1691651693;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vDg8sBlchWM3bGmJZ4eUSQrMp+GAsnjEmLK/PUblJwU=;
 b=ZrN1G7DC5BfDRw21wfHnDiFNvxDHn0lRQHmbqM5Otsjz4MtES7HfeQeEr5CNo2R7P9
 NWg/OajfaTR+Mj1SkxlfEWJ6pUGXIteqdbjg0yIi8GEiX8aHP46k5cQq4bwaA4/UJLfS
 6eOLoORO8ZZKrDQRQ+HfumYewr8gX8RV8B3AtCsFmDPv0HTKze+DyG4wXbHmpxOxgao0
 yluXXhrCI2sh/S59+8q3lHvDd+Gnp+YtBGeweppx9JWe16O5Rq9+5H4bYRHPh5CCGTpX
 +gBjJ3tagEUyo/tTUwi/90a/tsZnNkHOfqXiUQ4iXzx0r42LHrlQLVufWioYjjCBLSoo
 lAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689059693; x=1691651693;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDg8sBlchWM3bGmJZ4eUSQrMp+GAsnjEmLK/PUblJwU=;
 b=Fn0/sFhWtqpsqJ9wj3Qm42tvYPmnsj7X0/MVmIrDRG1wsWfiBBJdJIchla3uE4tT7F
 hJeKTxRcod6jzU9XXqaUCrbCMupi9dynJJZTKAv8DuhDB/3o6fd6aW2UR/W/0geVeXG3
 zxoepaZqIa2jZsHSoKVHDWIay7EbYdxOymVnTHCQoKy20HG4HS0N1WznOQ1V5++T/x0U
 5WayzGN8L202w/gBEXhoorTuyTJd6flZRtJhLQ4U6ejYiUGclp0VLgG2vIZDC/YXHgwa
 Yyrn6VSK+1C69MJZ+pFsQ6nksbAmYq12+/0kpp28WW3gGpQs9MwrHrxcSqF+ZXQ8TqCc
 4QjA==
X-Gm-Message-State: ABy/qLbWX99Q/lmrOgSSd+4PBMTq5d/Ro0dkEumwos6UfBpuh5jha7XC
 cguhgdbWd5nYIxn/9dqpvQI=
X-Google-Smtp-Source: APBJJlHnYYO4Rs02Xy3J+Kf/A6Wwj+8XuUH9uMwW9lRDn30XMANlUXeG2i2HUPCBgHpJPHgF4/EuHw==
X-Received: by 2002:a2e:7a06:0:b0:2b6:bd82:80b1 with SMTP id
 v6-20020a2e7a06000000b002b6bd8280b1mr13113428ljc.37.1689059692443; 
 Tue, 11 Jul 2023 00:14:52 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f9-20020a2e3809000000b002b6ca141b6fsm313570lja.87.2023.07.11.00.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 00:14:52 -0700 (PDT)
Date: Tue, 11 Jul 2023 10:14:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Michael Banack <banackm@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230711101442.72530df5@eldfell>
In-Reply-To: <9768c00d-536b-dd7b-c8e2-e9d920cd6959@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <20230628104106.30360b55@eldfell> <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
 <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
 <20230707113837.1a9d31e9@eldfell>
 <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
 <20230710111706.209cfd55@eldfell>
 <9768c00d-536b-dd7b-c8e2-e9d920cd6959@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jzlvc_IC7v0R8=9nj2Cj/i0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Jzlvc_IC7v0R8=9nj2Cj/i0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Jul 2023 10:46:56 -0700
Michael Banack <banackm@vmware.com> wrote:

> On 7/10/23 01:17, Pekka Paalanen wrote:
> > On Fri, 7 Jul 2023 13:54:21 -0700
> > Michael Banack <banackm@vmware.com> wrote:

...

> >> So I guess I would vote for trying to include something to that effect
> >> as context or explanation, but not try to strictly define how that wor=
ks? =20
> > Yes, exactly. =20
>=20
> Okay, if we can keep the mouse/input stuff on the fuzzy side then I=20
> think we're on the same page.

Very much of the fuzzy side, yes! All I am saying is that one cannot
explain the hotspot property without saying anything about it being
connected with input devices in some way. The very key I want to see
documented is that all cursor-needing pointing input devices and all
KMS cursor planes exposed to the guest OS are meant to be associated
with the same single conceptual pointer. That is all.


Thanks,
pq

--Sig_/Jzlvc_IC7v0R8=9nj2Cj/i0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmStAWIACgkQI1/ltBGq
qqcHCg//Xelh45WxQgsjoO+A9vRCr0WKE9gW0iyYbqXumT94B5lFQUvBUi1IYS/s
hvOXkt2DVhMptE4h3xmKraeez9AfTD//Ff2muwm0SvZcuJTNUc0dplAY7iVqeMc7
Xwn9M0ojLzgTw4TxQN0r24799ggyv3bKFMqPufVGvFjZj+mB8K+bf14cv42DVu/s
HJ0JjthijoyEb/b7/X0n0iF6fHRIO4u/TgyHaFUuxeYDY7bnEc0svril8gmXHosT
hKN1l72EwRlWfTqyan0+AlXeOUMcowGN4w/NZPB5R/IdkrRVBdzaQPCdzbUEB1VI
Zcz2WX1sN5UAyOXTXzSHcTkORDcywj5YsiFQnHfteWGUWWQnVhnGwklpIqO9Srf4
KaY2BxP7VWEU+GKdEVXKTCPVZvrEa5YTSs5m8232HDRJ8VTi8ik8kC8OKxlp6LOl
b+Nj5vbvgXfpbBxcxUU7yL0dk/a9JrAcXXz1JRqSe1n5YrvN/6PQW/E3WugzXJ3Z
kVnaK5KxxtIDWC1op0EZXTAKojb8qyySo3N1KjJP/EOC3PVmIkHFeeEwA2fbikyj
ZpvVDKcFks9C1wmYqK5rMH1uHz4uHUBtKwUZ7x9xLrq6OMFpkuGy5e11tpjYxxzj
lqF7mGv/lf6A5g/Pz0dinkmwQPIII/O0O2UeKZS/nK7BlonlvCo=
=0jVw
-----END PGP SIGNATURE-----

--Sig_/Jzlvc_IC7v0R8=9nj2Cj/i0--
