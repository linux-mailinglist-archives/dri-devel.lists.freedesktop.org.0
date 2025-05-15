Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A7AB82A5
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8716810E7DA;
	Thu, 15 May 2025 09:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="LDuEZ8Qu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B7610E207;
 Thu, 15 May 2025 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747301446; x=1747560646;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=LDuEZ8QuNc64e4a2XfphIbyrOwDLWKCIMf9cYvWvw2Jv/E3nUsAyqKsNfim2p9j5l
 DzjGicG10/HBNpor9OsLEy2+CgCM8fxOQKkkBVtwo8vR0ySp/VTSP0fbDpuTdqBBMl
 vGVRl+YJvYNzlU8eTs88T/fl8RcrPQ/9S/eX05Ug0cTJcy3xBWGORQJFSI61+rJ4Bl
 GxF6Z3sZq3VUB92x1Vzux6urF4tI8FdrA5xyboMJc/2jPfaF7jlk+Xg+MzBXdPpGxC
 pauFbNk47nRMkvYM2muzQUZYRRrJSPatNwYmR/xoGd8hvpd+dowe/KTjN8hMvs/NUS
 43twFNMg+Npmw==
Date: Thu, 15 May 2025 09:30:41 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 03/43] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20zKjcJZzrPPBvQPqfSipG5vOLLKux9Rzy8_hJE3Ukfnxzcdrti9S5NPVZN8iM52qD3OEQ-2R5rH_uRvA8XRl1tbPUB-PPZFvTOgYETqbQc=@emersion.fr>
In-Reply-To: <20250430011115.223996-4-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-4-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 9e5219d5fb00eb9d82d8685d2d340850e56b0be4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
