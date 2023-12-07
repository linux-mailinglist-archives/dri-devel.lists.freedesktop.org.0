Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1B98089FF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEB310E8C3;
	Thu,  7 Dec 2023 14:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA5610E8C3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:15:37 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d0481b68ebso2259115ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 06:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701958537; x=1702563337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4axF4VYFF1LAufwDfMyuzdTTY/YzPHQNrA1UysFlFBU=;
 b=STmqsOK00MlLsWUI9Nm8LRz2lrz5WjsUtPLcIidkZ74OGT8ZJkCcMvcrDY8WS4SdNX
 hTupdNTWd3/O8M8OX6jvCrs19DGEhhIR8S1yj+QDKu2T4l4D0jHCDuDb9QrgTyrDf8Gd
 SyuY/PdHHODRzbZVztwU6U534DrV5lSNH30WNknA/X5B59w0wZ8hLrVzBlr+DFIsyC5t
 xX6HqOKKLhKpSOgTfb1kao5ElYN4fm43oLhBZtdtLSPTeyqKjlt+hXTuUzTP1cYH11me
 A/oYG8XkSyCa/US+EzMVtfPiluFiUZ7dO1RdJirUCT6k84eG0TYfa/a9dSgK6u3YJ/Ml
 Syrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701958537; x=1702563337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4axF4VYFF1LAufwDfMyuzdTTY/YzPHQNrA1UysFlFBU=;
 b=Rv9qOavhObEMqJkTsoX2c18FlMqzLI21pVP9qILHvxkyzFdddUQxQ4Qz+IT2PqUbd8
 WDud2jXqd/B83tNyDtowDzGpX+UEVnKurIw8iIhfh5lzg+Vrgz66gjsRQUoRv0xLT/4/
 LuFrFghshJOZXBhBtGm2u2DLKrPH6h2GAOVrRHyUB3/rWNM+tn+CUyaZwtV5PE3vRKkl
 UbuuvYRPJepxvWUpVOnBSWmgoWBvIZ/pgYdVPYCuDBUrLisnNiXYzfZIVM5jk+XLgfIO
 ye9Hz3cGiIbpHo6/fXi9fDOO/N+6z36VlEz5OTQEPRo4QuGreHCLN4PvRdunw9AcD7xY
 BhMQ==
X-Gm-Message-State: AOJu0YyEq3PegiQeNd7JYvAYZr1AVN52II16Bj2qekYRpagGMvx0xQ6D
 KR4Wh1TBOsBFgDJjXAsHIW45+EG9qKkaKnFkdk4qeBi3acc=
X-Google-Smtp-Source: AGHT+IHdjuwuCiYTYD95XAqm+CHuTjprk9Nqly8arXDL8XLsKvupw1a3gARLg/NNi9xmWdvBmIswDpUQOpzIOl6O9nA=
X-Received: by 2002:a17:90b:2ecf:b0:286:4815:f727 with SMTP id
 ss15-20020a17090b2ecf00b002864815f727mr4955703pjb.3.1701958536699; Thu, 07
 Dec 2023 06:15:36 -0800 (PST)
MIME-Version: 1.0
References: <CAJNi4rMuBWw=gvKPJN9WF7oc_zdXP6-dFZm8xgJz8DD_4SK1eQ@mail.gmail.com>
 <CAJZ5v0gJuASx-a=d0QxKowQRL5x=vS00FOTFA+BAasF=oahtmQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0gJuASx-a=d0QxKowQRL5x=vS00FOTFA+BAasF=oahtmQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 7 Dec 2023 11:15:24 -0300
Message-ID: <CAOMZO5C9NGRwZKhPGH_JKPTOawAzNqyR2BbmiRqA7jjTkBh_Eg@mail.gmail.com>
Subject: Re: Question about device links between supplier and consumer
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 richard clark <richard.xnu.clark@gmail.com>
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
Cc: majordomo@vger.kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Richard,

On Thu, Dec 7, 2023 at 10:43=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:

> > Otherwise, the mmc driver will be defer probed after the init
> > executed, as you can imagine, the init will complain it can not find
> > the dev node specified by the 'root=3D/dev/xxx' in the kernel. command
> > line.

Have you tried passing 'rootwait' into your kernel command line?

That should fix the problem.
