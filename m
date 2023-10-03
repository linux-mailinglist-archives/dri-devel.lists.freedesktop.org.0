Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D511A7B653D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 11:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29CB10E265;
	Tue,  3 Oct 2023 09:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C9210E039
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1696324542; x=1696583742;
 bh=nen70pPfYsFQ+/UgrSVi4kwZXiA3ZJJ5IdOzvntgq2Q=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=WuPyHewUmOZtWm/VDzREBchcdW8oW4JlA35XXoglek6TeI4z5d3mQZrxyO+a404yc
 NtnygGO4bukAEK/La5SfEncEt1MlfEFlqBE+7spGznfTNxzPLNO7Q9/pgOu/fV5Nkr
 tjwoWt+8oW9h2MIkPh6MXaTHLvc4z1sWROoUFjqFMYpAPDpFIY/s6EM3tZ7V8fNVUs
 CMPSK5cqn5PkoNeYuhwhh6micd5tAOnmg1799rKSdosjz2ZWKTgOYtPFM0cM64kHYd
 AwWgtlbSzmiQIyR13yufqAqEhAyQUwuwwVHao91DK+Z38BpID8tQHN+DZwfTTywBtr
 lY9z+DQHduoeA==
Date: Tue, 03 Oct 2023 09:15:31 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v1 03/12] drm/connector: extend PATH property to
 covert Type-C case
Message-ID: <cnx7qh-CGEiQ1zPNo1th85qcZYrw8fcWRQgb3a66yrdVvLrf8nZEmKjshodkHdWVdBS4Qzgj0FegzZLUhj890KSuZCe9l8ZC2Or9CZIlT2s=@emersion.fr>
In-Reply-To: <20230903214150.2877023-4-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-4-dmitry.baryshkov@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, September 3rd, 2023 at 23:41, Dmitry Baryshkov <dmitry.baryshkov=
@linaro.org> wrote:

> To facilitate this, reuse the 'PATH' property, which was used to
> describe the DP port in the DP MST configuration. Use either
> 'typec:portN' to point out to the Type-C port class device, or just
> 'typec:' if the corresponding port can not be identified.

Typo: should be "typec" without the colon I think?

What are the situations where the port cannot be identified? It seems
weird to use the PATH property in that case.
