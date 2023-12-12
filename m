Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571C80F585
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 19:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52F310E678;
	Tue, 12 Dec 2023 18:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C1E10E1FA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 18:28:13 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2866b15b013so1463586a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 10:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702405693; x=1703010493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIut8hQ8z15MtX5ku8n8HTViYJwiZt/tT/lHp4jyYh8=;
 b=Gk9mCd5Xlo9owYapc4kaziD4f2x5ill+pHqTF9cV1lNmYw/CQUA63XXsoNULBuRc8r
 A1YlAH6RwZfzaL3ij5IlOSKu01kNUWB06jDlWoGUZkpbhHwh6fZi8UwGsiZSZcItXNAa
 w+ijChFQRXIHiLp27/CS2/GtFGXyZ0DUEhmukzeZEW/tfcCbDNOMA1H0HoTubjjy5PlJ
 Dce14r2ThNcyx3CbXoyN7KYxKXhWlmRsGb8ePq3Q1QZJxn7wMwBqRxyuHyFF4azKsV45
 YHeOlu27tlWXfQrIhWEmUH9FUGOWOSZyhO+5ayLtswFwJr3LtqZQl1wjQw4tbPRyrTnX
 PtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702405693; x=1703010493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIut8hQ8z15MtX5ku8n8HTViYJwiZt/tT/lHp4jyYh8=;
 b=rCFweLVGyoKFBVO/EopUpTw44ARVKBkHrnrUed3JyZfekYiqdFncejrvuB3QJahRR+
 vwIux1JCRBU9nYHUq7H+kTAToDYfzIaYz5Px5vGNNPiBW0qMNnNmf/+65bzJV4k4pv21
 IWt/0sMF+0mHYm9LFNkJGtS2aEkfRNzY2e8c4VQRsHF/WToFsUEIf2CxDbyJx62d8+tk
 I8a0s+ZanerMcmZUhd1jR7CKjMFhiMRbs56nudB6gccNkxRTfVOYAXWHnEqBmMkymFFc
 0Wl2D55nhRX9rp4XHeOcC6TzD6PTbgGQxaOGJ7QSdllrYMb7oZ6KSGVwjpluym0XpdNP
 kwGA==
X-Gm-Message-State: AOJu0YzeSi2bq5qVwp1mWnQKBo+hL28vBMXo28tWyGNJ2vzJDQsYq4YE
 YDxIc0vkhb6raRslnViCLHbdEw9en5wv5r8pmEU=
X-Google-Smtp-Source: AGHT+IH0DC48Op1TLyyJne6Tp/7pAjJRMKIynuoYfi09BGTPA5eLQUgcAoXihSU+RRu2OAsPRVyEcZhf7WhxQl7+DaA=
X-Received: by 2002:a17:90a:6345:b0:286:4055:63e0 with SMTP id
 v5-20020a17090a634500b00286405563e0mr11615556pjs.0.1702405692665; Tue, 12 Dec
 2023 10:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20231211204138.553141-1-festevam@gmail.com>
 <9089fb993eb0b2b630784e5b91cb88c1ff2f45fb.camel@pengutronix.de>
In-Reply-To: <9089fb993eb0b2b630784e5b91cb88c1ff2f45fb.camel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Dec 2023 15:28:00 -0300
Message-ID: <CAOMZO5D0rxTmxGZX1Obfm9+t46gW6XpGWDcHDzocQd6p5OokBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mxsfb: Add an entry for "fsl,imx8mq-lcdif"
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, martink@posteo.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Tue, Dec 12, 2023 at 3:19=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de=
> wrote:

> I don't really like this series. While we don't make any strong
> guarantees in this way, it breaks booting older kernels with a new DT.

I thought we needed only to guarantee that old DTs still run with
newer kernels, not the other way around.

> As this driver patch shows, there are no actual differences in the IP
> block between i.MX6SX and i.MX8MQ, it's just the SoC integration that's
> different, where in one SoC the controller is located in a power
> domain, while it isn't in another.
>
> To me this smells like making changes to parts that don't really care
> about those differences. The thing that cares about the difference is
> the DT schema validation and I feel like there must be a better way to
> describe this in the schema than to patch both driver and DT just to
> accommodate a SoC integration difference. Is there a way to make the
> power-domain property not dependent on the IP block, but the machine
> compatible?

Yes, this series is all about making dt-schema validation happy.

If there is a better alternative, I am all ears.

Rob, Krzysztof, Conor

Any suggestions?

Thanks
