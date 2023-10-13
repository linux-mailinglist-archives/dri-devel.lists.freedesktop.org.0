Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57987C8833
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 17:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4B10E145;
	Fri, 13 Oct 2023 15:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Fri, 13 Oct 2023 15:01:15 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1876610E145
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 15:01:14 +0000 (UTC)
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net
 [88.217.226.44]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 2E6502FC0052;
 Fri, 13 Oct 2023 16:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1697208880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUgetVycmc11Sy23hS1geccFjAg3uLc1PoJalbYEo1A=;
 b=J8AgwRiWLaST6rVU1SVH02DPcyjEHDLQmnv1X7wYEohahPt5H29XeiEg3p1zW4epN/5lA8
 38a2KpVUTqkiQTDFKHGdAXklNOvFXvojESrGFHqYNsqVMyrHokFyjBYqNsvqnsY9gBUm0j
 jJVGg9wR/zr874sLYF/SRnmHAmoTv9g=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
Date: Fri, 13 Oct 2023 16:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, ojeda@kernel.org
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

coming from the leds mailing list I'm writing with Pavel how to best handle 
per-key RGB keyboards.

His suggestion was that it could be implemented as an aux display, but he also 
suggested that I ask first if this fits.

The specific keyboard RGB controller I want to implement takes 6*21 rgb values. 
However not every one is actually mapped to a physical key. e.g. the bottom row 
needs less entries because of the space bar. Additionally the keys are ofc not 
in a straight line from top to bottom.

Best regards,

Werner

