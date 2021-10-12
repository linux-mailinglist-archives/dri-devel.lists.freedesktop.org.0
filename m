Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525E42AAD8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F4D6E84C;
	Tue, 12 Oct 2021 17:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB776E84C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 17:33:23 +0000 (UTC)
Date: Tue, 12 Oct 2021 17:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634060000;
 bh=KLjtPUt82LhatxfB+9mZe2JgTsePUbUtNrB8hU5wRv0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=gvY4F145EcvizL0u/y6bn1Y6nEuy0gXoBStXX4r7I5WPre4BQ9N9b+SJ4EHoXVPaS
 Mmewu2dWBxDyv7L3MevU/ai3N78bRJ1EoynCsAznEW1U2ofm8PIw1WRB7dVGb/Q8Jf
 4XlTFDgK/bueCMysqKqhz+oTlsDI5u+XEeDnLTMSs9scGWdQYpgo8LJ+r60Hz0iEJI
 35nAEO5JxdOH0m2IIRKxmcE9yZ6OUNrVLccFrHOpaJi3uxmYGSVrFWB4E+y/jbh0qu
 CJzO+l4CoBIE9GUIw0V2ZJWhL/pl1ija/oCczFOdBqsJ/iu3qEeuJ9eZob01mZkLYZ
 U2pQj9iHnHN6Q==
To: John Cox <jc@kynesim.co.uk>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: Should multiple PRIME_FD_TO_HANDLE ioctls on the same fd require
 multiple GEM_CLOSE?
Message-ID: <nxaw17TpxhjASmae6VSj_yGM78BHFZF6RXy7s7LFJ3C7mmbDfGaafJ9umB5_08Xlf7X8SKAKhEEGOa-WFiv-jLkYDi_Yjn6Hdhn76YgrTuI=@emersion.fr>
In-Reply-To: <mg3bmgt12b5s7qlqn1gkc5q8f75dgfu91m@4ax.com>
References: <mg3bmgt12b5s7qlqn1gkc5q8f75dgfu91m@4ax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, this is expected behavior, even if it's not intuitive. For more
details, see:

https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
