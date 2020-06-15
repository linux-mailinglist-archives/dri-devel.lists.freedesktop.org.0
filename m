Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71621FA46D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 01:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE1E6E55E;
	Mon, 15 Jun 2020 23:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79586E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 23:37:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592264228; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2DtTXOmQcCDu/XLc8Y9feTA+UARZggV+DWpANCHY8bY=;
 b=cNdeCxMZ67V1IYkpk+wC2aXMdu+Nqu1ftuV7/W8Exb/WtscRP47I5i0B/INbjN4Q4sy4B8D5
 5Mcssjr79hZYHKCj7XU/NhpatDZlbOeVDQ9Jy4tXKtVEZGCGbajd2EdkenJy6/KbSk/Cd42R
 6YwaTBbOCj7fTurR6foyl5ixzeY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ee80615fe1db4db89eea134 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 23:36:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 35A3AC43395; Mon, 15 Jun 2020 23:36:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 650E9C433CA;
 Mon, 15 Jun 2020 23:36:52 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 15 Jun 2020 16:36:52 -0700
From: tanmay@codeaurora.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] [PATCH v6 0/5] Add support for DisplayPort driver on
In-Reply-To: <CAOCk7NrX9Lk6GQKXcFMd1CHHu7CjVg7hUAwt1LyNFdVHHGPO-g@mail.gmail.com>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
 <159200440578.62212.5195358467251573190@swboyd.mtv.corp.google.com>
 <1eda01da33b620ddee5162be3326853f@codeaurora.org>
 <CAOCk7NrX9Lk6GQKXcFMd1CHHu7CjVg7hUAwt1LyNFdVHHGPO-g@mail.gmail.com>
Message-ID: <fa12d16e7aeda5971b2a65ac5414f18c@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: DTML <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-15 16:04, Jeffrey Hugo wrote:
> On Mon, Jun 15, 2020 at 4:51 PM <tanmay@codeaurora.org> wrote:
>> 
>> On 2020-06-12 16:26, Stephen Boyd wrote:
>> 
>> Thanks for reviews Stephen.
>> 
>> > Quoting Tanmay Shah (2020-06-11 18:50:25)
>> >> These patches add support for Display-Port driver on SnapDragon
>> >> hardware. It adds
>> >> DP driver and DP PLL driver files along with the needed device-tree
>> >> bindings.
>> >>
>> >> The block diagram of DP driver is shown below:
>> >>
>> >>
>> >>                  +-------------+
>> >>                  |DRM FRAMEWORK|
>> >>                  +------+------+
>> >>                         |
>> >>                    +----v----+
>> >>                    | DP DRM  |
>> >>                    +----+----+
>> >>                         |
>> >>                    +----v----+
>> >>      +------------+|   DP    +----------++------+
>> >>      +        +---+| DISPLAY |+---+      |      |
>> >>      |        +    +-+-----+-+    |      |      |
>> >>      |        |      |     |      |      |      |
>> >>      |        |      |     |      |      |      |
>> >>      |        |      |     |      |      |      |
>> >>      v        v      v     v      v      v      v
>> >>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
>> >>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
>> >>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
>> >>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
>> >>     |                              |     |
>> >>  +--v---+                         +v-----v+
>> >>  |DEVICE|                         |  DP   |
>> >>  | TREE |                         |CATALOG|
>> >>  +------+                         +---+---+
>> >>                                       |
>> >>                                   +---v----+
>> >>                                   |CTRL/PHY|
>> >>                                   |   HW   |
>> >>                                   +--------+
>> >>
>> >
>> > I've never seen a block diagram for a driver before...
>> >
>> It is here for v5. https://patchwork.freedesktop.org/series/74312/
> 
> I think Stephen is nitpicking your wording, and you seem to not be
> understanding his comment.  I'm sorry if I am mistaken.
> 
> The "DP driver" would seem to refer to the linux software driver you
> are proposing patches for, however this diagram looks like a hardware
> diagram of the various hardware blocks that the Linux driver code (the
> "DP driver") is expected to interact with.  I believe you should
> re-word "The block diagram of DP driver is shown below:" to be more
> specific of what you are describing with your figure.  IE your words
> say this is a block diagram of the software, when it looks like it is
> a block diagram of the hardware.

Thanks for reviews.

I am not sure what Stephen meant, but this diagram was available before.

Just for clarification this is not hardware diagram at all.
This is modeling of DP driver for msm.
Each box name above except "DRM framework", is file name in driver i.e. 
software module.
Each line and arrow shows how modules interact with each other.

For example, "DP PARSER" Box is pointing towards "DEVICE TREE" Box, that 
means
dp_parser.c file contains functions which are parsing device tree 
properties and so on...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
