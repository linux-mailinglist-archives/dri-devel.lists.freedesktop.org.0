Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69566A5931
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6405F10E0AD;
	Tue, 28 Feb 2023 12:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Tue, 28 Feb 2023 12:38:18 UTC
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233F310E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:38:17 +0000 (UTC)
Received: (qmail 1312 invoked by uid 1000); 28 Feb 2023 12:31:34 -0000
Message-ID: <20230228123134.1311.qmail@stuge.se>
Date: Tue, 28 Feb 2023 12:31:34 +0000
From: Peter Stuge <peter@stuge.se>
To: Simon Ser <contact@emersion.fr>
Subject: Re: gud: set PATH connector property
References: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
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
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

Simon Ser wrote:
> Would it be possible to set the PATH connector property based on the
> USB port used by gud?

Sadly not really easily.

The physical topology underneath each host controller is stable but
bus numbers (usb1, usb2 etc.) are not.

For onboard host controllers it could be possible to anchor to a
PCI or platform bus device.

But busses on expansion cards can't be recognized so easily without
using maybe serial numbers - which may be cloned across multiple
devices - we can't know.


> This would give user-space a persistent identifier for the connector:
> if the user plugs in a USB display on a given port, the PATH would be
> the same even if the machine rebooted or the displays were plugged in
> in a different order.

How about using e.g. the serial number of the gud USB device instead
of host topology, or maybe some other information from the panel
behind it?


//Peter
