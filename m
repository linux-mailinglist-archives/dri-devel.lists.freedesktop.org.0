Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE215206D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 19:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397486E8B4;
	Tue,  4 Feb 2020 18:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7818B6E8B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 18:26:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (64.177-245-81.adsl-dyn.isp.belgacom.be [81.245.177.64])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 706BFA58;
 Tue,  4 Feb 2020 19:26:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1580840796;
 bh=9e6q/GR/ToUsr4j3Y7oed6BavldY3aiTXQl2f/JJNTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RyDIIG+fspa4V5SOxST3NMsr1KQmri+0b00VntTLAMB/JjR8IagZt2WhGDbkBukpf
 gj7Ab/K6aMC7tniN6y0Gvz7OaMJjm1/jF9RfsvO2TrDuM+uBkVeR8TpJr1s0/0serb
 lwg59Ry0ikPZ0A3yIpQ0whmxZs/Dpm1BRlVNkS94=
Date: Tue, 4 Feb 2020 20:26:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
Message-ID: <20200204182621.GE20396@pendragon.ideasonboard.com>
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 04, 2020 at 06:39:34PM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko wrote:
> > Replace with appropriate types.h.
> 
> Thanks for your patch!
> 
> I have only one very short question: why?

Likewise :-) The patch itself looks fine, but the commit message is a
bit terse.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
