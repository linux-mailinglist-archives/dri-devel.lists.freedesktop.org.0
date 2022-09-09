Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56435B418A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 23:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACE910E002;
	Fri,  9 Sep 2022 21:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id A449010E002
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 21:39:09 +0000 (UTC)
Received: from [10.1.6.4] (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id EBC5F204B511;
 Fri,  9 Sep 2022 14:38:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EBC5F204B511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1662759549;
 bh=HEB77Qr+BgFbrhvgrT5r3B5CMqSgOIIP8EpcVs2hwf4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SZa0rjF1zDP4m+KB/T+yVStYNKYgze+GvKFPj+ynp9Md6FJ6r485Q5mrf/UDbD3BI
 neNIpi5rcgd5k7qkR6H+Ww9L6ZDepSXLzS0NlE9UJExDGOo1+aSyi/7whkhq7cn/qN
 HQFA6TGs5koApHmFvSz4EFbS4U+R+CZKqRnQZ+WU=
Content-Type: multipart/alternative;
 boundary="------------yKFIidYde7KVdW2n8zKFlHGi"
Message-ID: <ec4a788c-aa55-1d29-6e6d-c0cee6898279@linux.microsoft.com>
Date: Fri, 9 Sep 2022 21:38:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] pci_ids: Add the various Microsoft PCI device IDs
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220909193849.GA309868@bhelgaas>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20220909193849.GA309868@bhelgaas>
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
Cc: "open list:DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE"
 <linux-hyperv@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Colin Ian King <colin.i.king@googlemail.com>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Helge Deller <deller@gmx.de>, Dexuan Cui <decui@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Easwar Hariharan <easwar.hariharan@microsoft.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, vkuznets@redhat.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------yKFIidYde7KVdW2n8zKFlHGi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/22 19:38, Bjorn Helgaas wrote:
> Please follow the PCI subject line conventions.  Discover it with
> "git log --oneline include/linux/pci_ids.h".
>
> On Fri, Sep 09, 2022 at 11:50:25AM -0700, Easwar Hariharan wrote:
>> From: Easwar Hariharan<easwar.hariharan@microsoft.com>
>>
> Needs a commit log, even if it is nothing more than the subject line.
>
> Also read the top of include/linux/pci_ids.h, because it looks like
> some of these are only used in one driver and hence do not need to be
> in pci_ids.h.
Thanks, this was a separate patch for exactly that reason instead of being

combined with the patch to move the vendor ID. I sent it anyway because

of other device IDs in the pci_ids.h file used only by a single driver, 
which I

assume are legacy artifacts. After removing the MANA device IDs, the patch

boils down to a trivial rename of the HYPERV_VIDEO device ID, so I'm just

dropping this patch.
- Easwar
>
>> Signed-off-by: Easwar Hariharan<easwar.hariharan@microsoft.com>
>> ---
>>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 2 +-
>>   drivers/net/ethernet/microsoft/mana/gdma.h      | 3 ---
>>   drivers/net/ethernet/microsoft/mana/gdma_main.c | 6 +++---
>>   drivers/video/fbdev/hyperv_fb.c                 | 4 ++--
>>   include/linux/pci_ids.h                         | 4 +++-
>>   5 files changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> index f84d397..24c2def 100644
>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> @@ -51,7 +51,7 @@ static void hyperv_pci_remove(struct pci_dev *pdev)
>>   static const struct pci_device_id hyperv_pci_tbl[] = {
>>   	{
>>   		.vendor = PCI_VENDOR_ID_MICROSOFT,
>> -		.device = PCI_DEVICE_ID_HYPERV_VIDEO,
>> +		.device = PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO,
>>   	},
>>   	{ /* end of list */ }
>>   };
>> diff --git a/drivers/net/ethernet/microsoft/mana/gdma.h b/drivers/net/ethernet/microsoft/mana/gdma.h
>> index 4a6efe6..9d3a9f7 100644
>> --- a/drivers/net/ethernet/microsoft/mana/gdma.h
>> +++ b/drivers/net/ethernet/microsoft/mana/gdma.h
>> @@ -476,9 +476,6 @@ struct gdma_eqe {
>>   
>>   #define GDMA_SRIOV_REG_CFG_BASE_OFF	0x108
>>   
>> -#define MANA_PF_DEVICE_ID 0x00B9
>> -#define MANA_VF_DEVICE_ID 0x00BA
>> -
>>   struct gdma_posted_wqe_info {
>>   	u32 wqe_size_in_bu;
>>   };
>> diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
>> index 00d8198..18cf168 100644
>> --- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
>> +++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
>> @@ -1333,7 +1333,7 @@ static void mana_gd_cleanup(struct pci_dev *pdev)
>>   
>>   static bool mana_is_pf(unsigned short dev_id)
>>   {
>> -	return dev_id == MANA_PF_DEVICE_ID;
>> +	return dev_id == PCI_DEVICE_ID_MICROSOFT_MANA_PF;
>>   }
>>   
>>   static int mana_gd_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>> @@ -1466,8 +1466,8 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
>>   }
>>   
>>   static const struct pci_device_id mana_id_table[] = {
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_MICROSOFT_MANA_PF) },
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_MICROSOFT_MANA_VF) },
>>   	{ }
>>   };
>>   
>> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
>> index b58b445..118e244 100644
>> --- a/drivers/video/fbdev/hyperv_fb.c
>> +++ b/drivers/video/fbdev/hyperv_fb.c
>> @@ -997,7 +997,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>>   
>>   	if (!gen2vm) {
>>   		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
>> -			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
>> +			PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO, NULL);
>>   		if (!pdev) {
>>   			pr_err("Unable to find PCI Hyper-V video\n");
>>   			return -ENODEV;
>> @@ -1311,7 +1311,7 @@ static int hvfb_resume(struct hv_device *hdev)
>>   static const struct pci_device_id pci_stub_id_table[] = {
>>   	{
>>   		.vendor      = PCI_VENDOR_ID_MICROSOFT,
>> -		.device      = PCI_DEVICE_ID_HYPERV_VIDEO,
>> +		.device      = PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO,
>>   	},
>>   	{ /* end of list */ }
>>   };
>> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
>> index 15b49e6..fe3517f 100644
>> --- a/include/linux/pci_ids.h
>> +++ b/include/linux/pci_ids.h
>> @@ -2080,7 +2080,9 @@
>>   #define PCI_DEVICE_ID_VT1724		0x1724
>>   
>>   #define PCI_VENDOR_ID_MICROSOFT		0x1414
>> -#define PCI_DEVICE_ID_HYPERV_VIDEO	0x5353
>> +#define PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO	0x5353
>> +#define PCI_DEVICE_ID_MICROSOFT_MANA_PF  	0x00B9
>> +#define PCI_DEVICE_ID_MICROSOFT_MANA_VF  	0x00BA
>>   
>>   #define PCI_VENDOR_ID_OXSEMI		0x1415
>>   #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
>> -- 
>> 1.8.3.1
>>

--------------yKFIidYde7KVdW2n8zKFlHGi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/9/22 19:38, Bjorn Helgaas wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220909193849.GA309868@bhelgaas">
      <pre class="moz-quote-pre" wrap="">Please follow the PCI subject line conventions.  Discover it with
"git log --oneline include/linux/pci_ids.h".

On Fri, Sep 09, 2022 at 11:50:25AM -0700, Easwar Hariharan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Easwar Hariharan <a class="moz-txt-link-rfc2396E" href="mailto:easwar.hariharan@microsoft.com">&lt;easwar.hariharan@microsoft.com&gt;</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Needs a commit log, even if it is nothing more than the subject line.

Also read the top of include/linux/pci_ids.h, because it looks like
some of these are only used in one driver and hence do not need to be
in pci_ids.h.</pre>
    </blockquote>
    Thanks, this was a separate patch for exactly that reason instead of
    being<br>
    <br>
    combined with the patch to move the vendor ID. I sent it anyway
    because<br>
    <br>
    of other device IDs in the pci_ids.h file used only by a single
    driver, which I<br>
    <br>
    assume are legacy artifacts. After removing the MANA device IDs, the
    patch<br>
    <br>
    boils down to a trivial rename of the HYPERV_VIDEO device ID, so I'm
    just<br>
    <br>
    dropping this patch.<br>
    - Easwar<br>
    <font size="2"></font>
    <blockquote type="cite" cite="mid:20220909193849.GA309868@bhelgaas">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Easwar Hariharan <a class="moz-txt-link-rfc2396E" href="mailto:easwar.hariharan@microsoft.com">&lt;easwar.hariharan@microsoft.com&gt;</a>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 2 +-
 drivers/net/ethernet/microsoft/mana/gdma.h      | 3 ---
 drivers/net/ethernet/microsoft/mana/gdma_main.c | 6 +++---
 drivers/video/fbdev/hyperv_fb.c                 | 4 ++--
 include/linux/pci_ids.h                         | 4 +++-
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index f84d397..24c2def 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -51,7 +51,7 @@ static void hyperv_pci_remove(struct pci_dev *pdev)
 static const struct pci_device_id hyperv_pci_tbl[] = {
 	{
 		.vendor = PCI_VENDOR_ID_MICROSOFT,
-		.device = PCI_DEVICE_ID_HYPERV_VIDEO,
+		.device = PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO,
 	},
 	{ /* end of list */ }
 };
diff --git a/drivers/net/ethernet/microsoft/mana/gdma.h b/drivers/net/ethernet/microsoft/mana/gdma.h
index 4a6efe6..9d3a9f7 100644
--- a/drivers/net/ethernet/microsoft/mana/gdma.h
+++ b/drivers/net/ethernet/microsoft/mana/gdma.h
@@ -476,9 +476,6 @@ struct gdma_eqe {
 
 #define GDMA_SRIOV_REG_CFG_BASE_OFF	0x108
 
-#define MANA_PF_DEVICE_ID 0x00B9
-#define MANA_VF_DEVICE_ID 0x00BA
-
 struct gdma_posted_wqe_info {
 	u32 wqe_size_in_bu;
 };
diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
index 00d8198..18cf168 100644
--- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
+++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
@@ -1333,7 +1333,7 @@ static void mana_gd_cleanup(struct pci_dev *pdev)
 
 static bool mana_is_pf(unsigned short dev_id)
 {
-	return dev_id == MANA_PF_DEVICE_ID;
+	return dev_id == PCI_DEVICE_ID_MICROSOFT_MANA_PF;
 }
 
 static int mana_gd_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
@@ -1466,8 +1466,8 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id mana_id_table[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_MICROSOFT_MANA_PF) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_MICROSOFT_MANA_VF) },
 	{ }
 };
 
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index b58b445..118e244 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -997,7 +997,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 
 	if (!gen2vm) {
 		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
-			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
+			PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO, NULL);
 		if (!pdev) {
 			pr_err("Unable to find PCI Hyper-V video\n");
 			return -ENODEV;
@@ -1311,7 +1311,7 @@ static int hvfb_resume(struct hv_device *hdev)
 static const struct pci_device_id pci_stub_id_table[] = {
 	{
 		.vendor      = PCI_VENDOR_ID_MICROSOFT,
-		.device      = PCI_DEVICE_ID_HYPERV_VIDEO,
+		.device      = PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO,
 	},
 	{ /* end of list */ }
 };
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 15b49e6..fe3517f 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2080,7 +2080,9 @@
 #define PCI_DEVICE_ID_VT1724		0x1724
 
 #define PCI_VENDOR_ID_MICROSOFT		0x1414
-#define PCI_DEVICE_ID_HYPERV_VIDEO	0x5353
+#define PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO	0x5353
+#define PCI_DEVICE_ID_MICROSOFT_MANA_PF  	0x00B9
+#define PCI_DEVICE_ID_MICROSOFT_MANA_VF  	0x00BA
 
 #define PCI_VENDOR_ID_OXSEMI		0x1415
 #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
-- 
1.8.3.1

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------yKFIidYde7KVdW2n8zKFlHGi--
