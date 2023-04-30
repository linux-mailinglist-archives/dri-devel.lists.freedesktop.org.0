Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A606F2F18
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 09:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707C010E2F3;
	Mon,  1 May 2023 07:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Sun, 30 Apr 2023 11:53:08 UTC
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEFA10E031;
 Sun, 30 Apr 2023 11:53:08 +0000 (UTC)
Received: from [10.130.10.1] (unknown [10.130.10.1])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id 479831A0238;
 Sun, 30 Apr 2023 13:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1682855129;
 bh=TkUHDf61Y7Il4LJxKW/DqEJAutZiMUDcL/FOAPUx7JY=;
 h=Date:From:To:Subject;
 b=jCuu3gLe2qZA5yiw0cfkq7ZqhW84LRGTDqsKwQB08Toqg5VWvHv7aQ3Qkhw9HPnQe
 obiEM/FlWKW0ESMXLmGm7FjYMSEAmKIVLivJfaGUz/g4V8ZoJD5tBlsQmNJsUt7Zs9
 bvdqhz+7JKf0h0t2ukPj8VaSN3XgA0Zrr/iZ7KIk=
Content-Type: multipart/alternative;
 boundary="------------mzOa0IKJVGwWas0mM00hNw4L"
Message-ID: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
Date: Sun, 30 Apr 2023 13:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
From: Felix Richter <judge@felixrichter.tech>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
X-Mailman-Approved-At: Mon, 01 May 2023 07:20:22 +0000
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

This is a multi-part message in MIME format.
--------------mzOa0IKJVGwWas0mM00hNw4L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am running into an issue with the integrated GPU of the Ryzen 9 7950X. It seems to be a regression from kernel version 6.1 to 6.2.
The bug materializes in from of my monitor blinking, meaning it turns full white shortly. This happens very often so that the system becomes unpleasant to use.

I am running the Archlinux Kernel:
The Issue happens on the bleeding edge kernel: 6.2.13
Switching back to the LTS kernel resolves the issue: 6.1.26

I have two monitors attached to the system. One 42 inch 4k Display and a 24 inch 1080p Display and am running sway as my desktop.

Let me know if there is more information I could provide to help narrow down the issue.

Kind regards,
Felix Richter

--------------mzOa0IKJVGwWas0mM00hNw4L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi,

I am running into an issue with the integrated GPU of the Ryzen 9 7950X. It seems to be a regression from kernel version 6.1 to 6.2. 
The bug materializes in from of my monitor blinking, meaning it turns full white shortly. This happens very often so that the system becomes unpleasant to use.

I am running the Archlinux Kernel:
The Issue happens on the bleeding edge kernel: 6.2.13
Switching back to the LTS kernel resolves the issue: 6.1.26

I have two monitors attached to the system. One 42 inch 4k Display and a 24 inch 1080p Display and am running sway as my desktop.

Let me know if there is more information I could provide to help narrow down the issue.

Kind regards,
Felix Richter
</pre>
  </body>
</html>

--------------mzOa0IKJVGwWas0mM00hNw4L--
