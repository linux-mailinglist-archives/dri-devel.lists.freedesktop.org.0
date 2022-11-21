Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A6063212C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615C10E036;
	Mon, 21 Nov 2022 11:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7AD10E036
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:Cc:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1g943rh/a2EtqDcIab+Z59tn2hnQTsjs1qXHUMFguac=; b=k4xrJGgbU71tffXtbjg27l+WxP
 v9kJbJ/+4LFQPySkqSVehcM/qSaXVlCbJtrUmkHO4IcbM0bSAaFtndDlGUMKRp0idFuuf+SAm6aML
 AOHVtUtwEemkdeHNZFfG861k1TizJeioh8imU6r6NfGhRYC5Q8OziQoAh/eJAn50AXoGO1CVbOghO
 Ps3ZaoW4YeEB2lMjHRVQ8hB/bJtkBgLoaMYkj06LoXU4bYKpAfA2n1i1zcPkOV7iIo8YRynOTQn4A
 pZGrY2aTYgW7ru/qLh5hYAgJaR8odFPZ9fJsjHeNPGU991u+Y6hp7lIeB6AFkVJhc4Z/k7nYVLK7d
 Q/8t+0dw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=56753)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ox5IE-0004Kk-BV; Mon, 21 Nov 2022 12:48:54 +0100
Message-ID: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
Date: Mon, 21 Nov 2022 12:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: dri-devel@lists.freedesktop.org
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: git send-email friendly smtp provider anyone?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

A couple of years ago my email provider blocked me from using git
send-email with their smtp server. So I switched to the one my ISP
provides. Now my ISP have outsourced their email service so the first 3
emails gets through and the rest looks like it ends up in a tar pit or
something, 18 hours later and 5 of 7 emails have gotten through. I have
asked them about this, but I fear the answer will be this is not
supported since they now don't have the service in-house anymore. I'm
waiting for a reply.

Today I tried sendinblue.com since they have a free plan, but they
insert <br> in the emails so that didn't work out. They also have some
kind of queue, after 1 hour 6 of 7 emails have gotten through.

Does anyone have an smtp provider to recommend that works with git
send-email and that sends out all the emails at once?

I have a patchset that I want to send out.

Noralf.
