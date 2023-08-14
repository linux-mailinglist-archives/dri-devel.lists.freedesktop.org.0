Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF577BBEA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 16:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBEB10E06B;
	Mon, 14 Aug 2023 14:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001910E06B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 14:46:13 +0000 (UTC)
Date: Mon, 14 Aug 2023 14:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692024371; x=1692283571;
 bh=JgHL4UkB62lNPVFi4VtHc4HqfqxAHV8a9vkTMUKP2EI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=TA2unefP/rpLSJlZorCbVA6ebVkM/k5ec9jj5gioCQzF6wad97lvLeJcM1EeAKlZV
 L5BQj4KBiDty5o8qRv+w/Id63YQYHoshmHMrYZVzyhtdjtMyQnM8RWhq17v8guLPlo
 XA0cid0ft6SfJGFOqjj9UbJDcC8UDa11tdQVllw4M6OU/gPbPZ51JZ0suWD/FU9tFr
 cqBr7eyixIOCcVKPUmr94rwVGBAh5pK4hOpVKue0GEw5mcluC6nOFkmJ/Fux9v28uL
 iBKnXONhJonrMNTOgVuxnJcp2L+pOPNRJ73+HH6VAY2RU1GAA7eeM92XdWwhGp40XJ
 B6CItkfrPu57g==
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH RFC 03/13] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <lU58OYuuI5kXdktRrB0ihxVgpjmtFX-AUMWy_9kbIFm0k27T8hNwNJxdO2UB3wVk_4Zdn7aZAl14V_hpmPoZg1cgIfizIbH5JLL0k7-UGzc=@emersion.fr>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-3-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
 <20230814-kms-hdmi-connector-state-v1-3-048054df3654@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+1 for a standardized property. wlroots is blocked on the kernel
making this property standard before starting using it.

Can docs be added in the "Standard Connector Properties" section?
