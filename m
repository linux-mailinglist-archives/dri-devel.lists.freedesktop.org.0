Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFC0933734
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 08:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1D110E94E;
	Wed, 17 Jul 2024 06:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e/8HZgot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7899210E94E;
 Wed, 17 Jul 2024 06:28:55 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-4f3023d0b58so76152e0c.0; 
 Tue, 16 Jul 2024 23:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721197734; x=1721802534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSkPTIXm0vgM5ibd/3x5KTHf6taTWqqsaoDXuJQEbag=;
 b=e/8HZgotVuyCdV55dyyA7vy2iXuVhbovkbJAEjuvmuy4ya/eZPi2SSvNSUL86tOUP+
 HyWsjHY1dXyeDDyu+oucs2KHLPs6ezWCyLz93R+j6ZTrI7QzX+0AT+IEl1QdtkcJ+KBS
 1vbvNeVIqEKPkYNeHE9Ilt5V+l1KwkN3swuTtGhCeOcvC5Ab0Er2NpcRW3R19jPc13fE
 HTCoByxv1DtHGuepqSPfKWI6pGiqqkH/7eYlWqWBKUIJ5EBO74bCipolWyZkG2vy3dNe
 DpWzFdb16yrjlhVm5VXdD3TxopLXGJO5Wfv57r0HHAIYAMo1977J7+IP1blYXJ0dL3tY
 5t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721197734; x=1721802534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RSkPTIXm0vgM5ibd/3x5KTHf6taTWqqsaoDXuJQEbag=;
 b=KyUNq85vFXvFIlCMbJXpedzVUVF4E9joiU93hY+ktE0P5wyaoKYRCygd84uX3CHHYS
 U5bipU/qGYW80q8TT+ihvfgX+lnNj/LTnq2XabLczb6Qd4poAVHklkmNaWVbMQQT50Ub
 IPdf+sVGkgYa3PVsWuRlUQkeRVajeefwvsVZ85t8umvKGguWeMbCNMl9OVdoeQAB9CfU
 caDqZbUgWb+nFv7hLfxnLCtEgdWITUbzydJGwbZUPgU7a1hRAEz0l/KnpV1BMbP1d6VN
 G4nbYu16pwQaPca1iesHQR6fmPYcv034Z2iUyRCw8XkqOuUZG34PErbpyhT1TGO7QnOb
 cy6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJKhUxbVFGXBYQUo5EfYUFmHjdqPkQD6Mt8ExKUWouGwQa8xW6dFXIA/Bx1y6HJOcv4WMq2gcERIoJIPXF8GSnqyLsa0Vhp9H7nPSYCGh1jXbYwuHexWeCDiNGI7sCGiaDwUsqWX7cigqi6E3yZA==
X-Gm-Message-State: AOJu0YwnU/QgUh8YNgIRKXrF/y/2lSr0KgyYshedi9JJ69qQsYFzfLNw
 NfFhV+5Todh4SG20XkNXe+ioAgcOoRAZ0xlxhawT7xU9t/rlALfw52XMKuGDmtFj6OduBgTAurB
 BYzQJ4AYOo+Y4aquCziwggIrTX7g=
X-Google-Smtp-Source: AGHT+IH6emIdV2LByUbcOkl0hcCesewSNdqY3NUKroEri1dufWVwjzjuOcqKzkDUbKwvEDD+8AKPj3GMeNqMto1COhk=
X-Received: by 2002:a05:6102:c05:b0:48f:8cd0:831c with SMTP id
 ada2fe7eead31-4915970e4eemr532812137.1.1721197734211; Tue, 16 Jul 2024
 23:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
 <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
 <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
 <CABXGCsOsfP2SToiDhRAS51nPJ+Qr2v7B3Kjr+yVeP4G7zFZpMA@mail.gmail.com>
 <CADnq5_Mjxna+aqhWT49YLmXGH+piittc4FUSyCDEJ8s7G-Rb3Q@mail.gmail.com>
In-Reply-To: <CADnq5_Mjxna+aqhWT49YLmXGH+piittc4FUSyCDEJ8s7G-Rb3Q@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 17 Jul 2024 11:28:43 +0500
Message-ID: <CABXGCsNS0a2tybuONAJuGoC1+01=RFhwSzfU6HW_ZLau+jAhHA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, 
 Linux regressions mailing list <regressions@lists.linux.dev>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 16, 2024 at 10:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> Does the attached partial revert fix it?
>
> Alex
>

Yes, thanks.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
