Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DB47961A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 22:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D0810E4FE;
	Fri, 17 Dec 2021 21:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbnc109.isp.belgacom.be (mailbnc109.isp.belgacom.be
 [195.238.20.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50810E342;
 Fri, 17 Dec 2021 21:17:55 +0000 (UTC)
X-ExtLoop: 1
X-IPAS-Result: =?us-ascii?q?A2AQGQA0/bxh/0FWh1JXAxwBAQE8AQEEBAEBAgEBBwEBF?=
 =?us-ascii?q?QmBUgGBOQIBAQEBAQE7gSdWhG2JSYY+CgaBPwM7AYpikUQMgVwLAQEBAQEBA?=
 =?us-ascii?q?QEBCRICIQkBAgQBAYUABAKDNCY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBA?=
 =?us-ascii?q?QEBBQQBgRuFLzkNQAEQAYFjIoQsHBcMGDMqKCIrgg1ZgnEqC7EwgTOBAYRWW?=
 =?us-ascii?q?YJngV0GI4EVAgEBAQEBAQEBiiKES32BEIM+hU8BEgEIXgIIgwCCLgSSOxKBH?=
 =?us-ascii?q?C4+DBgFbD8dGys1L5FfFI03n3yDTIpolC4EFjOWE5FKljAgjF+ZTIF4Txwia?=
 =?us-ascii?q?gZNIBgaBIFfGIEQET8oV5ZPhUtDaAIGCwEBAwmFQwEeCBMFBQEBhA2ERoIgA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23: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
 W1D+NXS+gWwgCVe
IronPort-Data: A9a23:Sj00J646N6nCqg1a3EcyqwxRtJjGchMFZxGqfqrLsTDasY5as4F+v
 jdNXW+HbKmDY2ejeot3Pd7n9hhUv8DXzYIxGgdvri08Zn8b8sCt6fZ1jqvT04J+CuWZESqLO
 u1HMoGowPgcFyOa/lH0WlTYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbdm2tQAbeWRWmthh
 /uj+6UzB3f4g1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJM53yZWKEpfNatI88thW6
 Ar05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkSvqkAqm8A87ko0HKpDeE58gBqEpIAy1
 epOibexcgQIbpSZzYzxUzEAe81/FaRC8rLdPRBTs+TDlQufKCaqk6soUhxe0Y4wo46bBUlK9
 PYGACsOfxaOm6S8zdpXT8E13Zxzd5myZ9x3VndI3QH9MOkfHoH6Hp7p6ZxqhSlrp59rAqOLD
 yYeQX81BPjaWDVfPU0YTZ4zguqsrn3+aCFD7kLTorA4i0DDyxZ+lbHrNt3IfNeHbcFUhVqD4
 Gzc8mn1DwoZKNuHjz2f/RqEg+LUlGb3VZw6ELyj6uUsjkeey2AeEx4KUkP9puO24mayQdMaJ
 0EK9y4Gqakp6FftQMPwUhG1u32YuQZaXMBfe8Ul4RCJw6zYpgqUGGUAZjpAc8A98sEsSDEm2
 0SKg9TxQzt1v9W9TXOb66fRqD6+OCE9M2APf2kHQBED7t2lp5s85jrBSc1vHauditzuBSq2z
 TeRoCU7wbIJgqYj2L+y5VDGiCnpqpXXVAky40DSV2Ss4Q5jTICifICl7B7c9/koBIOQVEWAu
 j4enNWd5eQHJZSQjDGDBuIXE9mB7uyIM3vY2HZgGpAg83Km/HvLQGxLyDhwOF0sYpxBIGS0J
 R+N/F0MopNCOnKvbKQxZoS8F4Ety6zhE9mjWv28gsdyX6WdvTSvpElGDXN8FUi0+KTwucnT8
 qt3vSph4bj2xEinIPeLqz8h7IIW
IronPort-HdrOrdr: A9a23:KlZ7gKO8SdpOD8BcTtSjsMiBIKoaSvp037BL7S5MoHluGPBw+P
 rAoB12726WtN86YgBEpTn4AtjjfZq+z/9ICOsqUYtKNTOO0FdAR7sD0WKN+VDd8n3FndJg6Q
 ==
X-IronPort-Anti-Spam-Filtered: true
X-ProximusIPWarmup: true
Received: from aftr-82-135-86-65.dynamic.mnet-online.de (HELO albert)
 ([82.135.86.65])
 by relay.proximus.be with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 22:17:53 +0100
Received: from libv by albert with local (Exim 4.84_2)
 (envelope-from <libv@skynet.be>)
 id 1myKbv-0003on-KA; Fri, 17 Dec 2021 22:17:51 +0100
Date: Fri, 17 Dec 2021 22:17:51 +0100
From: Luc Verhaegen <libv@skynet.be>
To: xorg-devel@lists.x.org, xorg-announce@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 fosdem@lists.fosdem.org
Subject: CFP FOSDEM22 Graphics DevRoom
Message-ID: <20211217211751.GA14623@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Reply-To: graphics-devroom-manager@fosdem.org
Cc: graphics-devroom-manager@fosdem.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

After a hiatus in 2021, the upcoming FOSDEM will have a graphics DevRoom 
again. This time round on a sunday, the 6th of February 2022.

As usual, the focus of this DevRoom is:
* Graphics drivers: from display to media to 3d drivers, both in kernel 
  or userspace. Be it part of DRM, KMS, V4L, (direct)FB, Xorg, Mesa...
* Input drivers: kernel and userspace.
* Windowing systems: X, Wayland, Mir, directFB, ...
* Low level toolkit stuff
* Low level machine learning.
* Colour management.
* ...

FOSDEM '22 is sadly a virtual event again. While a virtual FOSDEM lacks 
all the wonderful madness of a real life FOSDEM, it does have the 
advantage of not having to deal with travel and accomodation, the 
physics of humans trundling around a big university campus, or a 
booklet.

Talks:
------

Time slots will be the usual 25/50 minute talk length, you are free to 
fill this time up as you see fit, but you might want to reserve 5 
minutes for Q&A. I expect there to be 8h available for scheduling.

Since there are no travel accomodations to deal with, and there are no 
people who physically need to get from one end of the ULB campus to the 
other, and there are no 5000+ booklets to be printed, there is no first 
come, first serve requirement this year round. But the other side of 
that coin is that talks can be hard dropped from the devroom managers' 
side until very late in the process if anything is not in order.

Hard talk submission deadline: 30th of december, 23:59UTC.

Further info on when a talk video should be finished to fit in the 
FOSDEM infrastructure will follow, but expect somewhere between january 
16th and 23rd, 3-2 weeks before the event. Again, more details will 
follow.

Talk submission and review panel:
Arkadiusz Hiler (ivyl)
Luc Verhaegen (libv)
Martin Ruokala (mupuf)

Successful submitters will receive an email with further information on 
the 31st, as it's not as if I will have anything better to do given that 
mini-me will have been stabbed only once by then ;)

Pentabarf:
----------

Since FOSDEM has had to flash migrate to virtual last year, no further 
work was sadly done to replace or fix pentabarf, a tool originally made 
to create the fancy FOSDEM booklet, so its pent-up-clunkiness has to be 
used again, especially since it actually works :)

https://penta.fosdem.org/submission/FOSDEM22

Re-use your accounts from the previous years. If you have forgotten your 
password, then you can reset it here:
https://penta.fosdem.org/user/forgot_password

Here are the basic requirements before we consider a talk worth 
scheduling:

On your personal page:
* General:
  * First Name
  * Last Name
  * Nickname
  * Public Name
  * Image
* Contact:
  * Contact email address
* Biography:
  * Short Biography

On your event page:
* On the General page:
  * Event title
  * Event subtitle.
  * Track: Graphics Devroom
* Persons:
  * Add yourself as speaker.
* Abstract:
  * Short abstract

Unlike IRL events with a booklet, you should be able to tweak this 
information pretty much until you are finished with your talk.

That's it, hope to see your submission in penta, and your talk at 
FOSDEM.

Luc Verhaegen.
