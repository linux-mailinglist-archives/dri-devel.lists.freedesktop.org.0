Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2432663F81
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 12:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF84D10E5A8;
	Tue, 10 Jan 2023 11:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28F810E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 11:50:12 +0000 (UTC)
Date: Tue, 10 Jan 2023 11:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673351410; x=1673610610;
 bh=BhsA1aKlglGjpRdMu2peVecDmERAuTyLLhI53Hw2hvM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=la/Z66cN/E6qpNhrTyx8zrQQkk9hgnV8fo5/eY1lDgWGjCmLZ/hcSyPQoSLNfCoPR
 K9PqLZRG5B161zRb9+Tir16v3sqAuG9LFuBpyJ4WfmqQ9EJhjp09zB8jZnr7zbF+Ie
 mIlFSFQijn2kt1K79lMCZpxiyWqJb1c2PNIV3iI4MuY8JT6aVsPolbHYDc0Y1AF/Jy
 8HGeo4nNrvn3lK+8rVyX1LE6uOT0XgsIjkUc12quuDdOC3wIoVslxltG2RwPqhMQ5/
 zrihg82pziQ+OmFctWdgP/VH7eRr3NmBuEO4S+y+v+5P7kARNIPwwuanj2/FT78/gT
 vQqzi7w3eNLrw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/7] drm/atomic: log
 drm_atomic_replace_property_blob_from_id() errors
Message-ID: <3ApQ7DaIcSiZF_O2IUcv0mWD0U0NHrPbx8o_w1433tS0mnUqsUeP_dNm7bls-lS6JVkvzTHcQTWhdBUUAaV4v7GTVy4mGlGRe3j46f2fGlw=@emersion.fr>
In-Reply-To: <ubY43ItyySA6aagyF6bYmc5i4iSfgGzT2sDHKhWyDDcM6H6lgc6h3Hj76nmgGkb3H1MM_df761QqKx0r62I_M3FDF_mX702PY79xNE8C7ak=@emersion.fr>
References: <20221019143736.267324-1-contact@emersion.fr>
 <ubY43ItyySA6aagyF6bYmc5i4iSfgGzT2sDHKhWyDDcM6H6lgc6h3Hj76nmgGkb3H1MM_df761QqKx0r62I_M3FDF_mX702PY79xNE8C7ak=@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping
