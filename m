Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F514E0E0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 19:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16C6E8DB;
	Thu, 30 Jan 2020 18:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AE96E8DC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 18:37:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 85E452005B;
 Thu, 30 Jan 2020 19:37:00 +0100 (CET)
Date: Thu, 30 Jan 2020 19:36:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] Add support for EDT ETM043080DH6-GP
Message-ID: <20200130183658.GC21265@ravnborg.org>
References: <1580386118-22895-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580386118-22895-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=p5ElJ3KdEj16-cqpNAAA:9 a=CjuIK1q_8ugA:10
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
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marian-Christian.

Thanks for the quick reponse.
On Thu, Jan 30, 2020 at 12:08:36PM +0000, Marian-Cristian Rotariu wrote:
> Second version of patch-set that adds support for EDT ETM043080DH6-GP. This
> is a 480x272 TFT Display with capacitive touchscreen and it is compatible
> with the simple panel driver.
> 
> We have tested it with our iWave-G22D Generic SODIMM Development Board.
> 
> In v2, after Sam Ravnborg's review, I've rebased the patches against
> drm-misc-next and modified the proper bindings file for the simple panels.
> 
> I have also added the mandatory connector-type field and corrected the bus
> type as it is a 18bbp, therefore an RGB666.
> 
> Unfortunately, we do not have access to the datasheet, therefore we could
> not use the display_timings format.
> 
> Marian-Cristian Rotariu (2):
>   dt-bindings: display: Add bindings for EDT panel
>   drm/panel: simple: Add EDT panel support
Applied to drm-misc-next and pushed out.
Note: Will hit next merge window, as it is too late for the current merge window.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
