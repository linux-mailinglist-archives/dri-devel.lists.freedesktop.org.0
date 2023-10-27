Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776797D9AEC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4699B10E9AB;
	Fri, 27 Oct 2023 14:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C005910E9AB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698416030; x=1698675230;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=NXEy0uoVBwNoGtL6UxmqRIS3zuKsCsuYUdN8/4nAaz5cJ5g5cfH088743Ziv45NjK
 j7BIspAejDge3ru+l1sTe1m57XRkiEHCW88eCyDrRyKS/56CnN8ngviwaiqaiRe/vE
 6/o4Y45WBbwA9RbaP5Amj+SheRKS9S/NRke48ubuUnefqIhjimMyWLoRrLOz2d7wl7
 mr0vxBqW4rHFEseKdqHmke1NZ8P/YsLf6/nxSXP1OxgkdNO7uZXbCOAYdHn+33BjIk
 QEponBD1O6ahWnQlim77BKBSRKXATAzDuCuLd4fvb2EweratK8Amglb0gnw2Os4lbr
 vwnHq5oAlEtbg==
Date: Fri, 27 Oct 2023 14:13:43 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v2 02/17] drm: Don't treat 0 as -1 in drm_fixp2int_ceil
Message-ID: <qMAL7zP7fC1SNXrjqxY4_wRong2pztZJzyaj-thwIbjNmjPsDqSDneP9QzEU9illV8GMOUrnMhCX9uet7sbx0Qx4yYQT7tjaYRPMoSK-ZTQ=@emersion.fr>
In-Reply-To: <20231019212133.245155-3-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-3-harry.wentland@amd.com>
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher Braga <quic_cbraga@quicinc.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
