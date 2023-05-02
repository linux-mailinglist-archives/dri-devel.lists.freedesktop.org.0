Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBA96F3BCA
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD0B10E0A1;
	Tue,  2 May 2023 01:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C98510E0A1;
 Tue,  2 May 2023 01:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Noh8dh1b4WPIoxf4HR9EfS1PEP8OXfWwFlkMnrqSJgA=; b=f/3itorim1T01FtfuNs/wyggyn
 thoXJ3Fm8vg3a/VFbFm0O1wkZRM9eCwj9L7wafJBUJw3K4U9DBzoIYlplwmRtpffjXS/zS4jBDt0E
 twbBqUi7W+7gQPzWlrwmd0uyc/cE4Dj0djgc26a1pEH8oj3kTljQ+G9buNhcp5eq8ayJRaZQdf/N8
 iRXecYndjLmn3JsUs5HWekB0mnxx+zhxGhDCtRxYWYqI0vY6lHj2j4y24ITWaZa9DNQVe7uijjU7J
 NqQgcWjWZxSN9hS4L9n9UOEH9gZuPTSMqUqv19IwgK7XLL1RRZ+opuENlS4wdOZwPn3rEJINbkldH
 R1LVHDdA==;
Received: from [179.113.250.147] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ptenS-00HByc-Ab; Tue, 02 May 2023 03:27:14 +0200
Message-ID: <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
Date: Mon, 1 May 2023 22:26:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 01/05/2023 16:24, Alex Deucher escreveu:
> On Mon, May 1, 2023 at 2:58 PM André Almeida <andrealmeid@igalia.com> wrote:
>>
>> I know that devcoredump is also used for this kind of information, but I believe
>> that using an IOCTL is better for interfacing Mesa + Linux rather than parsing
>> a file that its contents are subjected to be changed.
> 
> Can you elaborate a bit on that?  Isn't the whole point of devcoredump
> to store this sort of information?
> 

I think that devcoredump is something that you could use to submit to a 
bug report as it is, and then people can read/parse as they want, not as 
an interface to be read by Mesa... I'm not sure that it's something that 
I would call an API. But I might be wrong, if you know something that 
uses that as an API please share.

Anyway, relying on that for Mesa would mean that we would need to ensure 
stability for the file content and format, making it less flexible to 
modify in the future and probe to bugs, while the IOCTL is well defined 
and extensible. Maybe the dump from Mesa + devcoredump could be 
complementary information to a bug report.
