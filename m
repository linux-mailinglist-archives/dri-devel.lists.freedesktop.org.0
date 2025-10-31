Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E08C248C5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4510EB4D;
	Fri, 31 Oct 2025 10:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G1h/JG7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F9810EB4D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:42:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-294fb21b160so13473415ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907360; x=1762512160; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/SlfwaQP7guMYAXiUlIpsVQDM4WWSkwSDu7fAzEHzBk=;
 b=G1h/JG7jAPE/J6pbYfzwwIEriV4lYqLw0WkB62kbBstS2FPQu5F9wf9WX8OVkoMS1L
 27xXsVD/braUROvnYlH4YDMy33uuZUlyei0A/UJRb0EsvKKUNiLQdaWz+KGNU7mYnGDh
 DXymxUxuSdrN7cAIbrdQcJXrO4Ex26mSqDj9LXpESLYHySkFRwMoQsnUQUrB675WT+dC
 e2LOfEJ+NWxu8/vnM1i3B7zaVEWf/JX7YuthnBALM6hfM4HrW0/xsQ+Z7pJ1wpDm2XK6
 QjSQmCwqv04j6UKidrkKTqWCNSh1Lq/pm3Qt+yo/ir5fN1gD4oirK1ArPdy72dYAK0Tp
 IUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907360; x=1762512160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/SlfwaQP7guMYAXiUlIpsVQDM4WWSkwSDu7fAzEHzBk=;
 b=m86fyLoxJjs0Qwlv+NJCezt0rIIYpW/9J+vR7Z/ORskZUAYMDNz/TgMVywpomQ9u0S
 V89CwMGZAz35ZahYl3DXfuoMab9T4mTne1IxKKuiP1jyU0HHtPd0gWR816VroJZdsBV2
 /IXgcWl5TeEaLFftlAZt+rMFE2NkcvPEir5i02XMXVQt2yBZFKjVbSm5zfAVI+awYTfW
 OOTEz6Efr88xlK9u52WMIFw5APdZ/wZdeP+d/t9Q4LgiS38ZdphrXtHTJHCz3tVAsUtm
 uS0aKxfo2g9j8BLv1LHPg33vIim7ITmc80XOfGNl6jl7aoa0oBcrHd3NVbc6sdpUos7z
 uIPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsS8P0uTJIY3nbn35NIguxkyuo6OFSDE8gEPed4WzKKMv2OBqAzjGqh4tPB7Un/K0q6NtiASIoFpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpBNvcjw9PvBaheKXmiajgiCZA4AF0a+8M/BZNWlqFTSLyABq5
 EczjzmpY7oQ6rT8tMURyXltrPTOCKKRSfxRoybe8S5Esbiq/3lMTdq1/lwpzGW4puqX1d9XruNo
 Pcygxon1kqjnmGRIgl37qWyKasLMQr4w=
X-Gm-Gg: ASbGncvFZbDNwwc0WtzBQGkPvZmgaP+kZmQdrZNb5FeN83ZwMMfY10H3+AKPacAZLpD
 lnh2lg6ku8ZmWk1Nso2uejFbzWAVgLeoqkdslAu8Q7Styr7RXu3+6fe+sr4zw1kZcjjfdqUaDIP
 Fz37aIUuhoysMPxaqHfCHfVRclZwICLeYPGakbfjp+sXwK/BFIlZCtM04oObmk5NLSJD1Ip6f/6
 caHmG9NVpjfL16o2dsAqqnSw2vBdoj8rAPnjr0kpgzFjdo0R50r6GF86FAedsE=
X-Google-Smtp-Source: AGHT+IEdmBF20PH9LqPxczuln/hn0Hc0kNqYeAT5rDQT12RE7+ECdpl1X7bij/8/ttC12X20nIuwHSECp31U2STznAM=
X-Received: by 2002:a17:902:ea0e:b0:294:f6b4:9a49 with SMTP id
 d9443c01a7336-2951a52da97mr46955975ad.58.1761907359722; Fri, 31 Oct 2025
 03:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
 <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
 <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
 <a7d53f43e0c9d4c697946ecec31c9441df540a47@intel.com>
 <CACRbrPEDJa_mMTrB3aGtEsmF4+_XZCrpmRj2TgA2hnhUhroNNw@mail.gmail.com>
 <64f7c8cae1b49f1626fddc536b3a41bf52621e65@intel.com>
 <CACRbrPEkT5bqRG_z8C17wNe_nHbDD3+w70iqvRcnmasrTzqxoQ@mail.gmail.com>
 <b009275b35fdc8536ea80689ce46425b0bd1b948@intel.com>
In-Reply-To: <b009275b35fdc8536ea80689ce46425b0bd1b948@intel.com>
From: =?UTF-8?Q?Tiago_Martins_Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Date: Fri, 31 Oct 2025 11:42:27 +0100
X-Gm-Features: AWmQ_bmzWaG3pP5Yqi8yw2qiXNFnjY9meQgkAgktNQpZN1WBp4jd6H2RjKR33Po
Message-ID: <CACRbrPGiVUXFLMD7SucPjVsoxCEHocTqgzzddtmNg6T9c_sw2Q@mail.gmail.com>
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, mpearson-lenovo@squebb.ca
Content-Type: multipart/alternative; boundary="0000000000004dadb606427206c9"
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

--0000000000004dadb606427206c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 11:13=E2=80=AFAM Jani Nikula <jani.nikula@linux.int=
el.com>
wrote:
> May I add your
> Tested-by: Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmail.com>
> to the commits?

Yes, please. Thanks!

--=20
Tiago Martins Ara=C3=BAjo

--0000000000004dadb606427206c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31,=
 2025 at 11:13=E2=80=AFAM Jani Nikula &lt;<a href=3D"mailto:jani.nikula@lin=
ux.intel.com">jani.nikula@linux.intel.com</a>&gt; wrote:</div><div dir=3D"l=
tr" class=3D"gmail_attr">&gt; May I add your<br>&gt; Tested-by: Tiago Marti=
ns Ara=C3=BAjo &lt;<a href=3D"mailto:tiago.martins.araujo@gmail.com">tiago.=
martins.araujo@gmail.com</a>&gt;</div><div dir=3D"ltr" class=3D"gmail_attr"=
>&gt; to the commits?<br><br></div><div class=3D"gmail_attr">Yes, please. T=
hanks!</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div></div><span cla=
ss=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail=
_signature">Tiago Martins Ara=C3=BAjo<br></div></div>

--0000000000004dadb606427206c9--
