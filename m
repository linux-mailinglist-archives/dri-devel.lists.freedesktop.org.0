Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF694D122B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92DF10E411;
	Tue,  8 Mar 2022 08:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187BD10E411;
 Tue,  8 Mar 2022 08:26:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w27so30820561lfa.5;
 Tue, 08 Mar 2022 00:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=QtFHh2/o2dS5Qmk2nhBDGpEYnNnKSFzCE0Ew1659usE=;
 b=YKyzPvISwt1yrAraRYEGv9oCibMMTU+j3q/b+r5OT8PH+quMobVz6BlNcL7XbTQB8U
 p0KnJcQF9qZc8+Ejl6kQ7AG1sgTmMIeExgIxVuQVvorDpBpAo40Pj7pVt84/tJe0ULiJ
 fOpjpQhkzwoAsffigsvF7o7dc8BUhT3Mc0N/VGWA3Q8j67kuB9TE/kiLeuchiQW4qEtg
 B7xC9B0ARzeXPkm8/pRSBZlx5O4Kqk7oJVPdHvgvFF/IDJ6GaQ/QDAK7X92CO4oxRojn
 q7OdZPR4MTp906KViuY86PttrVvZcXKGU2axFQI9c7aJA7+EHXwqasBDtZKK9t7+9zVB
 fSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=QtFHh2/o2dS5Qmk2nhBDGpEYnNnKSFzCE0Ew1659usE=;
 b=yr1bt8RL76rvAlpe1kwiLYzwISzRbJCFj79G+iTwn5wpIAhIb4AIjOhkios8zdpaiP
 SCNgCpD/PD+LuuPMQNTWKnYxamITQn5dqIJ4+vn1RvKh9p9dUg0KigfpTK8XdzTgqP2Y
 zYL3vEWOoVGHVybnprl722DbqkXTPbDMe9ExQswUudBs4wlWYUCwWG5gY5tdzpAPja8H
 Ttg7ejpk4HmmNETz1a/ePmbRtdH4vWfmVEAEqjrGDoeGwSSFOaPnHnV1NmuwATqkCF5Q
 14iWT7jBqvzewIFBZc8eWwOKGJitG9zAZ2KfqKPDDzpwJXRfkKUTSnZEBU02Le3PpHEx
 HTkw==
X-Gm-Message-State: AOAM533DDuqGeQ2E9jmDq8jdTon4pJva2EbHIS2wODmeQATu8lvfHhTk
 BGcc61ElZxcs2438hJ45dXA=
X-Google-Smtp-Source: ABdhPJynWJB9HBN0iWlS2LT07ycGKhbw3gribPA/P3Wt8lsDmdgbxnREIjiKzz/OejpRHQv1eDjhmA==
X-Received: by 2002:a05:6512:dc:b0:448:2624:aa81 with SMTP id
 c28-20020a05651200dc00b004482624aa81mr9130507lfp.137.1646727987226; 
 Tue, 08 Mar 2022 00:26:27 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g4-20020a19ac04000000b00443d980bbaasm3343591lfc.96.2022.03.08.00.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:26:26 -0800 (PST)
Date: Tue, 8 Mar 2022 10:26:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: Writeback Assumptions for XRGB
Message-ID: <20220308102624.1a757e36@eldfell>
In-Reply-To: <20220304144607.3pwfwhxf4zsckan7@houat>
References: <20220304144607.3pwfwhxf4zsckan7@houat>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iCg=Yj0kdBgmLGBsNe3WJT=";
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/iCg=Yj0kdBgmLGBsNe3WJT=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Mar 2022 15:46:07 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

> Indeed, while the input buffer uses 0xff for the X component, we'll get
> back 0x00 from the hardware, and thus the hashes are not identical. We
> can force the hardware to always set it to 0xff, but that doesn't seem
> right. It would make more sense to ignore the X component entirely in
> that case.

Hi,

I tried hard to send a slightly longer response, but gmail refuses to
deliver to anyone without explanation. So here's a summary of my opinion:

- KMS must ignore X channel contents on read
- IGT must ignore X channel contents when comparing results
- it would be nice if IGT filled image X channels with garbage to
  verify the first two points


Thanks,
pq

--Sig_/iCg=Yj0kdBgmLGBsNe3WJT=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmInEzAACgkQI1/ltBGq
qqcUcQ//UZAQSQNYXpLzSLqy5/Ap3IXCOzNmkT14SnHdO1VT3umGK6G4/4R+tJ/U
UBPB6atLZdf/5grpUxWX5fAGXLXMSqeInDaoBM/ooTR/xU61CTTmgTHyHNr6d4vK
xEoxw0D+CKCO8VDyyk2n1nnsD9893ghMcTptE0BvplAx/H4HgXqdy9IFLKdEHYGB
v6pcOoJyUf/bQMgtYCRHwB1fBlXLKpWWzrvlIar0EhCbZMF8LNZMjxWLD0gw3fbA
R/1WLY6ze0UCCtBvYqzIWGVEt8RHwtU1l8MC+WcbKZ7SBxZCj3yR03qCAsQjlS7I
1GVxAQjmqcn+p4ciqZX0lmaRptk3NdiUkPFHoHtgPAyb+d8fZ2ECUiEU0tu97CQ5
QPsFynig8Ka7fHq4xBiTb2Db3xj2rEPwT16EjkAze5Ql3fq0ycYVKJiSzhKdccMQ
mSOSH+MdqVLW36j6XHbA0doHHxdinNERg+7xwetl84h344TKkfJKYOxXOqbON5pj
nrABkqabmTGhO0GL/Fv/6lnKN64DtBt9DE0DBHThn8NtU1D/rN1GolPztdLvkqi9
onoXpQgEATC1psPlm8bnBzOhC66CGOi0+QeyEn8wepO2PLQN1rTS6tHgcj+yW17D
x7BlGGi0qnb3JX5MqpQ0P7jaI2wfndL1WfQysI8nk9wOY41hW4I=
=tdw1
-----END PGP SIGNATURE-----

--Sig_/iCg=Yj0kdBgmLGBsNe3WJT=--
