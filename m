Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0C2223F3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 15:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25956E265;
	Thu, 16 Jul 2020 13:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308F56EC62
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 13:34:57 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dm19so4737929edb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QmxJzAqj8acGvVOZn8jwBv3VA4GKb9FdYZOWeVpHqgY=;
 b=qCYfE678wmXVOSh7y3NoCzQ2arV7maAlNilVxwIOjNkaW/KZz27JBGkxz5KYAjtyti
 yZ+3+3MYjQSYlk+PIR3PUpzpZ6zguoyTGDXZVWJsoWxW7OZ3G35U6TQeMW2NeFteiQWl
 yJ30pS86Y4mGxUW8eMRJ9Wj26dDLY5pcBuz6GkQ6M4syuDJvtL7h2sbOB0aVoGdYxSmb
 QdhceUSO1r4AMRh8Og08BXpL/Df1N5Xus/w5tsdAjF2pE/2m1xCgZF+GqBazU2MrR3iA
 Hj2wiFkCqtNimwizzyy1v4xQkjRBxDPmd3XPrnN9AfqclTCahGAm2AVPFhd15Ah3UAxa
 6g3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QmxJzAqj8acGvVOZn8jwBv3VA4GKb9FdYZOWeVpHqgY=;
 b=JknG3UZHVUqqW6cjNBrTznAHa7OfWK68ojHJdhTsA7jmks+Jdqy2UC1n70WVuhQcWu
 Yq/HP/x/a8FGzIUbCQvlpPeRU/5PNJl0koAPypK7rIK0llZ+1fWiGGCRhJ6cY5RC2Kby
 ks2jN+OBpuqMGLj/U9CHE+e3vIBDbt45GRBXeTcHLC5UsyaYrlDw8WAHJD2Fc19RLywm
 2guPXmK7TcLN/4GA+0xwol0rPtWrZzkvS5IVcSGGnicp2xXBNEkl3dLXmx6IdmFGGoe4
 sghL/8XTSBLDi3M8PPUG+tqurydrDC6L0JBWOqvhYD0eakq/fi4kp/+pg662KgiI0tg+
 7l3A==
X-Gm-Message-State: AOAM530IFOnYy4v2lTVDRpDil45yu/yci58Nc+6CLmCWxNfGIp24RcZm
 rXWvulhgBCkbM4zkeDhcjzk=
X-Google-Smtp-Source: ABdhPJw0rCFRJeytOYppBCsq/TAXQWqyMPzMyq8a2a4DDMh36NJT34ibY9iByeVFo2LJpEuJ9ecCEw==
X-Received: by 2002:aa7:cdc2:: with SMTP id h2mr4669366edw.274.1594906495731; 
 Thu, 16 Jul 2020 06:34:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id z5sm5031303ejw.114.2020.07.16.06.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 06:34:51 -0700 (PDT)
Date: Thu, 16 Jul 2020 15:34:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200716133450.GJ535268@ulmo>
References: <20200716090323.13274-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200716090323.13274-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
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
Cc: linux-tegra@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2007172794=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2007172794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EVh9lyqKgK19OcEf"
Content-Disposition: inline


--EVh9lyqKgK19OcEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 05:03:23PM +0800, Qinglang Miao wrote:
> From: Yongqiang Liu <liuyongqiang13@huawei.com>
>=20
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>=20
> Signed-off-by: Yongqiang Liu <liuyongqiang13@huawei.com>
> ---
>  drivers/gpu/host1x/debug.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)

This doesn't apply. Can you please resend, based on something like
linux-next?

Thanks,
Thierry

--EVh9lyqKgK19OcEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QV3kACgkQ3SOs138+
s6GieRAAjSgN0wLDgrWyzyjLy54sFADuaoAruNpwMPVnPG89QRmsEboAxzzDdZDD
/zlTd/PJVCZVKWbIlLkP7Rna+jyUuhamF/BgQujzjbSYk76Gk1KCuhoZw86z8KGG
Fh23wZ+zX1RP+URwJatUvhZUKKEVaQl8ldHWBQG32bChAJLf2EhOqrIsMA0v0FE7
CQneC38MD9kT3m/LqV2yWyvGAP0Xy8/n0hqLSyZpPBvGLpZ/D4doXZb1Xs1PTQIp
kMi+Ia4RKh4VHRxVTDovG9v/3aBY4jX8SqFqZBUM9CMJynezT4+iZtHSx7xxw7Ir
9a1BO0r/xAMcgq5m4N8RTE5Q07kOCf/Hi4qTP5MQu1E3jYitOUB0AAuyvwFYa074
NBx0kOJmJq/rL03WZ6RM/euMCQCDwh2e9zJfiXu2eLA8R73bW+kClRv4u7RstsKc
rwQn3BjuJWY6Y183D6ZnAN7IRwZL/vxFoWvK5LhfnDTbNtHWGmZMvf3Q6FRk9U1r
jUdSy8Ptc5ozFt2IGWzTePsYp6BCwRMQ0Ja6CpMiw4hMgRJDSHmk5woB8heUY6LK
O8GbqeQ3vkz96MLjtoUxsdsPEz/Ebkh7GQXOzrQ9QyN+/jAgvE5QfGicXK+HbGrO
TcTST7suEXl4F+LubMElfG7k87ZvgRTPYaKNBo3tTOKhaX8K9dM=
=3yVO
-----END PGP SIGNATURE-----

--EVh9lyqKgK19OcEf--

--===============2007172794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2007172794==--
