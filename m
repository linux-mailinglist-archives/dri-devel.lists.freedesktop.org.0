Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E74988F22
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 14:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C21410E096;
	Sat, 28 Sep 2024 12:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="g1Wy1cbR";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="b6qMtv/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A238810E096
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 12:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727525754; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=aGWjnXtxMDwUfSaNnNO7VnWjb2oyCEiJXFVHT9aSSG+d+c+67qatCZD59AQEPtuswo
 2crQekeZw3Ogsue9upqXjpI1rXYJYclklGJzmTKN7NPu34v0m2TKx00x4tbMA1O6v+IQ
 5TnfL2Mdg9leY98Q7oPIaqC/CUoB9Aiog+JBsi+XY1Lo7inv8StEgrzo0tWV5GkjQrNf
 hyw6v7lsEiQ2QmoqeyjJt+IW7CX8jmzr6UMlPFFtel7yw9a8+r0TwYMfTyXqL5mIbnwt
 umsPhsxYYSIQsTVBYtZW7VN5gfR3szgj0BH2+VNzlhAhcA174D4s8gkOqi4+qONPZ+El
 Trjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727525754;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=4pDcPQ1hlnXeqnamK1kittvxmuAtTMn/1RxWbFUl+TQ=;
 b=H1d4B3ShzR3AsKP9AfOfvknEs70bTQE17gjQWIHyB/7UKmRUfSrWNo+iEjCD3RN3rg
 kjvbGVyb2JX5VWuKV8jThtedAQ0e6ens4Bgznr9kitL8e/BYxwAV1AFofq8fEbNc8S8F
 fITrqHMayXnfp8p/kDLUSF1sWs8oBrRCHyYo/u6w32Q8kGHKkolKXX4TGTfy8WJIedH1
 CgbnyYnE0IxjwyA5/nHQOEDmhA+edlP+4TStaeQcTsh40y+uLdAwp3xJCA02isAKYIZW
 FmL9Dg8bPwTp1l7zM4Cq+RHbKxOy3oe7Wac7TmMedDvqqfYwpP8RPbfJTxOS9pE7OC9b
 dBPw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727525754;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=4pDcPQ1hlnXeqnamK1kittvxmuAtTMn/1RxWbFUl+TQ=;
 b=g1Wy1cbRHFGBfecY4U5AycWX2WL3AElF9pS7xbUuzVp3wo5uyY+e0Vt3cYSNj8QgsO
 bqSqf2nuBgWvMEahdkpQ19jU4RhXpPIaJWSaJ8+SOXlRm8SXLdB7ChN4lP/723VxLHu2
 KZCJq5XU0OG+q1FjkbqRIjmsxYr/i245Gaiyaoxloo3KdHx4Az6O7mDKkCR3hiG67qfR
 i3KYf1lo9Ia01NkOHoi654jkyQxUl+eoQDVqyZypB74D/pFVhBTkeHWk9sKzmGvb5l2a
 v/qtlpvSGvsNSaJuZfie2xFGw9B3Gp6XDGCEeAAp2vgjGV68ONQ9IUvmU9OawtGtr79G
 4djg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727525754;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=4pDcPQ1hlnXeqnamK1kittvxmuAtTMn/1RxWbFUl+TQ=;
 b=b6qMtv/bUduc5gJqvUm2TUHWvVgtbbAP7Hg8rjvPNF59rlaVrNd59mwYgEcAIGmQ5O
 MWLuI3HA+iplnTnly5Dg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz46lpM="
Received: from [192.168.178.134] by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
 with ESMTPSA id e0da1a08SCFrNox
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 28 Sep 2024 14:15:53 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------VPPMkz5qjIhJpCcvk0hLe1aT"
Message-ID: <035efe6a-632d-4414-b63c-a3cb2c71ae4b@xenosoft.de>
Date: Sat, 28 Sep 2024 14:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FSL P5040 board doesn't boot after DRM updates
 (drm-next-2024-09-19)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
 <20EA4BE5-B349-4406-89EA-3D442717EC03@xenosoft.de>
 <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
 <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
 <d10b0d41-8389-4b09-a531-c9c5d67df3b7@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <d10b0d41-8389-4b09-a531-c9c5d67df3b7@xenosoft.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------VPPMkz5qjIhJpCcvk0hLe1aT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28 September 2024 at 01:46pm, Christian Zigotzky wrote:
> Am 28.09.24 um 10:42 schrieb Christophe Leroy:
>> Hi Christian,
>>
>> Le 28/09/2024 à 09:40, Christian Zigotzky a écrit :
>>> On 28 September 2024 at 09:21am, Christian Zigotzky wrote:
>>>  >
>>>  >> ﻿On Sun, Sep 22, 2024 at 12:28 AM Christian Zigotzky
>>>  >> <chzigotzky@xenosoft.de> wrote:
>>>  >>>
>>>  >>> Hi All,
>>>  >>>
>>>  >>> The lastest Git kernel doesn't boot anymore after the latest 
>>> DRM updates
>>>  >>> (drm-next-2024-09-19). [1]
>>>  >>>
>>>  >>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD
>>>  >>> Radeon HD 5870 (Cypress XT).
>>>  >>>
>>>  >>> I reverted the DRM updates and after that the kernel boots 
>>> without any
>>>  >>> problems.
>>>  >>>
>>>  >>> Please note: Due to a lack of time, I can't do a bisect.
>>>  >>>
>>>  >>> Please check the latest DRM updates.
>>> ------------
>>>  >>
>>>  >> Can you attach your dmesg output?  There was a regression in the 
>>> dma
>>>  >> subsystem what was fixed by this commit:
>>>  >>
>>>  >> commit b348b6d17fd1d5d89b86db602f02be
>>>  >> a54a754bd8
>>>  >> Author: Leon Romanovsky <leon@kernel.org>
>>>  >> Date:   Sun Sep 22 21:09:48 2024 +0300
>>>  >>
>>>  >>    dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>>>  >>
>>>  >> Alex
>>>  >>
>>>
>>> ------------
>>> Hi Alex,
>>>
>>> I tested the latest Git kernel on my FSL P5040 board today and it 
>>> doesn't boot. Our FSL P5020 boards boot without any problems.
>>>
>>> I connected my FSL P5040 board with a serial cable to my PC for 
>>> getting error messages. Unfortunately there aren't any error 
>>> messages after the loading of the uImage.
>>>
>>> This means, that the dma-mapping patch doesn't solve the boot issue.
>>>
>>> Please check the latest DRM updates.
>>
>> Can you bisect the problem ?
>>
>> Christophe
> I would like ... but I don't have time for it. Sorry.

Hi All,

Sorry, I have forgotten to add the boot arguments "console=ttyS0,115200" 
for the connecting of my FSL P5040 board with a serial cable to my PC.

Now, I have a serial log file with Radeon error messages (kernel trace). :-)

Link: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log

I hope, you have an idea. The FSL P5020 boards aren't affected.

Thanks,
Christian
--------------VPPMkz5qjIhJpCcvk0hLe1aT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 28 September 2024 at 01:46pm,
      Christian Zigotzky wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d10b0d41-8389-4b09-a531-c9c5d67df3b7@xenosoft.de">Am
      28.09.24 um 10:42 schrieb Christophe Leroy:
      <br>
      <blockquote type="cite">Hi Christian,
        <br>
        <br>
        Le 28/09/2024 à 09:40, Christian Zigotzky a écrit :
        <br>
        <blockquote type="cite">On 28 September 2024 at 09:21am,
          Christian Zigotzky wrote:
          <br>
           &gt;
          <br>
           &gt;&gt; ﻿On Sun, Sep 22, 2024 at 12:28 AM Christian Zigotzky
          <br>
           &gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:chzigotzky@xenosoft.de">&lt;chzigotzky@xenosoft.de&gt;</a> wrote:
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; Hi All,
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; The lastest Git kernel doesn't boot anymore
          after the latest DRM updates
          <br>
           &gt;&gt;&gt; (drm-next-2024-09-19). [1]
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; I tested it with an AMD Radeon HD 6970 (Cayman
          XT) and with an AMD
          <br>
           &gt;&gt;&gt; Radeon HD 5870 (Cypress XT).
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; I reverted the DRM updates and after that the
          kernel boots without any
          <br>
           &gt;&gt;&gt; problems.
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; Please note: Due to a lack of time, I can't do a
          bisect.
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; Please check the latest DRM updates.
          <br>
          ------------
          <br>
           &gt;&gt;
          <br>
           &gt;&gt; Can you attach your dmesg output?  There was a
          regression in the dma
          <br>
           &gt;&gt; subsystem what was fixed by this commit:
          <br>
           &gt;&gt;
          <br>
           &gt;&gt; commit b348b6d17fd1d5d89b86db602f02be
          <br>
           &gt;&gt; a54a754bd8
          <br>
           &gt;&gt; Author: Leon Romanovsky <a class="moz-txt-link-rfc2396E" href="mailto:leon@kernel.org">&lt;leon@kernel.org&gt;</a>
          <br>
           &gt;&gt; Date:   Sun Sep 22 21:09:48 2024 +0300
          <br>
           &gt;&gt;
          <br>
           &gt;&gt;    dma-mapping: report unlimited DMA addressing in
          IOMMU DMA path
          <br>
           &gt;&gt;
          <br>
           &gt;&gt; Alex
          <br>
           &gt;&gt;
          <br>
          <br>
          ------------
          <br>
          Hi Alex,
          <br>
          <br>
          I tested the latest Git kernel on my FSL P5040 board today and
          it doesn't boot. Our FSL P5020 boards boot without any
          problems.
          <br>
          <br>
          I connected my FSL P5040 board with a serial cable to my PC
          for getting error messages. Unfortunately there aren't any
          error messages after the loading of the uImage.
          <br>
          <br>
          This means, that the dma-mapping patch doesn't solve the boot
          issue.
          <br>
          <br>
          Please check the latest DRM updates.
          <br>
        </blockquote>
        <br>
        Can you bisect the problem ?
        <br>
        <br>
        Christophe
        <br>
      </blockquote>
      I would like ... but I don't have time for it. Sorry.
      <br>
    </blockquote>
    <br>
    Hi All,<br>
    <br>
    Sorry, I have forgotten to add the boot arguments "<span
      class="posthilit">console</span>=ttyS0,115200" for the connecting
    of my FSL P5040 board with a serial cable to my PC.<br>
    <br>
    Now, I have a serial log file with Radeon error messages (kernel
    trace). :-)<br>
    <br>
    Link: <a class="moz-txt-link-freetext" href="https://www.xenosoft.de/PuTTY_P5040_U-Boot.log">https://www.xenosoft.de/PuTTY_P5040_U-Boot.log</a><br>
    <br>
    I hope, you have an idea. The FSL P5020 boards aren't affected.<br>
    <br>
    Thanks,<br>
    Christian<br>
  </body>
</html>

--------------VPPMkz5qjIhJpCcvk0hLe1aT--
