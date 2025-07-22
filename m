Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22306B0CF0D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DE310E3D8;
	Tue, 22 Jul 2025 01:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="ZBwRzRy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
 [136.143.188.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D93010E5C9;
 Tue, 22 Jul 2025 01:28:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753147706; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UqiusmN05OylajW9v34OICXTkYdfJZFJlM02Tn1mS1THNRoOKz3a2iNXThUua0xeq/DqqGjuumZMTF2z/2FKYgHHc6Qmo/IgokwvvNTuRGs+ynPsA24NXxoauhFLaHhDI3a1pvNL4E1wj8u48+7LHOz0H8Kub5VfZwj6P7P5tLw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753147706;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UEihGpmbMTbO264BqTaIMA9Tw7BYchJMrWISdonOVAc=; 
 b=VqGlNsvXpF10PP/a3Tj4f50m1X0AYOH+3PMHZcHfQfFqWsWiVgvfZ38+WUQEsr2OjvUGxReut3S2b88BOz0E7MqTdp8XUsUIZXK1uyLmaOVH746WeK4k5rms7XMH0X3odC+TXbcLk+GryurK5yJng0sKV5/nLbnkaNsxhnQlHoc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
 dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753147706; 
 s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
 bh=UEihGpmbMTbO264BqTaIMA9Tw7BYchJMrWISdonOVAc=;
 b=ZBwRzRy72qFQxoo1J5/u6XGFBfyxHEYNJjbvPN/oZ/nNY3DreUygR8rCn4ZPMXs5
 +AY3qzEvtAppuVPpEZXWzo6ZYBBbM+U7u0+yq0M+br53pAFrbSPB2kYrEjiD94XNrFf
 fp04VsQochfIlGFhUAwMQ2n6e3kVJPZGIw7htGQI=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1753147705708573.5043315837693;
 Mon, 21 Jul 2025 18:28:25 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
 with HTTP;Mon, 21 Jul 2025 18:28:25 -0700 (PDT)
Date: Tue, 22 Jul 2025 05:28:25 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Pingfan Liu" <piliu@redhat.com>
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>,
 "regressions" <regressions@lists.linux.dev>,
 "intel-gfx" <intel-gfx@lists.freedesktop.org>,
 "kexec" <kexec@lists.infradead.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "iommu" <iommu@lists.linux.dev>, "Ben Hutchings" <benh@debian.org>,
 "joonaslahtinen" <joonas.lahtinen@linux.intel.com>,
 "josesouza" <jose.souza@intel.com>,
 "davehansen" <dave.hansen@linux.intel.com>
Message-ID: <1982fbf095a.e7a2ac3764675.6794980000287835465@zohomail.com>
In-Reply-To: <CAF+s44SvWGxwty3FA6ZpR3GoXEbqXRDoT9H6KBj_jy0yM1jjLw@mail.gmail.com>
References: <197d1dc3bff.c01ddb9024897.1898328361232711826@zohomail.com>
 <cd3ca680ac5751368941713c1071e04d69544d47@intel.com>
 <197d710ac39.10e2c241536088.2706332519040181850@zohomail.com>
 <CAF+s44SvWGxwty3FA6ZpR3GoXEbqXRDoT9H6KBj_jy0yM1jjLw@mail.gmail.com>
Subject: Re: Second kexec_file_load (but not kexec_load) fails on i915 if
 CONFIG_INTEL_IOMMU_DEFAULT_ON=n
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr08011227801649ef5f7e57bec5ce126800006a01dd62cd85321444656299f5da466f329abc9f5972571b84:zu0801122719892fc87ce9db57523071ef0000470c690de5ebc037555142d8991ec6bf643b61c310ec60ec14:rf0801122b59948fed72cf8f9346a62cd9000007820cd32a1934dea80873c00512de54f12b5e287a5a5befc3b8ef91e4:ZohoMail
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

 ---- On Mon, 21 Jul 2025 18:18:48 +0400  Pingfan Liu <piliu@redhat.com> wrote --- 
 > IMHO, you could try blacklisting the i915 module to see if
I did this. Problem is in i915.
Here you can see our discussion with i915 devs: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14598
--
Askar Safin
https://types.pl/@safinaskar

