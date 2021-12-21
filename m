Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B120A47C535
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 18:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA57110F182;
	Tue, 21 Dec 2021 17:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4810F182
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 17:45:04 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id f125so13026347pgc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=HenZ6CO3BtGV8EorbDJoyPVSzJlzhn+iHRjk9YtqqLPHN4ePZ8QVDtBgVHRXVZQ8oH
 E0dt/72cZS+O3UEUQBk2+LWW1fLeiLTBlj3aHDXDZnQMyY3SpumoJXl7roNtT5mZeWm2
 H+au6mRnSFz1PqeI+TqCvDxtLEiCjbzfJk+Uhoxfpxpz9CSDnUcsu266k5Rq8WtQsMew
 +xvnHyPcHFvyQqL/oE2+nCnXYiWJ9HbUGarG1if1rcp9B8eg2qRKADUee/ZHcDCOd3vr
 RO0poJfpfCVUNlk10B36QA2QtiSLwP32N6TVb0q9IanTbUMnIfPIedRbFT1BNEGa5P9t
 q7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=G4Gunx5WMiHvUnXNUskHujZgOmeguJqC5+YmpGBjplRAG79gztCMN+hlxTI8hSJboD
 CHi65uN7FWBvr64Gy/tIzU9ORbAaEtXBB3M9W26X+TtReqbl2JBjJ0zuCBph9YYMEm3l
 hvogOo+bSXskcKk9jBWnGXOC+270roavmL6dpoijZY901OfRFRlTsoCTBWwDonbKwrUL
 Os0T6OTyzJ2XmHCl+A0R8cXmqjFBodrK98tLe82vYGB27IoOtPy5xCzjpKjkmzg2TMM8
 ZPFJqDXR5ONBbnkhmuzSnwuAPwKH6gfJYjfOgtY5ReQ4jtbkrh2w7+C/QXu/Cbdqos07
 EaxQ==
X-Gm-Message-State: AOAM532WY9tx+Fe3u3KnP37Afuuj9J5EH1yySdglN1sBEyz/LxCo9S9F
 vtAcOBa7iRcGdW/s4c/qmFpDDaa5Xx1+UaGrpIU/9A==
X-Google-Smtp-Source: ABdhPJzVBmLN8aJGGq6rMMoKPHuN2mmCNcgqKIN9eaam0PO9xsjRP0XHPg/gLoicZBE7H9V0/GKtOOkWeTkanEX+IXw=
X-Received: by 2002:a62:d044:0:b0:4ba:6f3b:ab08 with SMTP id
 p65-20020a62d044000000b004ba6f3bab08mr4416682pfg.29.1640108703755; Tue, 21
 Dec 2021 09:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 21 Dec 2021 18:44:52 +0100
Message-ID: <CAG3jFyt8K4mwHrECqOZ3h91YjX=k2MRPsvHHxYT40rR8tyFO_g@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] ti-sn65dsi83 patches
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
