Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE0B067CE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 22:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BB310E67D;
	Tue, 15 Jul 2025 20:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="JeCulTPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
 [136.143.188.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA5E10E67B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 20:35:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752611740; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GDJjWFDfW1vJ1KJF7yBcUwNgNCQFAUvIMO9SemxXqbga86IUwLdPeOrIBNI4v6pRkHtM8LIy40Nr46Nl7tg+CjTeohCbFi4YIhvotlmEIbp/+pZUZ3hlO6OiDeK/MIxUMsfI4gWfx4xSyu7ICFKtrC54nqCFFdKBheC97u/4/hg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752611740;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sg9cSog/t/C7MxTkxerRGoUzchkZtB9WA0zvkJJJ/Zo=; 
 b=WSbK8EHz6xWFbEcut50V9u7LTZxmliiKUKB/2gauJrZTWufmMjJTq1H9OvWycZ2EH2YDXyziLDcDGpJaMU/9YrKhIjN6lpGHym83mNrXoTuz5iqKmrCZ+adyCpcFCcMdB3UBTZS2xpTPHjcyl7yHLCGI/hpCuhjj2mdJUSHoG2w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
 dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752611740; 
 s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
 bh=sg9cSog/t/C7MxTkxerRGoUzchkZtB9WA0zvkJJJ/Zo=;
 b=JeCulTPbS4YKzRSGkVqWaNsB8rVuw2pby73Qsgz+UVsi52LN1HjlH3tTUvrSytYn
 LMHMfAPCNh8tl3z7nJP/7ANdpz7uSDe9vWCoIbMMnLQ4u1HRCmGn3WwM8HLGXkLOsnO
 57CICzRQhmwquvw6WwSZmSlOIxrvbroC8AxhsCTg=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1752611737365232.38019705711758;
 Tue, 15 Jul 2025 13:35:37 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
 with HTTP;Tue, 15 Jul 2025 13:35:37 -0700 (PDT)
Date: Wed, 16 Jul 2025 00:35:37 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: "ryasuoka" <ryasuoka@redhat.com>, "airlied" <airlied@gmail.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "kraxel" <kraxel@redhat.com>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 "mripard" <mripard@kernel.org>, "simona" <simona@ffwll.ch>,
 "tzimmermann" <tzimmermann@suse.de>,
 "virtualization" <virtualization@lists.linux.dev>
Message-ID: <1980fcccefe.10a7c92b36705.2744765212931179004@zohomail.com>
In-Reply-To: <1961897d-cf42-4495-aec7-f4c20dfe7566@redhat.com>
References: <20250613132023.106946-1-ryasuoka@redhat.com>
 <20250714000456.14-1-safinaskar@zohomail.com>
 <1961897d-cf42-4495-aec7-f4c20dfe7566@redhat.com>
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112275341d22ecfcfc54868533f56000088b215d2d476d17911edfdb24155f2b69b123163ceca421cc3:zu080112271e08d72822589c1ba2a422a30000446941fd3c8f2f1f8d69dca0f28d793e6fe8d7f37d6a1996f4:rf0801122b1ee2434f1540b8a76694f9370000d8052efa9f28df9d83271c92cb30b6fe6e834fd8c4b0247f5377572e2a:ZohoMail
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

 ---- On Tue, 15 Jul 2025 12:57:04 +0400  Jocelyn Falempe <jfalempe@redhat.com> wrote --- 
 > "Normal panics", is just the console logs through fbcon. The problem is 

Thank you for answer! Is this possible to configure system such that fbcon works normally,
VTs work normally (i. e. via framebuffer), but when panic happens, it is displayed via drm_panic? This seems to
be solution to the problem.

--
Askar Safin
https://types.pl/@safinaskar

