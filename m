Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC54530FB26
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A1A6EE29;
	Thu,  4 Feb 2021 18:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8578F6EE29
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:22:42 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b2so6046841lfq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 10:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dl1jkO0fwdt4pUp2PZMa/AtL4iCw0WB6gtyM8w8mF88=;
 b=dbsHHieWHrkFxo0Xsex1dXCpAjaZ2InxVFPEp2VXSoU9G0Bl8DUCqCegA00Mtxr08N
 2LgEAkoO5XV7eaXMzAr4+ghm7PTh/+zfFocr4mnL44nAakoh15m8E1Za0UttJGG0t0jW
 U+7O4Sq78Np1dnIS8mkSHL0iMgEEriNz40X6YBokwucZqKY6H1ICPDPbfPxWsPyo27NQ
 cpXeEiiwkzh9qJwwXMcIbJAZkNHS+eBmpP+Kr2ZYQnRJTcggSP6qzQPgRJYW6LPykLc8
 EnEsIKA6+Hlrf3tn7zek3YiDOFrPnmWZ+nSKZKEOGwAed29gmFGh/bU+rf7QrohOoi44
 5LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dl1jkO0fwdt4pUp2PZMa/AtL4iCw0WB6gtyM8w8mF88=;
 b=ie7rVGyNlM6EALeNUiKUQHAJVd1B5XFSr4CmDrSRaeSzsFkgL4tHnvSjYZkT4dVEFF
 GY5UhXKgLBqSRvN0ZZ7jt+GelFJBvQ64Pw+VqWYattZZgc7bffak4HbP/hySJuJ9NydM
 I5jsMMZkET0YX7N5O/ZGidbJ+o2JHOsqNeYCWuf74qhi8lPcaUyLp5B3Ka39dm6posl9
 j0iOpxO2ZYcDuyw6T83QbmM5e1nZsQifJkkw9UQlTlMQbhBLpgCpXxvYNASMs4W5YmJJ
 t+bGI4j8R7eGe4XfM4iosm1XcLfFh1sTeY/BV7dWgnX2kvk3d2TLSYScFU6xHxZzGE7X
 KYYA==
X-Gm-Message-State: AOAM531NkIX30gvTGvXZblCp1o1mWQTC/98kX50EFA/G0Pg/evMwoSvK
 T0YvUK9JjxEAuQmc/AgMEsEBMzvBFQcELrqDmms=
X-Google-Smtp-Source: ABdhPJwTSKES/HRpi0u7z/hDixxZ6i0UmvJ5AuQQVLwNDoKVcLfRbLbRWwtIcyOeCOlyCd2CjvDEdEllM257X3YYD7k=
X-Received: by 2002:a19:ad0d:: with SMTP id t13mr344921lfc.539.1612462960932; 
 Thu, 04 Feb 2021 10:22:40 -0800 (PST)
MIME-Version: 1.0
References: <1612287314-5384-1-git-send-email-oliver.graute@gmail.com>
In-Reply-To: <1612287314-5384-1-git-send-email-oliver.graute@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 Feb 2021 15:22:29 -0300
Message-ID: <CAOMZO5CDhUprEn8umeBa0Y3kvU1qSawqJ2Y0-F-EMakmLOu4BQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: simple: add SGD GKTW70SDAD1SD
To: Oliver Graute <oliver.graute@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oliver,

On Tue, Feb 2, 2021 at 2:35 PM Oliver Graute <oliver.graute@gmail.com> wrote:

> +static const struct panel_desc sgd_gktw70sdad1sd = {
> +       .timings = &sgd_gktw70sdad1sd_timing,
> +       .num_timings = 1,
> +       .bpc = 6,
> +       .size = {
> +               .width = 153,
> +               .height = 86,
> +       },
> +       .delay = {
> +               .prepare = 20 + 20 + 10 + 10,

Adding the datasheet label like Marco suggested make it clearer where
these numbers come from : /* T0 + T2 + T3 + T4 */

Glad you got it working on your imx6ul board:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
