Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5292783AB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 11:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB806EC69;
	Fri, 25 Sep 2020 09:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7296EC66;
 Fri, 25 Sep 2020 09:11:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x69so2014519lff.3;
 Fri, 25 Sep 2020 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=unpbWfhbNUvAm8U48dnsh3o85sr3kUdiLNKs33mxuPc=;
 b=ukpXSwmGdEKM/a1BgktI36RmiBcoZh6E8KVTrV/GSdoNpeAKyo5C+jph7CPazhc40x
 msh2ywq+ETqTfSW7Xc5vZNbSonMWpASOlrCS1viFJ0Pkk7+udf1PVT8IH2+Gtqhwq1e1
 XaZjgNvSP340iz66j+dfuI6TJBJpa1cH9dx6uKNFbA5EUkelmuAmIW22ZZeZhifk5ry5
 3td1nKNAB8USvVcwM5Hft5H7coiYNEqxe1ucMbPWvgolE7bqLAEZJtGYusDt7SRPjQXe
 OERTRPyGo52ksdVtIGP+LL91H42KQb31rUUvvDU0ejOTRZ+VnB6CGIIU6BJdSP9vfGjA
 UtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=unpbWfhbNUvAm8U48dnsh3o85sr3kUdiLNKs33mxuPc=;
 b=NzRcb5DJ2NBjlaXa4L/+H78uvF0/11HsaSIigvlalPnRynoHan5KCIgnHp5pNvuQSq
 iEUtht4GK5DTzDD70wGLOLciQugj2aoDP7nob2NykmhGLbTCyCnETW42nwQ41u0crMxu
 G40hFf8r1XDujLAsH6LcFg9xiGnLTDNW7ZPS5uCTNiJpXe600jNeuU1LcDDPbCMsCvcF
 b+QQd42RzZ5huNtq8Vqi23C83o6z6XgzChc2Ul7fL2fyW3LuH+Xk3rAmgXhgDpTWAnxE
 YRJ1n4llmPTjlIrxj6MU4xLLUjJNpQlE6yjiacjjSahzL8XdrtzRHcwMzClxPxDN/BvZ
 WyyQ==
X-Gm-Message-State: AOAM530P/kK2Li6zeBH4pyIiysHr8DxkSNcPAAyVruvWwYvi24/uY2gv
 IcyM56Ul+uEi1ndQnF48qyM=
X-Google-Smtp-Source: ABdhPJyJKW01SOgRu4nDjxv92QAAy49QKRTw5T55DlKuqMG45XiWOqOcL+2yBFcv73XnzWGzbA6AqA==
X-Received: by 2002:a19:50d:: with SMTP id 13mr920156lff.500.1601025116968;
 Fri, 25 Sep 2020 02:11:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a192sm1776717lfd.51.2020.09.25.02.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 02:11:56 -0700 (PDT)
Date: Fri, 25 Sep 2020 12:11:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/atomic: debug output for EBUSY
Message-ID: <20200925121147.791ea941@eldfell>
In-Reply-To: <20200925084651.3250104-2-daniel.vetter@ffwll.ch>
References: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
 <20200925084651.3250104-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2133480258=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2133480258==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7LK.RtQplWEQivx6GV828S."; protocol="application/pgp-signature"

--Sig_/7LK.RtQplWEQivx6GV828S.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Sep 2020 10:46:51 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Hopefully we'll have the drm crash recorder RSN, but meanwhile
> compositors would like to know a bit better why they get an EBUSY.
>=20
> v2: Move misplaced hunk to the right patch (Pekka)

Hi,

both patches

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/7LK.RtQplWEQivx6GV828S.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9ttFMACgkQI1/ltBGq
qqfggRAAjsmSK5GFhOAwb8lwZXoa7S4lHH/tTQTjUDiEN9Dv6bF8wC9wHb6LHktr
FFhXpGJtpXALkzI8pHmi4cU7Y7tuX0RADA0EIthLQS2ni2H2JS+X7xpJ4hQeFJuP
JdC5qVcN/svnUXAcdMgzqzoMnMuoMkLJHsPUA4QUi2KWwtYmM2jU9caI7c3nsle+
JjG41sbbLkg6ukRtJgA+wbhkSKwN9kSXYQFTKyVxim6EwwpHYSCkN9MtUquS6F5T
VySWylR5AGfxf076TUPQShn64akCugPFz6V3WOLSLjMVVETqKqOdYgdTn/Ybq1Le
mopSVd16rqJjuAq1AI8JVmBm56xQjCnVMu6aDlnpIHw1J6K+3yw+oItqEg2KhI6y
eNGO5TZUgH6C6ZKkzLsa6OsE1ku+tdpK05mQTxHazQRre4NYg/Z805SumnrcHC5T
6ULt6zU/1Qi6l2U3RkVNmbRKfqic2937C8FhM2ptFZQHzXblCfyaStpQbcfcleCZ
5kReV6z5FRc4G4gy/ZKMZ8Y4VMzdnZNJZs7yUaj29LnM4gPqGyBCqM02aAteKygq
fnipLN7H1uQSsY0Vp5LVGLEM6qMGR2DoyfOFEKRAh7yujVthy6OhJyjNI8Pv4puJ
pKkDfl+3eK78kJA41hsjripHkv8Nd/tIMWDdZcF8W6dkcvTwS/o=
=Ua5v
-----END PGP SIGNATURE-----

--Sig_/7LK.RtQplWEQivx6GV828S.--

--===============2133480258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2133480258==--
