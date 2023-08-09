Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F1E776508
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC7C10E468;
	Wed,  9 Aug 2023 16:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9B910E467
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:29:57 +0000 (UTC)
Date: Wed, 09 Aug 2023 16:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1691598595; x=1691857795;
 bh=O1w/ucVjW1RZG0QMVGnD3OfJ+lZYTt0hdZzGDMr7mrY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dHuud5VF528TURE7XfcpCCyqj3wfoJxNZfEPdoY2CQoW/htMytncF8W3jjmhCqCXr
 4exPU3p/e+FtOfEEv5oR1LphXNlZgfeRdsSV/whUHlbaWoXWHLW3rmqDqU08vpYxN9
 apmrmdSQv41o3ATb5Hytv52MEB7gvphNdsf4v5TNSksw/A4EW0ceae/qwMMoIF40IG
 UckNrgjij2GY0/I+rsxnUK4rGDDzhEcV3laDnRA1DEHrPhrwSAQl0cBEHWp3vH3oo7
 GO2u8DluYs+D9VFn1n4EOQAxSZPu2Z5URoCNv23FCBD1ApR6kcXMDCIUrH9C/gKbWn
 3+fGnYAvpjhlQ==
To: Jocelyn Falempe <jfalempe@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
Message-ID: <nQb7qV9Caf3Dz2iA2hmv_CC6zJ-7u7Odzz_NU2SB7AcbkGMq5pBnOhh7N2PtIPQfymH_N5wUfNKV1AkKqx36j-DiMVwDzHeH3wgwI5bUdNQ=@emersion.fr>
In-Reply-To: <20230807140317.26146-2-jfalempe@redhat.com>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, mripard@kernel.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good to me.

Maybe the IN_FORMATS prop docs is a better place for this?
