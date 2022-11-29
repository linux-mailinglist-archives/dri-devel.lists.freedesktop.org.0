Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B563BDCA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 11:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EC310E3AC;
	Tue, 29 Nov 2022 10:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4092410E07B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 10:18:52 +0000 (UTC)
Date: Tue, 29 Nov 2022 10:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1669717130; x=1669976330;
 bh=3ruB+54vaggWqACqFh3bfr+P9VMe9cYDAJwDG7DhiIc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=C2X1SP1kPW8xAUzgf2A1seIk4F5rUEJ6Whx/Ij2X0A1hQ4GZ1/MArMbn5L1xRq7UF
 lJ7zLx07qkbgcVHReGsI5QOSd+ZOsCFHS4nFY1u7QkkQPyS25CPWNJ6BbV7Qet/kxC
 +P565ozE3L9xSF5Yilxaf19XdQCSNkNVTUmsdwQ43bOKcqrsa82kzIOiHvtrU9D4vA
 S+CHE1TS9y3AJLVxCYpQwtn+uflUQwfGCCkaL3KzO2VjKhcIZxSQMPcEtfyTjHjc6u
 K9gl4ARrrTow+5bh5+ALb9Azx0bEyJwuxFRp4Fi5cjpGKysJWWHVwVqwGJ7bgm856J
 c3hf7eidn+amg==
To: Hsia-Jun Li <randy.li@synaptics.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm/fourcc: Add a modifier for contiguous memory
Message-ID: <sHR1F4GVsLkT7F5iPXtRNZMZ1R_vSHulae_ZqcpUXP6_u3t85f_JnERnKg5Pombd1gDlNi24rBVbeDGK6XddDTzyRPbipWsmRt78DDDl4o0=@emersion.fr>
In-Reply-To: <20221129101030.57499-1-randy.li@synaptics.com>
References: <20221129101030.57499-1-randy.li@synaptics.com>
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
Cc: ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 tzimmermann@suse.de, tfiga@chromium.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Format modifiers are for the buffer layout only, not for the allocation
parameters, placement, etc. See the doc comment at the top of
drm_fourcc.h.
