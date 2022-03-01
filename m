Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27734C8C35
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 14:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2187310EC38;
	Tue,  1 Mar 2022 13:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D5310EC38
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 13:03:11 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso2126158pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=hryDL4Psc7A2DADVgS+/xZHfmqAye9BmCnsOUVUA4rd9Ub9SPy5xaAKBzTdva7Kt2/
 eOZeSQ7q4Sv8cOpwuozfWU5M0MINFjUMfJEHwDS6fEALqZ7FPXXHenYhmkGqNsqfnjH3
 HmK9ki1M5pJjidfmqc32T7AZs9t33O2FztlpY4JYJsxCvPIvytGc0B90eNdbqeSgMbm3
 mHPHcNfDbRYOEpqC7Uc2g5b9pXxbfgOntu4n60RLK4f+qKbFN1SPdCV+F5IUBasIl+IQ
 PPXamQS+idLuV/uR1YOCyyL+Wm3tq+rE7e3mj8G+Ob4AYS1ayu+x+XGWtuVtuq/Zvg95
 ldUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=y1pGet7FC5hEaMcYYH2ets51W4ogTLKxp+o3yV6+TXdfOocaAndkQCvwsNwVp1sl9L
 +RtwIiSG5ilxUvHjqHuRV45/GycCJyw6xKQGW2otjKz4W4JMYvmggJgM9rCtDbRoiR+f
 qKsuHTFL3BOUhT5MBbsGqmjlQhIRgRCZanoQ5XpxP1KAJhNOY0fF1yOukxzWISQXY3c7
 UE+AFhOvGZlLG+kF0ApbbKEraiMs0PY5Z5Lej+65GHBNoQIgKmIcuIcBFgthogAssT+d
 JDC9TiXi0EUj92xesce9lnewfDpNKN2EV/CCJDTRoPFAZPze0UM+IhZI/DY7EvhBpepW
 vGkg==
X-Gm-Message-State: AOAM532SUGPK8M7BJLjzfqxXNUzYf8dAGq5sQ0nXrS3pYMtBc023T3IH
 LHj4ufwrUPT4qm/sVG50yYC0d/znGdqUc/TlS2pHCQ==
X-Google-Smtp-Source: ABdhPJxmaOzkubA4LloKj0vIJt3HI5cp8/4dVYmXOY0G1ql0dL06gr2ZLpXtn8FLLm9afcQcAlomrk/lOrFHYIOZQMI=
X-Received: by 2002:a17:902:7044:b0:14e:e1b1:bb0e with SMTP id
 h4-20020a170902704400b0014ee1b1bb0emr25237709plt.65.1646139791286; Tue, 01
 Mar 2022 05:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20220217082224.1823916-1-hsinyi@chromium.org>
 <20220217083119.GA3781632@anxtwsw-Precision-3640-Tower>
 <CAJMQK-gDDtPT-kM56WodE=eo1UAZShbshLsuy_o-YuhorFe8mw@mail.gmail.com>
In-Reply-To: <CAJMQK-gDDtPT-kM56WodE=eo1UAZShbshLsuy_o-YuhorFe8mw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 1 Mar 2022 14:03:00 +0100
Message-ID: <CAG3jFysk6X9g5X1bVW+e21tAAw8UuYOBAHbAnQi43JUF+6UhVA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Clear the DP_AUX_I2C_MOT bit passed in aux
 read command.
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
