Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B870C4DA61
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 13:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B08110E023;
	Tue, 11 Nov 2025 12:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FOgq18Vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7BC10E023
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 12:23:10 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4F1C741;
 Tue, 11 Nov 2025 13:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762863670;
 bh=ab9Tx7OdaNNwimnpgR7WLe8oFQGeeCXeqmmfh0669Zk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FOgq18VlmJ5UwZTFBgtQwXt8wPw9ptq2e7EOI/4SOcCpVyQrZ/36udHil0mW7Yr/G
 6CKrFxllwvrm6wGSN1kdtWNJp8j1KZp71x5wIRKDxc9LBytE7YErycu8nnIopx12jg
 fCuE6aDlpBXeQpo1Sma2nV4SFlehSTkR0YAwE/J4=
Message-ID: <c5ab80df-0d60-4984-ad21-7dd1182b990f@ideasonboard.com>
Date: Tue, 11 Nov 2025 14:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "media: vsp1: Add underrun debug print"
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Duy Nguyen <duy.nguyen.rh@renesas.com>
References: <20250910-rcar-vsp-underrun-revert-v1-1-2fa8d3b1b879@ideasonboard.com>
 <176286282930.2141792.17722042639840544380@ping.linuxembedded.co.uk>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <176286282930.2141792.17722042639840544380@ping.linuxembedded.co.uk>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/11/2025 14:07, Kieran Bingham wrote:
> Quoting Tomi Valkeinen (2025-09-10 08:26:43)
>> This reverts commit 1dc30075fb0fe02b74b1ea7fd1c1c734a89f1448.
>>
>> There have been reports of lots of underruns happening on earlier
>> generation SoCs (M3, E3) with display use cases, e.g.:
>>
>> vsp1 fea28000.vsp: Underrun occurred at WPF0 (total underruns 1)
>>
>> but the display still working fine, and reverting the above commit,
>> which added underrun prints, makes the prints go away (obviously).
>>
>> I made some tests on a remote M3, with no display connected, and I can
>> confirm that there seem to be a single underrun report quite often when
>> enabling a display, and an underrun flood when using interlace display
>> modes.
>>
>> E3 does not have interlace display support as far as I can see, so the
>> interlace issue does not concern it.
>>
>> Debugging display issues remotely without a display is quite
>> challenging, and I did not find any issues in the code, nor could I find
>> a way to stop the underruns by twiddling with the related registers.
>>
>> My pure guess is that the single underruns occurring when starting the
>> display hint at either a startup sequence issue, or some kind of initial
>> fifo loading issue. The interlace underruns hint at a bigger
>> misconfiguration, but as the display works fine, the issue might be just
>> an underrun at the start of the frame and the HW quickly catching up, or
>> at the end of the frame, where one block in the pipeline expects more
>> data but the previous block has already stopped (so maybe a misconfig
>> between using interlaced height vs progressive height?).
>>
>> But at the moment I have no solution to this, and as the displays work
>> fine, I think it makes sense to just revert the print.
> 
> Is there any value in instead 'ignoring' any underruns if say the frame
> count is < 5 to ignore startup underruns, and keep it as an active print
> if something causes underruns later once the pipeline is established?
> 
> But maybe that doesn't change much - and if there's no current perceived
> issue
A single underrun at enable time could/should probably be ignored, as it
might be just issue with the initial fifo filling or such (even then
it's a bit annoying, but I've seen some HW docs (not on this platform)
telling to ignore such underruns).

But that wouldn't help with the underrun flood for interlace. I think
there's a clear issue for ilace here, but I have no idea where exactly.
And, the display works fine, so the display controller can recover
instantly.

> Anyway, I don't object to this revert. It's low impact and it's only
> undoing 'your' work so no one else will complain :D

Yep... I hate disabling error reporting, but I think it's the best
option here, at least until someone with the board can debug it
properly. In any case, if there are "real" underruns, the error is also
visible on the display, you don't need the console print to show it.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

 Tomi

>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/vsp1/vsp1_drm.c  |  3 ---
>>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 +----------
>>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h |  2 --
>>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 --
>>  4 files changed, 1 insertion(+), 17 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> index 15d266439564..b8f211db16fc 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> @@ -721,9 +721,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>>                 return 0;
>>         }
>>  
>> -       /* Reset the underrun counter */
>> -       pipe->underrun_count = 0;
>> -
>>         drm_pipe->width = cfg->width;
>>         drm_pipe->height = cfg->height;
>>         pipe->interlaced = cfg->interlaced;
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> index b8d06e88c475..68e92d3c5915 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> @@ -47,8 +47,7 @@
>>  
>>  static irqreturn_t vsp1_irq_handler(int irq, void *data)
>>  {
>> -       u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
>> -                  VI6_WPF_IRQ_STA_UND;
>> +       u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
>>         struct vsp1_device *vsp1 = data;
>>         irqreturn_t ret = IRQ_NONE;
>>         unsigned int i;
>> @@ -63,14 +62,6 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
>>                 status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
>>                 vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
>>  
>> -               if ((status & VI6_WPF_IRQ_STA_UND) && wpf->entity.pipe) {
>> -                       wpf->entity.pipe->underrun_count++;
>> -
>> -                       dev_warn_ratelimited(vsp1->dev,
>> -                               "Underrun occurred at WPF%u (total underruns %u)\n",
>> -                               i, wpf->entity.pipe->underrun_count);
>> -               }
>> -
>>                 if (status & VI6_WPF_IRQ_STA_DFE) {
>>                         vsp1_pipeline_frame_end(wpf->entity.pipe);
>>                         ret = IRQ_HANDLED;
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
>> index 7f623b8cbe5c..9cc2f1646b00 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
>> @@ -137,8 +137,6 @@ struct vsp1_pipeline {
>>  
>>         unsigned int partitions;
>>         struct vsp1_partition *part_table;
>> -
>> -       u32 underrun_count;
>>  };
>>  
>>  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
>> index 10cfbcd1b6e0..188d26289714 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
>> @@ -32,12 +32,10 @@
>>  #define VI6_STATUS_SYS_ACT(n)          BIT((n) + 8)
>>  
>>  #define VI6_WPF_IRQ_ENB(n)             (0x0048 + (n) * 12)
>> -#define VI6_WPF_IRQ_ENB_UNDE           BIT(16)
>>  #define VI6_WPF_IRQ_ENB_DFEE           BIT(1)
>>  #define VI6_WPF_IRQ_ENB_FREE           BIT(0)
>>  
>>  #define VI6_WPF_IRQ_STA(n)             (0x004c + (n) * 12)
>> -#define VI6_WPF_IRQ_STA_UND            BIT(16)
>>  #define VI6_WPF_IRQ_STA_DFE            BIT(1)
>>  #define VI6_WPF_IRQ_STA_FRE            BIT(0)
>>  
>>
>> ---
>> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
>> change-id: 20250908-rcar-vsp-underrun-revert-f3e64612c62d
>>
>> Best regards,
>> -- 
>> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>

