Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDD7610DE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 12:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D1D10E0BC;
	Tue, 25 Jul 2023 10:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C879710E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 10:29:03 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7653bd3ff2fso567437985a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1690280943; x=1690885743;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B04aJ7tifDUooU5iQQMsOitMck2yz5MfdqncUO+upVk=;
 b=T6bmmkPARQAT0XmPtePUjN9cFENrpMPtF8Bv+XbQzrs55qnf7kC93kCqR2PJKUTKIB
 GG4QQ36vz0+F+vpgibFteF9y9geLNZw3StWA17MGwO4a0dajMPU9d+dMbgs7os711OdA
 OeVEQf7yXLqntQVPr7nGtP/+no7Qlqm4BlQKEEIuScL6buwJ19WO4hl6O7Y+z1CLHWAY
 jPcplyNa++UlUh7SD62xOppPIxF/ZUXRM/95EIQ3TuBidcg0qtyiIT/pdzq94WFWfM7z
 BIo9Y56jXU7PqhULhifBp0iGh6W/OAXyKcjzA58mwqL+2HNx7c2BBO5rV/8y3tTiXtHd
 s5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690280943; x=1690885743;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B04aJ7tifDUooU5iQQMsOitMck2yz5MfdqncUO+upVk=;
 b=BxqTpz/mP3sMPRjNNd7RWGVMrsVMewokcET6288KxEDx5mXwTJI2kN8/1CpQj62A3p
 IJhh7kkrvgj88C/o1j2iAa0XER+9z8nwWZR/4He/J5vWVQQvnkZchm9kjIiZJX4DTxkC
 EAHKuSu+Hn+Hnk/DYEr76Q0jyS1eafimvDsdWvDT0IUiTmhLwFJjkXABraG3ejsgOiBo
 rZqj+3Nl5604ORO/xdJZZ5x5Q1flMMfnBH36k/oSXtyTYpr2Zr7sHi5kmWzDdaB/KEO5
 D2Vi8JnYHWIsQmpFePg8Rn1/4UE73e9gKPJxrQ3WKmZHVC6ijrTKeOPzk6iuGqcAy/BR
 xQKg==
X-Gm-Message-State: ABy/qLZ9NLfX2g5gSBJOMFXtba4huKcDHxM4VcQuDLKIGlKP+jTr2Xry
 5nTL1Q8Khl6e5171Z6EYJfCPuorSLXWnzCa01d0NKQ==
X-Google-Smtp-Source: APBJJlHz8JR0TQHgtn2GRUW/o95GwKaUSlbQoHT6uUkAovT5C3kaQAEsmV0CJDd7EPeNRPm41gjhXz4K0TyWgHwi7vY=
X-Received: by 2002:a0c:f7cc:0:b0:636:39ed:4dce with SMTP id
 f12-20020a0cf7cc000000b0063639ed4dcemr2644739qvo.20.1690280942787; Tue, 25
 Jul 2023 03:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
In-Reply-To: <20230724175839.675911-1-greenjustin@chromium.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 25 Jul 2023 11:28:51 +0100
Message-ID: <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Justin Green <greenjustin@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000002a751206014d339c"
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002a751206014d339c
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jul 2023 at 18:58, Justin Green <greenjustin@chromium.org> wrote:

> +       if (cmd->modifier[0] &&
>

This is not DRM_FORMAT_MOD_INVALID. Please either explicitly compare
against INVALID if that's what you meant, or against LINEAR if that's what
you meant, or both.

Cheers,
Daniel

--0000000000002a751206014d339c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 24 Jul 2023 at 18:58, Justin Gree=
n &lt;<a href=3D"mailto:greenjustin@chromium.org">greenjustin@chromium.org<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cmd-&gt;modifier[=
0] &amp;&amp;<br></blockquote><div><br></div><div>This is not DRM_FORMAT_MO=
D_INVALID. Please either explicitly compare against INVALID if that&#39;s w=
hat you meant, or against LINEAR if that&#39;s what you meant, or both.</di=
v><div><br></div><div>Cheers,</div><div>Daniel</div></div></div>

--0000000000002a751206014d339c--
