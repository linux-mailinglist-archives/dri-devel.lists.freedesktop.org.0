Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8C361DDA2
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 20:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A6910E165;
	Sat,  5 Nov 2022 19:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089B910E031;
 Sat,  5 Nov 2022 03:05:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A52oXqG028084; Sat, 5 Nov 2022 03:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=qcppdkim1; bh=kB07xqFIl1onVGgZCRxF39T7aPA0y4AAOvZoHAhSXSo=;
 b=krHS9wyuBWA6ECuqkElewc7tqRH0FfM24jpyMzaYc/C3z313RzEHtOkGXmNP/iQTP2El
 34PViSDiXJKBlt0SuK85jLv7YseBzSXX2/CDshbr1dbvC3WyeryZXgkOQB7AVAm5C2kS
 Yj+1WVTCdSPre0zjbe8HtLqn+QQYoT/aTqP8GQzqJD0S/uHGF3E4nCp3QjEjx9uT0ruD
 MQP9u6sSP3UtSi/F4rZZuoCO7rlD4zhkplHj/tUGi0bZRSS4ip9vNjgIZfX3xGbVmaIk
 nrEGkmjluwjFXZza/QJjO331/vSNu+zxQrKBeE/rddB05FLoikreCjmZpa9RiPzB+UAB Mw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kn6a4133n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Nov 2022 03:05:18 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A535HZn024075
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 5 Nov 2022 03:05:17 GMT
Received: from [10.110.46.169] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 4 Nov 2022
 20:05:16 -0700
Content-Type: multipart/mixed; boundary="------------hECn0Gqn7zl1YaMJg36Sy4Qd"
Message-ID: <d05d2567-5559-7a3d-e6a6-b6fb3db4c460@quicinc.com>
Date: Fri, 4 Nov 2022 20:05:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A2KcQq62SWVp1j4aMKJBUXXTLVC3mjx2
X-Proofpoint-ORIG-GUID: A2KcQq62SWVp1j4aMKJBUXXTLVC3mjx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_12,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211050021
X-Mailman-Approved-At: Sat, 05 Nov 2022 19:11:56 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------hECn0Gqn7zl1YaMJg36Sy4Qd
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> The rest of the code expects that master's device drvdata is the
> struct msm_drm_private instance. Do not override the mdp5's drvdata.
> 
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hey Dmitry,

Just wanted to report that it looks like MSM CI is failing on APQ8016 
due to this patch [1]. I was able to reproduce this issue locally by 
cherry-picking this patch on top of msm-next.

The device throws several clock warnings then goes into a boot loop. The 
full boot log and config file are attached.

Can you confirm if you also see this issue on DB410c?

Thanks,

Jessica Zhang

[1] https://gitlab.freedesktop.org/drm/msm/-/jobs/31083929

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index c668a4b27cc6..daf5b5ca7233 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
>   							  slave_encoder);
>   }
>   
> -static void mdp5_destroy(struct platform_device *pdev);
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>   
>   static void mdp5_kms_destroy(struct msm_kms *kms)
>   {
> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>   	}
>   
>   	mdp_kms_destroy(&mdp5_kms->base);
> -	mdp5_destroy(mdp5_kms->pdev);
> +	mdp5_destroy(mdp5_kms);
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> @@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>   	return ret;
>   }
>   
> -static void mdp5_destroy(struct platform_device *pdev)
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>   {
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>   	int i;
>   
>   	if (mdp5_kms->ctlm)
> @@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device *pdev)
>   		kfree(mdp5_kms->intfs[i]);
>   
>   	if (mdp5_kms->rpm_enabled)
> -		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_disable(&mdp5_kms->pdev->dev);
>   
>   	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>   	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
> @@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   		goto fail;
>   	}
>   
> -	platform_set_drvdata(pdev, mdp5_kms);
> -
>   	spin_lock_init(&mdp5_kms->resource_lock);
>   
>   	mdp5_kms->dev = dev;
> @@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	return 0;
>   fail:
>   	if (mdp5_kms)
> -		mdp5_destroy(pdev);
> +		mdp5_destroy(mdp5_kms);
>   	return ret;
>   }
>   
> @@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
>   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   
>   	DBG("");
>   
> @@ -985,7 +983,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   
>   	DBG("");
>   
> -- 
> 2.35.1
> 
--------------hECn0Gqn7zl1YaMJg36Sy4Qd
Content-Type: text/plain; charset="windows-1252";
	name="db410c_msm_next+drvdata"
Content-Disposition: attachment; filename="db410c_msm_next+drvdata"
Content-Transfer-Encoding: 8bit

[2124700] [2124700] fastboot: reboot
[2124700] [2124700] rebooting the device

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.BF.3.0-00288
S - IMAGE_VARIANT_STRING=HAAAANAZA
S - OEM_IMAGE_VERSION_STRING=CRM
S - Boot Config, 0x000002e1
S - Core 0 Frequency, 0 MHz
B -      1545 - PBL, Start
B -      3490 - bootable_media_detect_entry, Start
B -    287355 - bootable_media_detect_success, Start
B -    287360 - elf_loader_entry, Start
B -    288875 - auth_hash_seg_entry, Start
B -    289085 - auth_hash_seg_exit, Start
B -    304982 - elf_segs_hash_verify_entry, Start
B -    365543 - PBL, End
B -    372222 - SBL1, Start
B -    434930 - pm_device_init, Start
D -     14731 - pm_device_init, Delta
B -    450058 - boot_flash_init, Start
D -        30 - boot_flash_init, Delta
B -    454053 - boot_config_data_table_init, Start
D -     31567 - boot_config_data_table_init, Delta - (452 Bytes)
B -    490196 - CDT version:3,Platform ID:24,Major ID:1,Minor ID:0,Subtype:0
B -    496448 - sbl1_ddr_set_params, Start
B -    500230 - cpr_init, Start
D -         0 - cpr_init, Delta
B -    505842 - Pre_DDR_clock_init, Start
D -       183 - Pre_DDR_clock_init, Delta
D -         0 - sbl1_ddr_set_params, Delta
B -    518439 - pm_driver_init, Start
D -      3477 - pm_driver_init, Delta
B -    530547 - SBC platform detected: XO_ADJ_FINE = 0x20
B -    530578 - clock_init, Start
D -        30 - clock_init, Delta
B -    545492 - Image Load, Start
D -     23912 - QSEE Image Loaded, Delta - (571664 Bytes)
B -    569435 - Image Load, Start
D -       213 - SEC Image Loaded, Delta - (2048 Bytes)
B -    576663 - sbl1_efs_handle_cookies, Start
D -       305 - sbl1_efs_handle_cookies, Delta
B -    584410 - Image Load, Start
D -     12078 - QHEE Image Loaded, Delta - (56048 Bytes)
B -    596519 - Image Load, Start
D -     13389 - RPM Image Loaded, Delta - (149316 Bytes)
B -    609939 - Image Load, Start
D -     13572 - APPSBL Image Loaded, Delta - (519728 Bytes)
B -    623542 - QSEE Execution, Start
D -        91 - QSEE Execution, Delta
B -    629245 - SBL1, End
D -    259372 - SBL1, Delta
S - Flash Throughput, 122000 KB/s  (1299256 Bytes,  10644 us)
S - DDR Frequency, 400 MHz
Android Bootloader - UART_DM Initialized!!!
[0] [0] BUILD_VERSION=
[0] [0] BUILD_DATE=15:18:29 - Dec  5 2021
[0] [0] welcome to lk

[10] [10] platform_init()
[10] [10] target_init()
[40] [40] SDHC Running in HS200 mode
[70] [70] Done initialization of the card
[70] [70] pm8x41_get_is_cold_boot: cold boot
[570] [570] Neither 'config' nor 'frp' partition found
[580] [580] Not able to search the panel:
[580] [580] Display not enabled for 24 HW type
[590] [590] Target panel init not found!
[590] [590] pm8x41_get_is_cold_boot: cold boot
[590] [590] partition misc doesn't exist
[600] [600] error in emmc_recovery_init
[600] [600] Unable to locate /bootselect partition
[610] [610] No 'misc' partition found
[610] [610] Error reading MISC partition
[610] [610] failed to get ffbm cookie[620] [620] Loading boot image (40099840): start
[1010] [1010] Loading boot image (40099840): done
[1010] [1010] use_signed_kernel=0, is_unlocked=0, is_tampered=0.
[2130] [2130] qcom,msm-id entry not found
[2130] [2130] Only one appended non-skales DTB, select it.
[2140] [2140] target_display_panel_node:510: hw_id=24 panel_name=""
[2140] [2140] cmdline: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[2160] [2160] Updating device tree: start
[2250] [2250] Setting WLAN mac address in DT: 02:00:5D:40:03:75
[2270] [2270] Setting Bluetooth BD address in DT: 02:00:5D:40:03:74
[2270] [2270] Setting BT mac address in DT: 02:00:5D:40:03:74
[2280] [2280] Updating device tree: done
[2280] [2280] booting linux @ 0x80080000, ramdisk @ 0x91474800 (19699646), tags/device tree @ 0x85e00000
[2290] [2290] Jumping to kernel via monitor
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 6.1.0-rc2-13606-g8bd1db35ef72-dirty (jesszhan@jesszhan-linux) (aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30) #14 SMP PREEMPT Fri Nov  4 19:49:32 PDT 2022
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b0000 (options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfccda00-0xbfccffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
[    0.000000]   node   0: [mem 0x0000000086000000-0x0000000089efffff]
[    0.000000]   node   0: [mem 0x0000000089f00000-0x000000008e9fffff]
[    0.000000]   node   0: [mem 0x000000008ea00000-0x000000008eafffff]
[    0.000000]   node   0: [mem 0x000000008eb00000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] cma: Reserved 32 MiB at 0x00000000bcc00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: failed to set PC mode: -3
[    0.000000] percpu: Embedded 20 pages/cpu s44840 r8192 d28888 u81920
[    0.000000] pcpu-alloc: s44840 r8192 d28888 u81920 alloc=20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM errata 826319, 827319, 824069, or 819472
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[    0.000000] Unknown kernel command line parameters "copy_modules", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 856604K/1048576K available (16192K kernel code, 3704K rwdata, 24600K rodata, 7552K init, 615K bss, 159204K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.011097] Console: colour dummy device 80x25
[    0.018756] printk: console [tty0] enabled
[    0.023261] printk: bootconsole [msm_serial_dm0] disabled
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 6.1.0-rc2-13606-g8bd1db35ef72-dirty (jesszhan@jesszhan-linux) (aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30) #14 SMP PREEMPT Fri Nov  4 19:49:32 PDT 2022
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b0000 (options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfccda00-0xbfccffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
[    0.000000]   node   0: [mem 0x0000000086000000-0x0000000089efffff]
[    0.000000]   node   0: [mem 0x0000000089f00000-0x000000008e9fffff]
[    0.000000]   node   0: [mem 0x000000008ea00000-0x000000008eafffff]
[    0.000000]   node   0: [mem 0x000000008eb00000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] cma: Reserved 32 MiB at 0x00000000bcc00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: failed to set PC mode: -3
[    0.000000] percpu: Embedded 20 pages/cpu s44840 r8192 d28888 u81920
[    0.000000] pcpu-alloc: s44840 r8192 d28888 u81920 alloc=20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM errata 826319, 827319, 824069, or 819472
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[    0.000000] Unknown kernel command line parameters "copy_modules", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 856604K/1048576K available (16192K kernel code, 3704K rwdata, 24600K rodata, 7552K init, 615K bss, 159204K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.011097] Console: colour dummy device 80x25
[    0.018756] printk: console [tty0] enabled
[    0.023261] printk: bootconsole [msm_serial_dm0] disabled
[    0.027434] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=76800)
[    0.027466] pid_max: default: 32768 minimum: 301
[    0.027566] LSM: Security Framework initializing
[    0.027698] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.027731] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.029678] cblist_init_generic: Setting adjustable number of callback queues.
[    0.029711] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.029817] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.030065] rcu: Hierarchical SRCU implementation.
[    0.030083] rcu: 	Max phase no-delay instances is 1000.
[    0.037450] EFI services will not be available.
[    0.037785] smp: Bringing up secondary CPUs ...
[    0.038547] Detected VIPT I-cache on CPU1
[    0.038686] CPU1: Booted secondary processor 0x0000000001 [0x410fd030]
[    0.039495] Detected VIPT I-cache on CPU2
[    0.039617] CPU2: Booted secondary processor 0x0000000002 [0x410fd030]
[    0.040382] Detected VIPT I-cache on CPU3
[    0.040503] CPU3: Booted secondary processor 0x0000000003 [0x410fd030]
[    0.040590] smp: Brought up 1 node, 4 CPUs
[    0.040672] SMP: Total of 4 processors activated.
[    0.040690] CPU features: detected: 32-bit EL0 Support
[    0.040705] CPU features: detected: 32-bit EL1 Support
[    0.040722] CPU features: detected: CRC32 instructions
[    0.040817] CPU: All CPU(s) started at EL1
[    0.040856] alternatives: applying system-wide alternatives
[    0.042851] devtmpfs: initialized
[    0.056655] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.056714] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.057986] pinctrl core: initialized pinctrl subsystem
[    0.062457] DMI not present or invalid.
[    0.063466] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.064929] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.065282] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.065457] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.065541] audit: initializing netlink subsys (disabled)
[    0.065782] audit: type=2000 audit(0.052:1): state=initialized audit_enabled=0 res=1
[    0.068071] thermal_sys: Registered thermal governor 'step_wise'
[    0.068080] thermal_sys: Registered thermal governor 'power_allocator'
[    0.068175] cpuidle: using governor menu
[    0.068522] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.068656] ASID allocator initialised with 32768 entries
[    0.071848] Serial: AMBA PL011 UART driver
[    0.091584] amba 821000.funnel: Fixing up cyclic dependency with 802000.stm
[    0.091866] amba 824000.replicator: Fixing up cyclic dependency with 820000.tpiu
[    0.092184] amba 825000.etf: Fixing up cyclic dependency with 824000.replicator
[    0.092277] amba 825000.etf: Fixing up cyclic dependency with 821000.funnel
[    0.092529] amba 826000.etr: Fixing up cyclic dependency with 824000.replicator
[    0.092793] amba 841000.funnel: Fixing up cyclic dependency with 821000.funnel
[    0.093796] amba 85c000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094040] amba 85d000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094279] amba 85e000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094530] amba 85f000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.097874] platform 1800000.clock-controller: Fixing up cyclic dependency with dsi-phy@1a98300 (1a00000.mdss)
[    0.117185] KASLR enabled
[    0.130216] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.130253] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.130274] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
[    0.130292] HugeTLB: 508 KiB vmemmap can be freed for a 32.0 MiB page
[    0.130312] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.130330] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.130350] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
[    0.130367] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.132600] ACPI: Interpreter disabled.
[    0.137038] iommu: Default domain type: Translated 
[    0.137068] iommu: DMA domain TLB invalidation policy: strict mode 
[    0.137398] SCSI subsystem initialized
[    0.137585] libata version 3.00 loaded.
[    0.138007] usbcore: registered new interface driver usbfs
[    0.138075] usbcore: registered new interface driver hub
[    0.138134] usbcore: registered new device driver usb
[    0.139721] pps_core: LinuxPPS API ver. 1 registered
[    0.139742] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.139778] PTP clock support registered
[    0.139963] EDAC MC: Ver: 3.0.0
[    0.140436] CPUidle PSCI: Initialized CPU PM domain topology
[    0.142801] FPGA manager framework
[    0.142994] Advanced Linux Sound Architecture Driver Initialized.
[    0.144067] vgaarb: loaded
[    0.144540] clocksource: Switched to clocksource arch_sys_counter
[    0.144809] VFS: Disk quotas dquot_6.6.0
[    0.144885] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.145120] pnp: PnP ACPI: disabled
[    0.153882] NET: Registered PF_INET protocol family
[    0.154113] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.155559] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
[    0.155662] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.155703] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.155809] TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.156124] TCP: Hash tables configured (established 8192 bind 8192)
[    0.156264] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.156320] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.156515] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.157016] RPC: Registered named UNIX socket transport module.
[    0.157039] RPC: Registered udp transport module.
[    0.157055] RPC: Registered tcp transport module.
[    0.157069] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.157092] PCI: CLS 0 bytes, default 64
[    0.157388] Unpacking initramfs...
[    0.169303] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters available
[    0.170019] kvm [1]: HYP mode not available
[    0.171298] Initialise system trusted keyrings
[    0.171601] workingset: timestamp_bits=42 max_order=18 bucket_order=0
[    0.180930] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.181808] NFS: Registering the id_resolver key type
[    0.181909] Key type id_resolver registered
[    0.181929] Key type id_legacy registered
[    0.182047] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.182072] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.182352] 9p: Installing v9fs 9p2000 file system support
[    0.237268] Key type asymmetric registered
[    0.237312] Asymmetric key parser 'x509' registered
[    0.237432] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.237461] io scheduler mq-deadline registered
[    0.237478] io scheduler kyber registered
[    0.259200] EINJ: ACPI disabled.
[    0.296961] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.301581] SuperH (H)SCI(F) driver initialized
[    0.302615] msm_serial: driver initialized
[    0.313676] loop: module loaded
[    0.315369] megasas: 07.719.03.00-rc1
[    0.321585] spmi spmi-0: PMIC arbiter version v2 (0x20010000)
[    0.331151] gpio gpiochip1: (200f000.spmi:pmic@0:mpps@a000): not an immutable chip, please consider fixing it!
[    0.339877] tun: Universal TUN/TAP device driver, 1.6
[    0.341732] thunder_xcv, ver 1.0
[    0.341809] thunder_bgx, ver 1.0
[    0.341879] nicpf, ver 1.0
[    0.344184] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    0.344214] hns3: Copyright (c) 2017 Huawei Corporation.
[    0.344307] hclge is initializing
[    0.344344] e1000: Intel(R) PRO/1000 Network Driver
[    0.344361] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.344425] e1000e: Intel(R) PRO/1000 Network Driver
[    0.344441] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.344502] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.344520] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.344620] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    0.344639] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.345291] sky2: driver version 1.30
[    0.347458] VFIO - User Level meta-driver version: 0.3
[    0.353468] usbcore: registered new interface driver usb-storage
[    0.374007] usb3503 usb2513: switched to HUB mode
[    0.374050] usb3503 usb2513: usb3503_probe: probed in hub mode
[    0.374926] usbcore: registered new device driver onboard-usb-hub
[    0.380088] i2c_dev: i2c /dev entries driver
[    0.394831] sdhci: Secure Digital Host Controller Interface driver
[    0.394869] sdhci: Copyright(c) Pierre Ossman
[    0.396427] Synopsys Designware Multimedia Card Interface Driver
[    0.398474] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.403966] ledtrig-cpu: registered to indicate activity on CPUs
[    0.407988] usbcore: registered new interface driver usbhid
[    0.408026] usbhid: USB HID core driver
[    0.423450] NET: Registered PF_PACKET protocol family
[    0.423664] 9pnet: Installing 9P2000 support
[    0.423766] Key type dns_resolver registered
[    0.424733] registered taskstats version 1
[    0.424791] Loading compiled-in X.509 certificates
[    0.458666] s3: Bringing 0uV into 375000-375000uV
[    0.459098] s4: Bringing 0uV into 1800000-1800000uV
[    0.459667] l1: Bringing 0uV into 375000-375000uV
[    0.459936] l2: Bringing 0uV into 1200000-1200000uV
[    0.460196] l4: Bringing 0uV into 1750000-1750000uV
[    0.460485] l5: Bringing 0uV into 1750000-1750000uV
[    0.460816] l6: Bringing 0uV into 1800000-1800000uV
[    0.461088] l7: Bringing 0uV into 1750000-1750000uV
[    0.461362] l8: Bringing 0uV into 1750000-1750000uV
[    0.461651] l9: Bringing 0uV into 1750000-1750000uV
[    0.461938] l10: Bringing 0uV into 1750000-1750000uV
[    0.462236] l11: Bringing 0uV into 1750000-1750000uV
[    0.462511] l12: Bringing 0uV into 1750000-1750000uV
[    0.462791] l13: Bringing 0uV into 1750000-1750000uV
[    0.463095] l14: Bringing 0uV into 1750000-1750000uV
[    0.463445] l15: Bringing 0uV into 1750000-1750000uV
[    0.467830] qcom_scm: convention: smc arm 32
[    0.472140] l16: Bringing 0uV into 1750000-1750000uV
[    0.472609] l17: Bringing 0uV into 3300000-3300000uV
[    0.473056] l18: Bringing 0uV into 1750000-1750000uV
[    0.479021] msm_serial 78af000.serial: msm_serial: detected port #1
[    0.479094] msm_serial 78af000.serial: uartclk = 19200000
[    0.479232] 78af000.serial: ttyMSM1 at MMIO 0x78af000 (irq = 25, base_baud = 1200000) is a MSM
[    0.481511] msm_serial 78b0000.serial: msm_serial: detected port #0
[    0.481572] msm_serial 78b0000.serial: uartclk = 7372800
[    0.481703] 78b0000.serial: ttyMSM0 at MMIO 0x78b0000 (irq = 26, base_baud = 460800) is a MSM
[    0.481749] msm_serial: console setup on port #0
[    1.599619] Freeing initrd memory: 19232K
[    1.601663] printk: console [ttyMSM0] enabled
[    1.912001] qcom-iommu 1ef0000.iommu: iommu sec: pgtable size: 94208
[    1.927132] spi_qup 78b7000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
[    1.930272] spi_qup 78b9000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
[    1.987289] i2c_qup 78b6000.i2c: using default clock-frequency 100000
[    1.987352] i2c_qup 78b6000.i2c: 
[    1.987352]  tx channel not available
[    1.995671] i2c_qup 78b8000.i2c: using default clock-frequency 100000
[    1.999542] i2c_qup 78b8000.i2c: 
[    1.999542]  tx channel not available
[    2.007020] i2c 3-0039: Fixing up cyclic dependency with hdmi-out
[    2.015712] i2c_qup 78ba000.i2c: using default clock-frequency 100000
[    2.019149] i2c_qup 78ba000.i2c: 
[    2.019149]  tx channel not available
[    2.042388] sdhci_msm 7864900.mmc: Got CD GPIO
[    2.076157] mmc0: SDHCI controller on 7824900.mmc [7824900.mmc] using ADMA 64-bit
[    2.078282] mmc1: SDHCI controller on 7864900.mmc [7864900.mmc] using ADMA 64-bit
[    2.093501] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.124692] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.154138] mmc0: Card appears overclocked; req 177770000 Hz, actual 177777777 Hz
[    2.154208] mmc0: Card appears overclocked; req 177770000 Hz, actual 177777777 Hz
[    2.160688] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.166855] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    2.176235] ALSA device list:
[    2.180496] mmc0: new HS200 MMC card at address 0001
[    2.182087]   No soundcards found.
û[    2.197977] Freeing unused kernel memory: 7552K
[    2.198357]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
[    2.203503] mmcblk0boot0: mmc0:0001 S10008 4.00 MiB 
[    2.207588] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.209287] mmcblk0boot1: mmc0:0001 S10008 4.00 MiB 
[    2.216732] Run /init as init process
[    2.221100] mmcblk0rpmb: mmc0:0001 S10008 4.00 MiB, chardev (234:0)
[    2.225041]   with arguments:
[    2.234734]     /init
[    2.237790]     copy_modules
[    2.240033]     androidboot.emmc=true
[    2.243000]     androidboot.serialno=5d400375
[    2.246558]     androidboot.baseband=apq
[    2.250896]     mdss_mdp.panel=0:dsi:0:
[    2.254890]   with environment:
[    2.257049] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.258437]     HOME=/
[    2.268883]     TERM=linux
Starting version 250.4-1-gc3aead5+
[    2.887302] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.928820] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.962827] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.981525] adreno 1c00000.gpu: Adding to iommu group 0
[    2.985599] platform 1a98000.dsi: Fixing up cyclic dependency with 3-0039
[    2.985730] platform 1a98000.dsi: Fixing up cyclic dependency with 1a01000.mdp
[    2.993218] mc: Linux media interface: v0.10
[    3.004893] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.006067] videodev: Linux video capture interface: v2.00
[    3.025789] qcom-venus 1d00000.video-codec: Adding to iommu group 1
[    3.039810] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.042561] msm_mdp 1a01000.mdp: Adding to iommu group 2
[    3.052925] msm_mdp 1a01000.mdp: No interconnect support may cause display underflows!
[    3.061130] qcom-camss 1b0ac00.camss: Adding to iommu group 3
[    3.094286] rtc-pm8xxx 200f000.spmi:pmic@0:rtc@6000: registered as rtc0
[    3.094392] rtc-pm8xxx 200f000.spmi:pmic@0:rtc@6000: setting system clock to 1970-01-01T00:59:51 UTC (3591)
[    3.106275] qcom-camss 1b0ac00.camss: Failed to configure power domains: -17
[    3.109756] qcom-camss: probe of 1b0ac00.camss failed with error -17
[    3.117190] input: pm8941_pwrkey as /devices/platform/soc@0/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:pwrkey/input/input1
[    3.128295] NET: Registered PF_QIPCRTR protocol family
[    3.138677] input: pm8941_resin as /devices/platform/soc@0/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:resin/input/input2
[    3.139191] remoteproc remoteproc0: 4080000.remoteproc is available
[    3.142593] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.166737] spmi-temp-alarm 200f000.spmi:pmic@0:temp-alarm@2400: failed to register sensor
[    3.171413] apq8016-lpass-cpu 7708000.audio-controller: qcom,lpass-cpu-apq8016 compatible is deprecated
[    3.199710] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.210208]  cs_system_cfg: CoreSight Configuration manager initialised
[    3.216758] coresight stm0: STM32 initialized
[    3.225167] adv7511 3-0039: supply dvdd not found, using dummy regulator
[    3.225377] adv7511 3-0039: supply pvdd not found, using dummy regulator
[    3.231157] adv7511 3-0039: supply a2vdd not found, using dummy regulator
[    3.231371] coresight cti_sys0: CTI initialized
[    3.244702] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.256056] coresight cti_sys1: CTI initialized
[    3.264112] coresight cti_cpu0: CTI initialized
[    3.270804] msm_mdp 1a01000.mdp: bound 1a98000.dsi (ops dsi_ops [msm])
[    3.270978] coresight cti_cpu1: CTI initialized
[    3.272381] coresight cti_cpu2: CTI initialized
[    3.282970] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.283579] adreno 1c00000.gpu: supply vdd not found, using dummy regulator
[    3.285095] coresight cti_cpu3: CTI initialized
[    3.300022] adreno 1c00000.gpu: supply vddcx not found, using dummy regulator
[    3.304972] msm_mdp 1a01000.mdp: bound 1c00000.gpu (ops a3xx_ops [msm])
[    3.312003] ------------[ cut here ]------------
[    3.317782] gcc_mdss_ahb_clk status stuck at 'off'
[    3.317825] WARNING: CPU: 0 PID: 259 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    3.327250] Modules linked in: coresight_tmc coresight_replicator coresight_funnel coresight_tpiu adv7511(+) cec coresight_stm coresight_cti stm_core coresight snd_soc_lpass_apq8016 snd_soc_apq8016_sbc snd_soc_qcom_common snd_soc_lpass_cpu snd_soc_msm8916_digital snd_soc_lpass_platform soundwire_bus qrtr snd_soc_msm8916_analog qcom_spmi_vadc qcom_spmi_temp_alarm qcom_pon qcom_vadc_common rtc_pm8xxx qcom_q6v5_mss qcom_pil_info qcom_camss qcom_q6v5 qcom_sysmon videobuf2_dma_sg qcom_common qnoc_msm8916 qcom_glink_smem qmi_helpers v4l2_fwnode v4l2_async venus_core(+) v4l2_mem2mem videobuf2_memops videobuf2_v4l2 videobuf2_common videodev qcom_stats qcom_rng mc msm i2c_qcom_cci mdt_loader llcc_qcom ocmem gpu_sched drm_dp_aux_bus drm_display_helper icc_smd_rpm rpmsg_ctrl rpmsg_char display_connector drm_kms_helper rmtfs_mem drm socinfo
[    3.328429] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.387812] CPU: 0 PID: 259 Comm: udevd Not tainted 6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    3.387822] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    3.387827] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.387835] pc : clk_branch_toggle+0x194/0x1b8
[    3.438975] lr : clk_branch_toggle+0x194/0x1b8
[    3.443470] sp : ffff80000c26b530
[    3.447893] x29: ffff80000c26b530 x28: ffff80000afe9c90 x27: ffff0000123bae80
[    3.451288] x26: ffff80006a5e2000 x25: ffff80000a6fcea0 x24: 0000000000000000
[    3.458405] x23: ffff80000b185118 x22: ffff80000877bfa8 x21: 0000000000000001
[    3.465522] x20: 0000000000000000 x19: ffff80000a7ea000 x18: ffffffffffffffff
[    3.472641] x17: 706f725073795374 x16: ffff800008736a60 x15: 0000000000000151
[    3.479759] x14: ffff80000c26b2f0 x13: 00000000ffffffea x12: ffff80000b073228
[    3.486877] x11: 0000000000000001 x10: 0000000000000001 x9 : ffff80000b05b240
[    3.493994] x8 : c0000000ffffefff x7 : 0000000000017fe8 x6 : ffff80000b05b1e8
[    3.501113] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 00000000ffffefff
[    3.508230] x2 : ffff80000b003138 x1 : c583fdb1c5aaf100 x0 : 0000000000000000
[    3.515350] Call trace:
[    3.522458]  clk_branch_toggle+0x194/0x1b8
[    3.524719]  clk_branch2_enable+0x1c/0x28
[    3.528884]  clk_core_enable+0x78/0xc0
[    3.532963]  clk_core_enable_lock+0x24/0x48
[    3.536610]  clk_enable+0x18/0x30
[    3.540689]  mdp5_enable+0xb0/0x198 [msm]
[    3.544163]  mdp5_kms_init+0x49c/0x818 [msm]
[    3.548158]  msm_drm_bind+0x1d8/0x638 [msm]
[    3.552497]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    3.556404]  __component_add+0xa8/0x180
[    3.561957]  component_add+0x14/0x20
[    3.565602]  dsi_dev_attach+0x20/0x30 [msm]
[    3.569423]  dsi_host_attach+0xa0/0x140 [msm]
[    3.573331]  devm_mipi_dsi_attach+0x3c/0xa8
[    3.577842]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    3.581838]  adv7511_probe+0x8ac/0x908 [adv7511]
[    3.587045]  i2c_device_probe+0x35c/0x378
[    3.591644]  really_probe+0xc0/0x2b8
[    3.595550]  __driver_probe_device+0x7c/0xe8
[    3.599197]  driver_probe_device+0x38/0x118
[    3.603450]  __driver_attach+0xa8/0x138
[    3.607355]  bus_for_each_dev+0x7c/0xd8
[    3.611175]  driver_attach+0x24/0x30
[    3.614994]  bus_add_driver+0x15c/0x210
[    3.618815]  driver_register+0x64/0x120
[    3.622373]  i2c_register_driver+0x48/0xb0
[    3.626193]  adv7511_init+0x48/0x1000 [adv7511]
[    3.630361]  do_one_initcall+0x60/0x1f0
[    3.634786]  do_init_module+0x48/0x1a8
[    3.638606]  load_module+0x183c/0x1b28
[    3.642424]  __do_sys_finit_module+0xc4/0x118
[    3.646159]  __arm64_sys_finit_module+0x20/0x30
[    3.650586]  invoke_syscall+0x44/0x100
[    3.654925]  el0_svc_common.constprop.3+0x6c/0xf0
[    3.658747]  do_el0_svc+0x2c/0xc8
[    3.663517]  el0_svc+0x20/0x60
[    3.666816]  el0t_64_sync_handler+0x98/0xc0
[    3.669769]  el0t_64_sync+0x170/0x174
[    3.673849] ---[ end trace 0000000000000000 ]---
[    3.678119] ------------[ cut here ]------------
[    3.682365] gcc_mdss_axi_clk status stuck at 'off'
[    3.682405] WARNING: CPU: 0 PID: 259 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    3.691572] Modules linked in: coresight_tmc coresight_replicator coresight_funnel coresight_tpiu adv7511(+) cec coresight_stm coresight_cti stm_core coresight snd_soc_lpass_apq8016 snd_soc_apq8016_sbc snd_soc_qcom_common snd_soc_lpass_cpu snd_soc_msm8916_digital snd_soc_lpass_platform soundwire_bus qrtr snd_soc_msm8916_analog qcom_spmi_vadc qcom_spmi_temp_alarm qcom_pon qcom_vadc_common rtc_pm8xxx qcom_q6v5_mss qcom_pil_info qcom_camss qcom_q6v5 qcom_sysmon videobuf2_dma_sg qcom_common qnoc_msm8916 qcom_glink_smem qmi_helpers v4l2_fwnode v4l2_async venus_core(+) v4l2_mem2mem videobuf2_memops videobuf2_v4l2 videobuf2_common videodev qcom_stats qcom_rng mc msm i2c_qcom_cci mdt_loader llcc_qcom ocmem gpu_sched drm_dp_aux_bus drm_display_helper icc_smd_rpm rpmsg_ctrl rpmsg_char display_connector drm_kms_helper rmtfs_mem drm socinfo
[    3.752218] CPU: 0 PID: 259 Comm: udevd Tainted: G        W          6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    3.774385] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    3.784186] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.790869] pc : clk_branch_toggle+0x194/0x1b8
[    3.797547] lr : clk_branch_toggle+0x194/0x1b8
[    3.802062] sp : ffff80000c26b530
[    3.806485] x29: ffff80000c26b530 x28: ffff80000afe9c90 x27: ffff0000123bae80
[    3.809880] x26: ffff80006a5e2000 x25: ffff80000a6fce88 x24: 0000000000000000
[    3.816997] x23: ffff80000b185098 x22: ffff80000877bfa8 x21: 0000000000000001
[    3.824116] x20: 0000000000000000 x19: ffff80000a7ea000 x18: ffffffffffffffff
[    3.831233] x17: 706f725073795374 x16: ffff800008736a60 x15: 000000000000018e
[    3.838352] x14: ffff80000c26b2f0 x13: 00000000ffffffea x12: ffff80000b073228
[    3.845470] x11: 0000000000000001 x10: 0000000000000001 x9 : ffff80000b05b240
[    3.852589] x8 : c0000000ffffefff x7 : 0000000000017fe8 x6 : ffff80000b05b1e8
[    3.859706] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 00000000ffffefff
[    3.866825] x2 : ffff80000b003138 x1 : c583fdb1c5aaf100 x0 : 0000000000000000
[    3.873944] Call trace:
[    3.881052]  clk_branch_toggle+0x194/0x1b8
[    3.883311]  clk_branch2_enable+0x1c/0x28
[    3.887477]  clk_core_enable+0x78/0xc0
[    3.891556]  clk_core_enable_lock+0x24/0x48
[    3.895203]  clk_enable+0x18/0x30
[    3.899282]  mdp5_enable+0xd8/0x198 [msm]
[    3.902758]  mdp5_kms_init+0x49c/0x818 [msm]
[    3.906751]  msm_drm_bind+0x1d8/0x638 [msm]
[    3.911090]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    3.914999]  __component_add+0xa8/0x180
[    3.920551]  component_add+0x14/0x20
[    3.924195]  dsi_dev_attach+0x20/0x30 [msm]
[    3.928017]  dsi_host_attach+0xa0/0x140 [msm]
[    3.931924]  devm_mipi_dsi_attach+0x3c/0xa8
[    3.936436]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    3.940431]  adv7511_probe+0x8ac/0x908 [adv7511]
[    3.945638]  i2c_device_probe+0x35c/0x378
[    3.950239]  really_probe+0xc0/0x2b8
[    3.954144]  __driver_probe_device+0x7c/0xe8
[    3.957791]  driver_probe_device+0x38/0x118
[    3.962044]  __driver_attach+0xa8/0x138
[    3.965948]  bus_for_each_dev+0x7c/0xd8
[    3.969769]  driver_attach+0x24/0x30
[    3.973589]  bus_add_driver+0x15c/0x210
[    3.977408]  driver_register+0x64/0x120
[    3.980967]  i2c_register_driver+0x48/0xb0
[    3.984786]  adv7511_init+0x48/0x1000 [adv7511]
[    3.988955]  do_one_initcall+0x60/0x1f0
[    3.993380]  do_init_module+0x48/0x1a8
[    3.997200]  load_module+0x183c/0x1b28
[    4.001019]  __do_sys_finit_module+0xc4/0x118
[    4.004753]  __arm64_sys_finit_module+0x20/0x30
[    4.009180]  invoke_syscall+0x44/0x100
[    4.013518]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.017340]  do_el0_svc+0x2c/0xc8
[    4.022112]  el0_svc+0x20/0x60
[    4.025409]  el0t_64_sync_handler+0x98/0xc0
[    4.028363]  el0t_64_sync+0x170/0x174
[    4.032442] ---[ end trace 0000000000000000 ]---
[    4.036752] ------------[ cut here ]------------
[    4.040955] gcc_mdss_mdp_clk status stuck at 'off'
[    4.040996] WARNING: CPU: 0 PID: 259 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    4.050164] Modules linked in: coresight_tmc coresight_replicator coresight_funnel coresight_tpiu adv7511(+) cec coresight_stm coresight_cti stm_core coresight snd_soc_lpass_apq8016 snd_soc_apq8016_sbc snd_soc_qcom_common snd_soc_lpass_cpu snd_soc_msm8916_digital snd_soc_lpass_platform soundwire_bus qrtr snd_soc_msm8916_analog qcom_spmi_vadc qcom_spmi_temp_alarm qcom_pon qcom_vadc_common rtc_pm8xxx qcom_q6v5_mss qcom_pil_info qcom_camss qcom_q6v5 qcom_sysmon videobuf2_dma_sg qcom_common qnoc_msm8916 qcom_glink_smem qmi_helpers v4l2_fwnode v4l2_async venus_core(+) v4l2_mem2mem videobuf2_memops videobuf2_v4l2 videobuf2_common videodev qcom_stats qcom_rng mc msm i2c_qcom_cci mdt_loader llcc_qcom ocmem gpu_sched drm_dp_aux_bus drm_display_helper icc_smd_rpm rpmsg_ctrl rpmsg_char display_connector drm_kms_helper rmtfs_mem drm socinfo
[    4.110812] CPU: 0 PID: 259 Comm: udevd Tainted: G        W          6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    4.132979] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    4.142780] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.149463] pc : clk_branch_toggle+0x194/0x1b8
[    4.156141] lr : clk_branch_toggle+0x194/0x1b8
[    4.160656] sp : ffff80000c26b530
[    4.165080] x29: ffff80000c26b530 x28: ffff80000afe9c90 x27: ffff0000123bae80
[    4.168473] x26: ffff80006a5e2000 x25: ffff80000a6fce40 x24: 0000000000000000
[    4.175592] x23: ffff80000b184f18 x22: ffff80000877bfa8 x21: 0000000000000001
[    4.182710] x20: 0000000000000000 x19: ffff80000a7ea000 x18: ffffffffffffffff
[    4.189828] x17: 706f725073795374 x16: ffff800008736a60 x15: 00000000000001ca
[    4.196946] x14: ffff80000c26b2f0 x13: 00000000ffffffea x12: ffff80000b073228
[    4.204064] x11: 0000000000000001 x10: 0000000000000001 x9 : ffff80000b05b240
[    4.211181] x8 : c0000000ffffefff x7 : 0000000000017fe8 x6 : ffff80000b05b1e8
[    4.218301] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 00000000ffffefff
[    4.225418] x2 : ffff80000b003138 x1 : c583fdb1c5aaf100 x0 : 0000000000000000
[    4.232536] Call trace:
[    4.239644]  clk_branch_toggle+0x194/0x1b8
[    4.241906]  clk_branch2_enable+0x1c/0x28
[    4.246072]  clk_core_enable+0x78/0xc0
[    4.250150]  clk_core_enable_lock+0x24/0x48
[    4.253798]  clk_enable+0x18/0x30
[    4.257876]  mdp5_enable+0x100/0x198 [msm]
[    4.261352]  mdp5_kms_init+0x49c/0x818 [msm]
[    4.265344]  msm_drm_bind+0x1d8/0x638 [msm]
[    4.269771]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    4.273678]  __component_add+0xa8/0x180
[    4.279231]  component_add+0x14/0x20
[    4.282875]  dsi_dev_attach+0x20/0x30 [msm]
[    4.286697]  dsi_host_attach+0xa0/0x140 [msm]
[    4.290603]  devm_mipi_dsi_attach+0x3c/0xa8
[    4.295117]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    4.299113]  adv7511_probe+0x8ac/0x908 [adv7511]
[    4.304318]  i2c_device_probe+0x35c/0x378
[    4.308919]  really_probe+0xc0/0x2b8
[    4.312824]  __driver_probe_device+0x7c/0xe8
[    4.316471]  driver_probe_device+0x38/0x118
[    4.320725]  __driver_attach+0xa8/0x138
[    4.324629]  bus_for_each_dev+0x7c/0xd8
[    4.328449]  driver_attach+0x24/0x30
[    4.332269]  bus_add_driver+0x15c/0x210
[    4.336088]  driver_register+0x64/0x120
[    4.339647]  i2c_register_driver+0x48/0xb0
[    4.343467]  adv7511_init+0x48/0x1000 [adv7511]
[    4.347634]  do_one_initcall+0x60/0x1f0
[    4.352060]  do_init_module+0x48/0x1a8
[    4.355880]  load_module+0x183c/0x1b28
[    4.359698]  __do_sys_finit_module+0xc4/0x118
[    4.363434]  __arm64_sys_finit_module+0x20/0x30
[    4.367861]  invoke_syscall+0x44/0x100
[    4.372198]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.376022]  do_el0_svc+0x2c/0xc8
[    4.380792]  el0_svc+0x20/0x60
[    4.384090]  el0t_64_sync_handler+0x98/0xc0
[    4.387044]  el0t_64_sync+0x170/0x174
[    4.391123] ---[ end trace 0000000000000000 ]---

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.BF.3.0-00288
S - IMAGE_VARIANT_STRING=HAAAANAZA
S - OEM_IMAGE_VERSION_STRING=CRM
S - Boot Config, 0x000002e1
S - Core 0 Frequency, 0 MHz
B -      1545 - PBL, Start
B -      3490 - bootable_media_detect_entry, Start
B -    155363 - bootable_media_detect_success, Start
B -    155368 - elf_loader_entry, Start
B -    156934 - auth_hash_seg_entry, Start
B -    157143 - auth_hash_seg_exit, Start
B -    173218 - elf_segs_hash_verify_entry, Start
B -    233807 - PBL, End
B -    240340 - SBL1, Start
B -    302987 - pm_device_init, Start
D -     14731 - pm_device_init, Delta
B -    318145 - boot_flash_init, Start
D -         0 - boot_flash_init, Delta
B -    322171 - boot_config_data_table_init, Start
D -     31628 - boot_config_data_table_init, Delta - (452 Bytes)
B -    358375 - CDT version:3,Platform ID:24,Major ID:1,Minor ID:0,Subtype:0
B -    364627 - sbl1_ddr_set_params, Start
B -    368409 - cpr_init, Start
D -         0 - cpr_init, Delta
B -    374021 - Pre_DDR_clock_init, Start
D -       183 - Pre_DDR_clock_init, Delta
D -         0 - sbl1_ddr_set_params, Delta
B -    386618 - pm_driver_init, Start
D -      3477 - pm_driver_init, Delta
B -    398665 - SBC platform detected: XO_ADJ_FINE = 0x20
B -    398726 - clock_init, Start
D -        61 - clock_init, Delta
B -    416050 - Image Load, Start
D -     24430 - QSEE Image Loaded, Delta - (571664 Bytes)
B -    440481 - Image Load, Start
D -       213 - SEC Image Loaded, Delta - (2048 Bytes)
B -    447709 - sbl1_efs_handle_cookies, Start
D -       335 - sbl1_efs_handle_cookies, Delta
B -    455487 - Image Load, Start
D -     12078 - QHEE Image Loaded, Delta - (56048 Bytes)
B -    467595 - Image Load, Start
D -     13664 - RPM Image Loaded, Delta - (149316 Bytes)
B -    481290 - Image Load, Start
D -     13694 - APPSBL Image Loaded, Delta - (519728 Bytes)
B -    495015 - QSEE Execution, Start
D -        91 - QSEE Execution, Delta
B -    500718 - SBL1, End
D -    262727 - SBL1, Delta
S - Flash Throughput, 121000 KB/s  (1299256 Bytes,  10705 us)
S - DDR Frequency, 400 MHz
Android Bootloader - UART_DM Initialized!!!
[0] [0] BUILD_VERSION=
[0] [0] BUILD_DATE=15:18:29 - Dec  5 2021
[0] [0] welcome to lk

[10] [10] platform_init()
[10] [10] target_init()
[40] [40] SDHC Running in HS200 mode
[70] [70] Done initialization of the card
[70] [70] pm8x41_get_is_cold_boot: Warm boot
[570] [570] Neither 'config' nor 'frp' partition found
[580] [580] Not able to search the panel:
[580] [580] Display not enabled for 24 HW type
[580] [580] Target panel init not found!
[590] [590] pm8x41_get_is_cold_boot: Warm boot
[590] [590] partition misc doesn't exist
[600] [600] error in emmc_recovery_init
[600] [600] Unable to locate /bootselect partition
[600] [600] No 'misc' partition found
[610] [610] Error reading MISC partition
[610] [610] failed to get ffbm cookie[610] [610] Loading boot image (40099840): start
[1000] [1000] Loading boot image (40099840): done
[1010] [1010] use_signed_kernel=0, is_unlocked=0, is_tampered=0.
[2120] [2120] qcom,msm-id entry not found
[2130] [2130] Only one appended non-skales DTB, select it.
[2130] [2130] target_display_panel_node:510: hw_id=24 panel_name=""
[2140] [2140] cmdline: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[2160] [2160] Updating device tree: start
[2240] [2240] Setting WLAN mac address in DT: 02:00:5D:40:03:75
[2260] [2260] Setting Bluetooth BD address in DT: 02:00:5D:40:03:74
[2270] [2270] Setting BT mac address in DT: 02:00:5D:40:03:74
[2280] [2280] Updating device tree: done
[2280] [2280] booting linux @ 0x80080000, ramdisk @ 0x91474800 (19699646), tags/device tree @ 0x85e00000
[2290] [2290] Jumping to kernel via monitor
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 6.1.0-rc2-13606-g8bd1db35ef72-dirty (jesszhan@jesszhan-linux) (aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30) #14 SMP PREEMPT Fri Nov  4 19:49:32 PDT 2022
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b0000 (options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfccda00-0xbfccffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
[    0.000000]   node   0: [mem 0x0000000086000000-0x0000000089efffff]
[    0.000000]   node   0: [mem 0x0000000089f00000-0x000000008e9fffff]
[    0.000000]   node   0: [mem 0x000000008ea00000-0x000000008eafffff]
[    0.000000]   node   0: [mem 0x000000008eb00000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] cma: Reserved 32 MiB at 0x00000000bcc00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: failed to set PC mode: -3
[    0.000000] percpu: Embedded 20 pages/cpu s44840 r8192 d28888 u81920
[    0.000000] pcpu-alloc: s44840 r8192 d28888 u81920 alloc=20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM errata 826319, 827319, 824069, or 819472
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[    0.000000] Unknown kernel command line parameters "copy_modules", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 856604K/1048576K available (16192K kernel code, 3704K rwdata, 24600K rodata, 7552K init, 615K bss, 159204K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.011101] Console: colour dummy device 80x25
[    0.018757] printk: console [tty0] enabled
[    0.023261] printk: bootconsole [msm_serial_dm0] disabled
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 6.1.0-rc2-13606-g8bd1db35ef72-dirty (jesszhan@jesszhan-linux) (aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30) #14 SMP PREEMPT Fri Nov  4 19:49:32 PDT 2022
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b0000 (options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfccda00-0xbfccffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
[    0.000000]   node   0: [mem 0x0000000086000000-0x0000000089efffff]
[    0.000000]   node   0: [mem 0x0000000089f00000-0x000000008e9fffff]
[    0.000000]   node   0: [mem 0x000000008ea00000-0x000000008eafffff]
[    0.000000]   node   0: [mem 0x000000008eb00000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] cma: Reserved 32 MiB at 0x00000000bcc00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: failed to set PC mode: -3
[    0.000000] percpu: Embedded 20 pages/cpu s44840 r8192 d28888 u81920
[    0.000000] pcpu-alloc: s44840 r8192 d28888 u81920 alloc=20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM errata 826319, 827319, 824069, or 819472
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[    0.000000] Unknown kernel command line parameters "copy_modules", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 856604K/1048576K available (16192K kernel code, 3704K rwdata, 24600K rodata, 7552K init, 615K bss, 159204K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.011101] Console: colour dummy device 80x25
[    0.018757] printk: console [tty0] enabled
[    0.023261] printk: bootconsole [msm_serial_dm0] disabled
[    0.027432] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=76800)
[    0.027466] pid_max: default: 32768 minimum: 301
[    0.027564] LSM: Security Framework initializing
[    0.027696] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.027730] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.029664] cblist_init_generic: Setting adjustable number of callback queues.
[    0.029696] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.029805] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.030054] rcu: Hierarchical SRCU implementation.
[    0.030071] rcu: 	Max phase no-delay instances is 1000.
[    0.037475] EFI services will not be available.
[    0.037811] smp: Bringing up secondary CPUs ...
[    0.038576] Detected VIPT I-cache on CPU1
[    0.038714] CPU1: Booted secondary processor 0x0000000001 [0x410fd030]
[    0.039518] Detected VIPT I-cache on CPU2
[    0.039638] CPU2: Booted secondary processor 0x0000000002 [0x410fd030]
[    0.040436] Detected VIPT I-cache on CPU3
[    0.040557] CPU3: Booted secondary processor 0x0000000003 [0x410fd030]
[    0.040654] smp: Brought up 1 node, 4 CPUs
[    0.040737] SMP: Total of 4 processors activated.
[    0.040754] CPU features: detected: 32-bit EL0 Support
[    0.040770] CPU features: detected: 32-bit EL1 Support
[    0.040787] CPU features: detected: CRC32 instructions
[    0.040880] CPU: All CPU(s) started at EL1
[    0.040918] alternatives: applying system-wide alternatives
[    0.042914] devtmpfs: initialized
[    0.056702] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.056764] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.058035] pinctrl core: initialized pinctrl subsystem
[    0.062506] DMI not present or invalid.
[    0.063518] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.064968] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.065321] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.065495] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.065577] audit: initializing netlink subsys (disabled)
[    0.065822] audit: type=2000 audit(0.052:1): state=initialized audit_enabled=0 res=1
[    0.068115] thermal_sys: Registered thermal governor 'step_wise'
[    0.068125] thermal_sys: Registered thermal governor 'power_allocator'
[    0.068219] cpuidle: using governor menu
[    0.068561] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.068698] ASID allocator initialised with 32768 entries
[    0.071894] Serial: AMBA PL011 UART driver
[    0.091701] amba 821000.funnel: Fixing up cyclic dependency with 802000.stm
[    0.091983] amba 824000.replicator: Fixing up cyclic dependency with 820000.tpiu
[    0.092300] amba 825000.etf: Fixing up cyclic dependency with 824000.replicator
[    0.092392] amba 825000.etf: Fixing up cyclic dependency with 821000.funnel
[    0.092643] amba 826000.etr: Fixing up cyclic dependency with 824000.replicator
[    0.092909] amba 841000.funnel: Fixing up cyclic dependency with 821000.funnel
[    0.093908] amba 85c000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094154] amba 85d000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094394] amba 85e000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094649] amba 85f000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.097972] platform 1800000.clock-controller: Fixing up cyclic dependency with dsi-phy@1a98300 (1a00000.mdss)
[    0.117240] KASLR enabled
[    0.130259] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.130297] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.130318] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
[    0.130336] HugeTLB: 508 KiB vmemmap can be freed for a 32.0 MiB page
[    0.130356] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.130374] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.130394] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
[    0.130412] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.132647] ACPI: Interpreter disabled.
[    0.137100] iommu: Default domain type: Translated 
[    0.137130] iommu: DMA domain TLB invalidation policy: strict mode 
[    0.137462] SCSI subsystem initialized
[    0.137651] libata version 3.00 loaded.
[    0.138072] usbcore: registered new interface driver usbfs
[    0.138139] usbcore: registered new interface driver hub
[    0.138197] usbcore: registered new device driver usb
[    0.139792] pps_core: LinuxPPS API ver. 1 registered
[    0.139813] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.139850] PTP clock support registered
[    0.140035] EDAC MC: Ver: 3.0.0
[    0.140519] CPUidle PSCI: Initialized CPU PM domain topology
[    0.142890] FPGA manager framework
[    0.143077] Advanced Linux Sound Architecture Driver Initialized.
[    0.144153] vgaarb: loaded
[    0.144629] clocksource: Switched to clocksource arch_sys_counter
[    0.144899] VFS: Disk quotas dquot_6.6.0
[    0.144971] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.145207] pnp: PnP ACPI: disabled
[    0.154052] NET: Registered PF_INET protocol family
[    0.154300] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.155784] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
[    0.155886] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.155927] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.156033] TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.156356] TCP: Hash tables configured (established 8192 bind 8192)
[    0.156493] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.156550] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.156776] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.157256] RPC: Registered named UNIX socket transport module.
[    0.157280] RPC: Registered udp transport module.
[    0.157295] RPC: Registered tcp transport module.
[    0.157310] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.157333] PCI: CLS 0 bytes, default 64
[    0.157639] Unpacking initramfs...
[    0.158228] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters available
[    0.158928] kvm [1]: HYP mode not available
[    0.160202] Initialise system trusted keyrings
[    0.160507] workingset: timestamp_bits=42 max_order=18 bucket_order=0
[    0.169761] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.170695] NFS: Registering the id_resolver key type
[    0.170781] Key type id_resolver registered
[    0.170800] Key type id_legacy registered
[    0.170912] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.170935] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.171163] 9p: Installing v9fs 9p2000 file system support
[    0.225417] Key type asymmetric registered
[    0.225460] Asymmetric key parser 'x509' registered
[    0.225573] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.225602] io scheduler mq-deadline registered
[    0.225618] io scheduler kyber registered
[    0.247361] EINJ: ACPI disabled.
[    0.284995] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.289591] SuperH (H)SCI(F) driver initialized
[    0.290651] msm_serial: driver initialized
[    0.301616] loop: module loaded
[    0.303298] megasas: 07.719.03.00-rc1
[    0.309597] spmi spmi-0: PMIC arbiter version v2 (0x20010000)
[    0.319142] gpio gpiochip1: (200f000.spmi:pmic@0:mpps@a000): not an immutable chip, please consider fixing it!
[    0.327989] tun: Universal TUN/TAP device driver, 1.6
[    0.329796] thunder_xcv, ver 1.0
[    0.329870] thunder_bgx, ver 1.0
[    0.329929] nicpf, ver 1.0
[    0.332255] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    0.332286] hns3: Copyright (c) 2017 Huawei Corporation.
[    0.332374] hclge is initializing
[    0.332416] e1000: Intel(R) PRO/1000 Network Driver
[    0.332434] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.332499] e1000e: Intel(R) PRO/1000 Network Driver
[    0.332516] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.332584] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.332603] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.332691] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    0.332711] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.333369] sky2: driver version 1.30
[    0.335510] VFIO - User Level meta-driver version: 0.3
[    0.341535] usbcore: registered new interface driver usb-storage
[    0.362068] usb3503 usb2513: switched to HUB mode
[    0.362114] usb3503 usb2513: usb3503_probe: probed in hub mode
[    0.363004] usbcore: registered new device driver onboard-usb-hub
[    0.368151] i2c_dev: i2c /dev entries driver
[    0.382672] sdhci: Secure Digital Host Controller Interface driver
[    0.382715] sdhci: Copyright(c) Pierre Ossman
[    0.384358] Synopsys Designware Multimedia Card Interface Driver
[    0.386490] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.392096] ledtrig-cpu: registered to indicate activity on CPUs
[    0.396078] usbcore: registered new interface driver usbhid
[    0.396116] usbhid: USB HID core driver
[    0.411407] NET: Registered PF_PACKET protocol family
[    0.411616] 9pnet: Installing 9P2000 support
[    0.411737] Key type dns_resolver registered
[    0.412708] registered taskstats version 1
[    0.412762] Loading compiled-in X.509 certificates
[    0.446750] s3: Bringing 0uV into 375000-375000uV
[    0.447169] s4: Bringing 0uV into 1800000-1800000uV
[    0.447716] l1: Bringing 0uV into 375000-375000uV
[    0.447971] l2: Bringing 0uV into 1200000-1200000uV
[    0.448251] l4: Bringing 0uV into 1750000-1750000uV
[    0.448511] l5: Bringing 0uV into 1750000-1750000uV
[    0.448818] l6: Bringing 0uV into 1800000-1800000uV
[    0.449101] l7: Bringing 0uV into 1750000-1750000uV
[    0.449358] l8: Bringing 0uV into 1750000-1750000uV
[    0.449643] l9: Bringing 0uV into 1750000-1750000uV
[    0.449946] l10: Bringing 0uV into 1750000-1750000uV
[    0.450224] l11: Bringing 0uV into 1750000-1750000uV
[    0.450519] l12: Bringing 0uV into 1750000-1750000uV
[    0.450805] l13: Bringing 0uV into 1750000-1750000uV
[    0.451085] l14: Bringing 0uV into 1750000-1750000uV
[    0.451449] l15: Bringing 0uV into 1750000-1750000uV
[    0.455703] qcom_scm: convention: smc arm 32
[    0.459985] l16: Bringing 0uV into 1750000-1750000uV
[    0.460470] l17: Bringing 0uV into 3300000-3300000uV
[    0.460945] l18: Bringing 0uV into 1750000-1750000uV
[    0.465823] msm_serial 78af000.serial: msm_serial: detected port #1
[    0.465893] msm_serial 78af000.serial: uartclk = 19200000
[    0.466012] 78af000.serial: ttyMSM1 at MMIO 0x78af000 (irq = 25, base_baud = 1200000) is a MSM
[    0.468342] msm_serial 78b0000.serial: msm_serial: detected port #0
[    0.468412] msm_serial 78b0000.serial: uartclk = 7372800
[    0.468548] 78b0000.serial: ttyMSM0 at MMIO 0x78b0000 (irq = 26, base_baud = 460800) is a MSM
[    0.468594] msm_serial: console setup on port #0
[    1.598977] Freeing initrd memory: 19232K
[    1.601500] printk: console [ttyMSM0] enabled
[    1.898883] qcom-iommu 1ef0000.iommu: iommu sec: pgtable size: 94208
[    1.914511] spi_qup 78b7000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
[    1.917722] spi_qup 78b9000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
[    1.974526] i2c_qup 78b6000.i2c: using default clock-frequency 100000
[    1.974589] i2c_qup 78b6000.i2c: 
[    1.974589]  tx channel not available
[    1.982660] i2c_qup 78b8000.i2c: using default clock-frequency 100000
[    1.986770] i2c_qup 78b8000.i2c: 
[    1.986770]  tx channel not available
[    1.994358] i2c 3-0039: Fixing up cyclic dependency with hdmi-out
[    2.002854] i2c_qup 78ba000.i2c: using default clock-frequency 100000
[    2.006384] i2c_qup 78ba000.i2c: 
[    2.006384]  tx channel not available
[    2.029107] sdhci_msm 7864900.mmc: Got CD GPIO
[    2.062724] mmc0: SDHCI controller on 7824900.mmc [7824900.mmc] using ADMA 64-bit
[    2.065845] mmc1: SDHCI controller on 7864900.mmc [7864900.mmc] using ADMA 64-bit
[    2.080757] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.113906] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.141628] mmc0: Card appears overclocked; req 177770000 Hz, actual 177777777 Hz
[    2.141699] mmc0: Card appears overclocked; req 177770000 Hz, actual 177777777 Hz
[    2.158884] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.160014] mmc0: new HS200 MMC card at address 0001
[    2.160551] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    2.165942] mmcblk0: mmc0:0001 S10008 7.13 GiB 
[    2.171275] ALSA device list:
[    2.185399]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
[    2.188909] Freeing unused kernel memory: 7552K
[    2.190305] mmcblk0boot0: mmc0:0001 S10008 4.00 MiB 
[    2.196462] mmcblk0boot1: mmc0:0001 S10008 4.00 MiB 
[    2.201393] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.201511] mmcblk0rpmb: mmc0:0001 S10008 4.00 MiB, chardev (234:0)
[    2.220984] Run /init as init process
[    2.221028]   with arguments:
[    2.223627]     /init
[    2.226615]     copy_modules
[    2.228857]     androidboot.emmc=true
[    2.231789]     androidboot.serialno=5d400375
[    2.235366]     androidboot.baseband=apq
[    2.239706]     mdss_mdp.panel=0:dsi:0:
[    2.240899] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.243689]   with environment:
[    2.254587]     HOME=/
[    2.257577]     TERM=linux
Starting version 250.4-1-gc3aead5+
[    2.884992] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.925450] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.959603] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.992595] mc: Linux media interface: v0.10
[    2.993925] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.026565] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.028218] videodev: Linux video capture interface: v2.00
[    3.067984] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.075611] qcom-camss 1b0ac00.camss: Adding to iommu group 1
[    3.076237] adreno 1c00000.gpu: Adding to iommu group 2
[    3.085761] qcom-venus 1d00000.video-codec: Adding to iommu group 0
[    3.093220] rtc-pm8xxx 200f000.spmi:pmic@0:rtc@6000: registered as rtc0
[    3.093388] rtc-pm8xxx 200f000.spmi:pmic@0:rtc@6000: setting system clock to 1970-01-01T01:00:02 UTC (3602)
[    3.095123] platform 1a98000.dsi: Fixing up cyclic dependency with 3-0039
[    3.100435] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.116250] platform 1a98000.dsi: Fixing up cyclic dependency with 1a01000.mdp
[    3.133021] qcom-camss 1b0ac00.camss: Failed to configure power domains: -17
[    3.133137] qcom-camss: probe of 1b0ac00.camss failed with error -17
[    3.149084] spmi-temp-alarm 200f000.spmi:pmic@0:temp-alarm@2400: failed to register sensor
[    3.153045] input: pm8941_pwrkey as /devices/platform/soc@0/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:pwrkey/input/input1
[    3.165907] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.166257] apq8016-lpass-cpu 7708000.audio-controller: qcom,lpass-cpu-apq8016 compatible is deprecated
[    3.173440] msm_mdp 1a01000.mdp: Adding to iommu group 3
[    3.178512] NET: Registered PF_QIPCRTR protocol family
[    3.187339] msm_mdp 1a01000.mdp: No interconnect support may cause display underflows!
[    3.192799] input: pm8941_resin as /devices/platform/soc@0/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:resin/input/input2
[    3.206851] remoteproc remoteproc0: 4080000.remoteproc is available
[    3.239757] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.251362]  cs_system_cfg: CoreSight Configuration manager initialised
[    3.274340] coresight cti_sys0: CTI initialized
[    3.278031] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.278756] adv7511 3-0039: supply dvdd not found, using dummy regulator
[    3.284460] coresight cti_sys1: CTI initialized
[    3.285207] adv7511 3-0039: supply pvdd not found, using dummy regulator
[    3.292085] coresight stm0: STM32 initialized
[    3.296179] adv7511 3-0039: supply a2vdd not found, using dummy regulator
[    3.308991] coresight cti_cpu0: CTI initialized
[    3.311659] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.318642] coresight cti_cpu1: CTI initialized
[    3.327896] coresight cti_cpu2: CTI initialized
[    3.331433] coresight cti_cpu3: CTI initialized
[    3.331719] msm_mdp 1a01000.mdp: bound 1a98000.dsi (ops dsi_ops [msm])
[    3.341309] adreno 1c00000.gpu: supply vdd not found, using dummy regulator
[    3.346062] adreno 1c00000.gpu: supply vddcx not found, using dummy regulator
[    3.354525] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    3.360005] Mem abort info:
[    3.365075] msm_mdp 1a01000.mdp: bound 1c00000.gpu (ops a3xx_ops [msm])
[    3.368337] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.368813]   ESR = 0x0000000096000006
[    3.371743] ------------[ cut here ]------------
[    3.377881]   EC = 0x25: DABT (current EL), IL = 32 bits
[    3.385137] gcc_mdss_ahb_clk status stuck at 'off'
[    3.385181] WARNING: CPU: 1 PID: 260 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    3.388884]   SET = 0, FnV = 0
[    3.393646] Modules linked in: adv7511(+) coresight_replicator cec
[    3.398952]   EA = 0, S1PTW = 0
[    3.403547]  coresight_stm coresight_tpiu coresight_funnel coresight_cti stm_core
[    3.405676] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.412841]   FSC = 0x06: level 2 translation fault
[    3.415869]  coresight snd_soc_msm8916_digital
[    3.422044] Data abort info:
[    3.425071]  snd_soc_apq8016_sbc snd_soc_qcom_common soundwire_bus qrtr snd_soc_lpass_apq8016
[    3.432721]   ISV = 0, ISS = 0x00000006
[    3.439825]  snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_msm8916_analog qcom_spmi_vadc qcom_vadc_common
[    3.444608]   CM = 0, WnR = 0
[    3.449111]  qcom_q6v5_mss qcom_pon qcom_spmi_temp_alarm rtc_pm8xxx
[    3.452156] user pgtable: 4k pages, 48-bit VAs, pgdp=000000009221a000
[    3.460571]  qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_camss
[    3.464234] [0000000000000000] pgd=080000008d53b003
[    3.474285]  videobuf2_dma_sg v4l2_fwnode msm venus_core v4l2_async v4l2_mem2mem videobuf2_memops
[    3.477163] , p4d=080000008d53b003
[    3.483230]  videobuf2_v4l2 qcom_glink_smem llcc_qcom videobuf2_common
[    3.489837] , pud=080000009230b003
[    3.496249]  ocmem qmi_helpers mdt_loader qnoc_msm8916
[    3.501124] , pmd=0000000000000000
[    3.510136]  videodev gpu_sched qcom_rng drm_dp_aux_bus
[    3.513447] 
[    3.519945]  qcom_stats mc drm_display_helper i2c_qcom_cci
[    3.523342] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
[    3.528451]  display_connector
[    3.531840] Modules linked in:
[    3.536957]  drm_kms_helper
[    3.538698]  adv7511(+)
[    3.543993]  icc_smd_rpm
[    3.550152]  coresight_replicator
[    3.553278]  rpmsg_ctrl
[    3.556315]  cec
[    3.559006]  rpmsg_char
[    3.561438]  coresight_stm
[    3.564216]  drm
[    3.567426]  coresight_tpiu
[    3.569683]  socinfo
[    3.571765]  coresight_funnel
[    3.573937]  rmtfs_mem
[    3.576714]  coresight_cti
[    3.578712] 
[    3.581228]  stm_core
[    3.583662] CPU: 1 PID: 260 Comm: udevd Not tainted 6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    3.586523]  coresight
[    3.588781] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    3.591471]  snd_soc_msm8916_digital
[    3.593121] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.595298]  snd_soc_apq8016_sbc
[    3.603450] pc : clk_branch_toggle+0x194/0x1b8
[    3.605886]  snd_soc_qcom_common
[    3.612740] lr : clk_branch_toggle+0x194/0x1b8
[    3.616303]  soundwire_bus
[    3.622982] sp : ffff80000c25b530
[    3.626456]  qrtr
[    3.630708] x29: ffff80000c25b530
[    3.634095]  snd_soc_lpass_apq8016
[    3.638346]  x28: ffff80000afe9c90
[    3.641039]  snd_soc_lpass_cpu
[    3.644422]  x27: ffff00000db94480
[    3.646333]  snd_soc_lpass_platform
[    3.649632] 
[    3.652931]  snd_soc_msm8916_analog
[    3.656315] x26: ffff8000444b6000
[    3.659354]  qcom_spmi_vadc
[    3.662739]  x25: ffff80000a6fcea0
[    3.666122]  qcom_vadc_common
[    3.667860]  x24: 0000000000000000
[    3.671072]  qcom_q6v5_mss
[    3.674544] 
[    3.677149]  qcom_pon
[    3.680620] x23: ffff80000b185118
[    3.683659]  qcom_spmi_temp_alarm
[    3.686956]  x22: ffff80000877bfa8
[    3.689647]  rtc_pm8xxx
[    3.691297]  x21: 0000000000000001
[    3.693468]  qcom_pil_info
[    3.696767] 
[    3.700066]  qcom_q6v5
[    3.703363] x20: 0000000000000000
[    3.705708]  qcom_sysmon
[    3.709179]  x19: ffff80000a7ea000
[    3.711869]  qcom_common
[    3.713519]  x18: ffffffffffffffff
[    3.715692]  qcom_camss
[    3.719075] 
[    3.721680]  videobuf2_dma_sg
[    3.724890] x17: 0000000000000000
[    3.727584]  v4l2_fwnode
[    3.730793]  x16: ffff800008736a60
[    3.733137]  msm
[    3.734874]  x15: ffff80000b003218
[    3.737740]  venus_core
[    3.741038] 
[    3.743643]  v4l2_async
[    3.746852] x14: 0000000000000000
[    3.748850]  v4l2_mem2mem
[    3.752061]  x13: 6f27207461206b63
[    3.754405]  videobuf2_memops
[    3.756141]  x12: 7574732073757461
[    3.758312]  videobuf2_v4l2
[    3.761783] 
[    3.764388]  qcom_glink_smem
[    3.767688] x11: 0000000005f5e0ff
[    3.770725]  llcc_qcom
[    3.774023]  x10: 0000000000000027
[    3.776712]  videobuf2_common
[    3.778450]  x9 : ffff80000c25b530
[    3.781316]  ocmem
[    3.784526] 
[    3.786786]  qmi_helpers
[    3.790169] x8 : ffff80000b0031e8
[    3.793208]  mdt_loader
[    3.796504]  x7 : ffff80000c25b340
[    3.798501]  qnoc_msm8916
[    3.800152]  x6 : ffff80000b05b240
[    3.802670]  videodev
[    3.805881] 
[    3.808140]  gpu_sched
[    3.811611] x5 : 0000000000000000
[    3.814302]  qcom_rng
[    3.817600]  x4 : 0000000000000000
[    3.819943]  drm_dp_aux_bus
[    3.821505]  x3 : 00000000ffffffff
[    3.823677]  qcom_stats
[    3.827060] 
[    3.829320]  mc
[    3.832617] x2 : ffff80000b003138
[    3.835309]  drm_display_helper
[    3.838779]  x1 : b07c09de59c9c000
[    3.841123]  i2c_qcom_cci
[    3.842859]  x0 : 0000000000000000
[    3.844337]  display_connector
[    3.847809] 
[    3.850761]  drm_kms_helper
[    3.854233] Call trace:
[    3.856924]  icc_smd_rpm
[    3.860223]  clk_branch_toggle+0x194/0x1b8
[    3.863258]  rpmsg_ctrl
[    3.864909]  clk_branch2_enable+0x1c/0x28
[    3.867426]  rpmsg_char
[    3.869857]  clk_core_enable+0x78/0xc0
[    3.872637]  drm
[    3.876539]  clk_core_enable_lock+0x24/0x48
[    3.878886]  socinfo
[    3.883051]  clk_enable+0x18/0x30
[    3.885309]  rmtfs_mem
[    3.889126]  mdp5_enable+0xb0/0x198 [msm]
[    3.891126] 
[    3.891130] CPU: 2 PID: 255 Comm: udevd Not tainted 6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    3.895031]  mdp5_kms_init+0x49c/0x818 [msm]
[    3.897462] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    3.900672]  msm_drm_bind+0x1d8/0x638 [msm]
[    3.902933] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.907009]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    3.908579] pc : sysfs_kf_seq_show+0x34/0x140
[    3.916647]  __component_add+0xa8/0x180
[    3.921164] lr : kernfs_seq_show+0x2c/0x38
[    3.927844]  component_add+0x14/0x20
[    3.931754] sp : ffff80000c1cbc20
[    3.938698]  dsi_dev_attach+0x20/0x30 [msm]
[    3.944252] x29: ffff80000c1cbc20
[    3.948591]  dsi_host_attach+0xa0/0x140 [msm]
[    3.952237]  x28: 0000000000000001
[    3.956403]  devm_mipi_dsi_attach+0x3c/0xa8
[    3.960135]  x27: 0000000000400cc0
[    3.963349]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    3.967340] 
[    3.970813]  adv7511_probe+0x8ac/0x908 [adv7511]
[    3.975152] x26: 000000007ffff000
[    3.978452]  i2c_device_probe+0x35c/0x378
[    3.982531]  x25: ffff00001220d0b0
[    3.986007]  really_probe+0xc0/0x2b8
[    3.991122]  x24: ffff00001220d0a0
[    3.992602]  __driver_probe_device+0x7c/0xe8
[    3.997201] 
[    4.000414]  driver_probe_device+0x38/0x118
[    4.004405] x23: 0000000000000000
[    4.007705]  __driver_attach+0xa8/0x138
[    4.011438]  x22: ffff0000120906e8
[    4.014650]  bus_for_each_dev+0x7c/0xd8
[    4.019075]  x21: ffff00001211b800
[    4.020554]  driver_attach+0x24/0x30
[    4.024457] 
[    4.027931]  bus_add_driver+0x15c/0x210
[    4.031576] x20: 0000000000000000
[    4.035049]  driver_register+0x64/0x120
[    4.038781]  x19: ffff00001220d078
[    4.042254]  i2c_register_driver+0x48/0xb0
[    4.045983]  x18: 0000000000000000
[    4.047462]  adv7511_init+0x48/0x1000 [adv7511]
[    4.051021] 
[    4.054494]  do_one_initcall+0x60/0x1f0
[    4.058139] x17: 0000000000000000
[    4.061612]  do_init_module+0x48/0x1a8
[    4.065690]  x16: 0000000000000000
[    4.069077]  load_module+0x183c/0x1b28
[    4.073500]  x15: 0000000000000000
[    4.075240]  __do_sys_finit_module+0xc4/0x118
[    4.078798] 
[    4.082271]  __arm64_sys_finit_module+0x20/0x30
[    4.085916] x14: 0000000000000000
[    4.089302]  invoke_syscall+0x44/0x100
[    4.093034]  x13: 0000000000000000
[    4.096421]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.100845]  x12: 0000000000000000
[    4.102412]  do_el0_svc+0x2c/0xc8
[    4.106663] 
[    4.110136]  el0_svc+0x20/0x60
[    4.113781] x11: 0000000000000000
[    4.117169]  el0t_64_sync_handler+0x98/0xc0
[    4.121941]  x10: 0000000000000000
[    4.125239]  el0t_64_sync+0x170/0x174
[    4.128622]  x9 : 0000000000000000
[    4.130188] ---[ end trace 0000000000000000 ]---
[    4.133052] 
[    4.133054] x8 : 00000000ffffffff
[    4.136899] ------------[ cut here ]------------
[    4.140430]  x7 : ffff00001226d880 x6 : 0000000000000000
[    4.143905] gcc_mdss_axi_clk status stuck at 'off'
[    4.147636] x5 : 0000000000000000
[    4.150972] WARNING: CPU: 1 PID: 260 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    4.155705]  x4 : 0000000000000001
[    4.157184] Modules linked in:
[    4.160397]  x3 : ffff00001211b800
[    4.165087]  adv7511(+)
[    4.170380] 
[    4.170382] x2 : ffff8000083dbee0
[    4.174980]  coresight_replicator
[    4.178371]  x1 : 0000000000000000
[    4.187567]  cec
[    4.190950]  x0 : ffff00001220d078
[    4.193991]  coresight_stm
[    4.197374] 
[    4.199716]  coresight_tpiu
[    4.201455] Call trace:
[    4.204667]  coresight_funnel
[    4.207967]  sysfs_kf_seq_show+0x34/0x140
[    4.211262]  coresight_cti
[    4.213261]  kernfs_seq_show+0x2c/0x38
[    4.216472]  stm_core
[    4.219161]  seq_read_iter+0xe0/0x458
[    4.220812]  coresight
[    4.223328]  kernfs_fop_read_iter+0x140/0x1d8
[    4.225761]  snd_soc_msm8916_digital
[    4.228886]  vfs_read+0x22c/0x2b8
[    4.232879]  snd_soc_apq8016_sbc
[    4.235484]  ksys_read+0x6c/0x100
[    4.239214]  snd_soc_qcom_common
[    4.241559]  __arm64_sys_read+0x1c/0x28
[    4.245204]  soundwire_bus
[    4.247464]  invoke_syscall+0x44/0x100
[    4.251889]  qrtr
[    4.255534]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.258747]  snd_soc_lpass_apq8016
[    4.262045]  do_el0_svc+0x2c/0xc8
[    4.265258]  snd_soc_lpass_cpu
[    4.268556]  el0_svc+0x20/0x60
[    4.272114]  snd_soc_lpass_platform
[    4.274893]  el0t_64_sync_handler+0x98/0xc0
[    4.278623]  snd_soc_msm8916_analog
[    4.280623]  el0t_64_sync+0x170/0x174
[    4.285309]  qcom_spmi_vadc
[    4.288612] Code: f9403036 f94016c1 b4000041 f9400434 (f9400281) 
[    4.291992]  qcom_vadc_common
[    4.294945] ---[ end trace 0000000000000000 ]---
[    4.297983]  qcom_q6v5_mss qcom_pon qcom_spmi_temp_alarm rtc_pm8xxx qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_camss videobuf2_dma_sg v4l2_fwnode msm venus_core v4l2_async v4l2_mem2mem videobuf2_memops videobuf2_v4l2 qcom_glink_smem llcc_qcom videobuf2_common ocmem qmi_helpers mdt_loader qnoc_msm8916 videodev gpu_sched qcom_rng drm_dp_aux_bus qcom_stats mc drm_display_helper i2c_qcom_cci display_connector drm_kms_helper icc_smd_rpm rpmsg_ctrl rpmsg_char drm socinfo rmtfs_mem
[    4.349940] CPU: 1 PID: 260 Comm: udevd Tainted: G      D W          6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    4.372139] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    4.382026] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.388709] pc : clk_branch_toggle+0x194/0x1b8
[    4.395389] lr : clk_branch_toggle+0x194/0x1b8
[    4.399902] sp : ffff80000c25b530
[    4.404327] x29: ffff80000c25b530 x28: ffff80000afe9c90 x27: ffff00000db94480
[    4.407720] x26: ffff8000444b6000 x25: ffff80000a6fce88 x24: 0000000000000000
[    4.414839] x23: ffff80000b185098 x22: ffff80000877bfa8 x21: 0000000000000001
[    4.421956] x20: 0000000000000000 x19: ffff80000a7ea000 x18: ffffffffffffffff
[    4.429075] x17: 0000000000000000 x16: ffff800008736a60 x15: ffff80000a7eabd8
[    4.436193] x14: 0000000000000000 x13: 2d2d2d5d20303030 x12: 3030303030303030
[    4.443310] x11: 3030303030206563 x10: 0000000000000004 x9 : 000000000000000a
[    4.450428] x8 : 0000000000000000 x7 : 0000000000000001 x6 : 0000000000000035
[    4.457547] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
[    4.464666] x2 : ffff80000b003138 x1 : b07c09de59c9c000 x0 : 0000000000000000
[    4.471783] Call trace:
[    4.478892]  clk_branch_toggle+0x194/0x1b8
[    4.481151]  clk_branch2_enable+0x1c/0x28
[    4.485318]  clk_core_enable+0x78/0xc0
[    4.489396]  clk_core_enable_lock+0x24/0x48
[    4.493043]  clk_enable+0x18/0x30
[    4.497122]  mdp5_enable+0xd8/0x198 [msm]
[    4.500598]  mdp5_kms_init+0x49c/0x818 [msm]
[    4.504592]  msm_drm_bind+0x1d8/0x638 [msm]
[    4.508930]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    4.512839]  __component_add+0xa8/0x180
[    4.518390]  component_add+0x14/0x20
[    4.522036]  dsi_dev_attach+0x20/0x30 [msm]
[    4.525857]  dsi_host_attach+0xa0/0x140 [msm]
[    4.529764]  devm_mipi_dsi_attach+0x3c/0xa8
[    4.534277]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    4.538272]  adv7511_probe+0x8ac/0x908 [adv7511]
[    4.543479]  i2c_device_probe+0x35c/0x378
[    4.548079]  really_probe+0xc0/0x2b8
[    4.551984]  __driver_probe_device+0x7c/0xe8
[    4.555631]  driver_probe_device+0x38/0x118
[    4.559884]  __driver_attach+0xa8/0x138
[    4.563789]  bus_for_each_dev+0x7c/0xd8
[    4.567609]  driver_attach+0x24/0x30
[    4.571428]  bus_add_driver+0x15c/0x210
[    4.575248]  driver_register+0x64/0x120
[    4.578806]  i2c_register_driver+0x48/0xb0
[    4.582627]  adv7511_init+0x48/0x1000 [adv7511]
[    4.586795]  do_one_initcall+0x60/0x1f0
[    4.591220]  do_init_module+0x48/0x1a8
[    4.595041]  load_module+0x183c/0x1b28
[    4.598859]  __do_sys_finit_module+0xc4/0x118
[    4.602594]  __arm64_sys_finit_module+0x20/0x30
[    4.607020]  invoke_syscall+0x44/0x100
[    4.611359]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.615180]  do_el0_svc+0x2c/0xc8
[    4.619951]  el0_svc+0x20/0x60
[    4.623250]  el0t_64_sync_handler+0x98/0xc0
[    4.626203]  el0t_64_sync+0x170/0x174
[    4.630284] ---[ end trace 0000000000000000 ]---
[    4.634473] ------------[ cut here ]------------
[    4.638795] gcc_mdss_mdp_clk status stuck at 'off'
[    4.638835] WARNING: CPU: 1 PID: 260 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    4.648004] Modules linked in: adv7511(+) coresight_replicator cec coresight_stm coresight_tpiu coresight_funnel coresight_cti stm_core coresight snd_soc_msm8916_digital snd_soc_apq8016_sbc snd_soc_qcom_common soundwire_bus qrtr snd_soc_lpass_apq8016 snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_msm8916_analog qcom_spmi_vadc qcom_vadc_common qcom_q6v5_mss qcom_pon qcom_spmi_temp_alarm rtc_pm8xxx qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_camss videobuf2_dma_sg v4l2_fwnode msm venus_core v4l2_async v4l2_mem2mem videobuf2_memops videobuf2_v4l2 qcom_glink_smem llcc_qcom videobuf2_common ocmem qmi_helpers mdt_loader qnoc_msm8916 videodev gpu_sched qcom_rng drm_dp_aux_bus qcom_stats mc drm_display_helper i2c_qcom_cci display_connector drm_kms_helper icc_smd_rpm rpmsg_ctrl rpmsg_char drm socinfo rmtfs_mem
[    4.706914] CPU: 1 PID: 260 Comm: udevd Tainted: G      D W          6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    4.729082] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    4.739144] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.745827] pc : clk_branch_toggle+0x194/0x1b8
[    4.752506] lr : clk_branch_toggle+0x194/0x1b8
[    4.757020] sp : ffff80000c25b530
[    4.761446] x29: ffff80000c25b530 x28: ffff80000afe9c90 x27: ffff00000db94480
[    4.764838] x26: ffff8000444b6000 x25: ffff80000a6fce40 x24: 0000000000000000
[    4.771957] x23: ffff80000b184f18 x22: ffff80000877bfa8 x21: 0000000000000001
[    4.779074] x20: 0000000000000000 x19: ffff80000a7ea000 x18: ffffffffffffffff
[    4.786192] x17: 0000000000000000 x16: ffff800008736a60 x15: 000000000000029f
[    4.793310] x14: ffff80000c25b2f0 x13: 00000000ffffffea x12: ffff80000b073228
[    4.800429] x11: 0000000000000001 x10: 0000000000000001 x9 : ffff80000b05b240
[    4.807547] x8 : c0000000ffffefff x7 : 0000000000017fe8 x6 : ffff80000b05b1e8
[    4.814664] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 00000000ffffefff
[    4.821782] x2 : ffff80000b003138 x1 : b07c09de59c9c000 x0 : 0000000000000000
[    4.828902] Call trace:
[    4.836009]  clk_branch_toggle+0x194/0x1b8
[    4.838269]  clk_branch2_enable+0x1c/0x28
[    4.842436]  clk_core_enable+0x78/0xc0
[    4.846516]  clk_core_enable_lock+0x24/0x48
[    4.850161]  clk_enable+0x18/0x30
[    4.854240]  mdp5_enable+0x100/0x198 [msm]
[    4.857715]  mdp5_kms_init+0x49c/0x818 [msm]
[    4.861708]  msm_drm_bind+0x1d8/0x638 [msm]
[    4.866135]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    4.870043]  __component_add+0xa8/0x180
[    4.875595]  component_add+0x14/0x20
[    4.879241]  dsi_dev_attach+0x20/0x30 [msm]
[    4.883061]  dsi_host_attach+0xa0/0x140 [msm]
[    4.886969]  devm_mipi_dsi_attach+0x3c/0xa8
[    4.891482]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    4.895476]  adv7511_probe+0x8ac/0x908 [adv7511]
[    4.900684]  i2c_device_probe+0x35c/0x378
[    4.905283]  really_probe+0xc0/0x2b8
[    4.909189]  __driver_probe_device+0x7c/0xe8
[    4.912835]  driver_probe_device+0x38/0x118
[    4.917088]  __driver_attach+0xa8/0x138
[    4.920995]  bus_for_each_dev+0x7c/0xd8
[    4.924814]  driver_attach+0x24/0x30
[    4.928634]  bus_add_driver+0x15c/0x210
[    4.932453]  driver_register+0x64/0x120
[    4.936011]  i2c_register_driver+0x48/0xb0
[    4.939831]  adv7511_init+0x48/0x1000 [adv7511]
[    4.943999]  do_one_initcall+0x60/0x1f0
[    4.948424]  do_init_module+0x48/0x1a8
[    4.952244]  load_module+0x183c/0x1b28
[    4.956064]  __do_sys_finit_module+0xc4/0x118
[    4.959797]  __arm64_sys_finit_module+0x20/0x30
[    4.964225]  invoke_syscall+0x44/0x100
[    4.968563]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.972385]  do_el0_svc+0x2c/0xc8
[    4.977157]  el0_svc+0x20/0x60
[    4.980454]  el0t_64_sync_handler+0x98/0xc0
[    4.983408]  el0t_64_sync+0x170/0x174
[    4.987488] ---[ end trace 0000000000000000 ]---

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.BF.3.0-00288
S - IMAGE_VARIANT_STRING=HAAAANAZA
S - OEM_IMAGE_VERSION_STRING=CRM
S - Boot Config, 0x000002e1
S - Core 0 Frequency, 0 MHz
B -      1545 - PBL, Start
B -      3490 - bootable_media_detect_entry, Start
B -    160640 - bootable_media_detect_success, Start
B -    160645 - elf_loader_entry, Start
B -    162208 - auth_hash_seg_entry, Start
B -    162418 - auth_hash_seg_exit, Start
B -    178595 - elf_segs_hash_verify_entry, Start
B -    239186 - PBL, End
B -    245708 - SBL1, Start
B -    308355 - pm_device_init, Start
D -     14762 - pm_device_init, Delta
B -    323544 - boot_flash_init, Start
D -         0 - boot_flash_init, Delta
B -    327570 - boot_config_data_table_init, Start
D -     31659 - boot_config_data_table_init, Delta - (452 Bytes)
B -    363804 - CDT version:3,Platform ID:24,Major ID:1,Minor ID:0,Subtype:0
B -    370056 - sbl1_ddr_set_params, Start
B -    373838 - cpr_init, Start
D -         0 - cpr_init, Delta
B -    379450 - Pre_DDR_clock_init, Start
D -       183 - Pre_DDR_clock_init, Delta
D -         0 - sbl1_ddr_set_params, Delta
B -    392077 - pm_driver_init, Start
D -      3477 - pm_driver_init, Delta
B -    404155 - SBC platform detected: XO_ADJ_FINE = 0x20
B -    404216 - clock_init, Start
D -        61 - clock_init, Delta
B -    421540 - Image Load, Start
D -     24430 - QSEE Image Loaded, Delta - (571664 Bytes)
B -    445971 - Image Load, Start
D -       213 - SEC Image Loaded, Delta - (2048 Bytes)
B -    453199 - sbl1_efs_handle_cookies, Start
D -       335 - sbl1_efs_handle_cookies, Delta
B -    460977 - Image Load, Start
D -     12078 - QHEE Image Loaded, Delta - (56048 Bytes)
B -    473085 - Image Load, Start
D -     13512 - RPM Image Loaded, Delta - (149316 Bytes)
B -    486627 - Image Load, Start
D -     13664 - APPSBL Image Loaded, Delta - (519728 Bytes)
B -    500322 - QSEE Execution, Start
D -        61 - QSEE Execution, Delta
B -    506025 - SBL1, End
D -    262666 - SBL1, Delta
S - Flash Throughput, 121000 KB/s  (1299256 Bytes,  10705 us)
S - DDR Frequency, 400 MHz
Android Bootloader - UART_DM Initialized!!!
[0] [0] BUILD_VERSION=
[0] [0] BUILD_DATE=15:18:29 - Dec  5 2021
[0] [0] welcome to lk

[10] [10] platform_init()
[10] [10] target_init()
[40] [40] SDHC Running in HS200 mode
[70] [70] Done initialization of the card
[70] [70] pm8x41_get_is_cold_boot: Warm boot
[570] [570] Neither 'config' nor 'frp' partition found
[580] [580] Not able to search the panel:
[580] [580] Display not enabled for 24 HW type
[580] [580] Target panel init not found!
[590] [590] pm8x41_get_is_cold_boot: Warm boot
[590] [590] partition misc doesn't exist
[600] [600] error in emmc_recovery_init
[600] [600] Unable to locate /bootselect partition
[600] [600] No 'misc' partition found
[610] [610] Error reading MISC partition
[610] [610] failed to get ffbm cookie[610] [610] Loading boot image (40099840): start
[1010] [1010] Loading boot image (40099840): done
[1010] [1010] use_signed_kernel=0, is_unlocked=0, is_tampered=0.
[2130] [2130] qcom,msm-id entry not found
[2130] [2130] Only one appended non-skales DTB, select it.
[2140] [2140] target_display_panel_node:510: hw_id=24 panel_name=""
[2140] [2140] cmdline: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[2160] [2160] Updating device tree: start
[2240] [2240] Setting WLAN mac address in DT: 02:00:5D:40:03:75
[2270] [2270] Setting Bluetooth BD address in DT: 02:00:5D:40:03:74
[2270] [2270] Setting BT mac address in DT: 02:00:5D:40:03:74
[2280] [2280] Updating device tree: done
[2280] [2280] booting linux @ 0x80080000, ramdisk @ 0x91474800 (19699646), tags/device tree @ 0x85e00000
[2290] [2290] Jumping to kernel via monitor
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 6.1.0-rc2-13606-g8bd1db35ef72-dirty (jesszhan@jesszhan-linux) (aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30) #14 SMP PREEMPT Fri Nov  4 19:49:32 PDT 2022
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b0000 (options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfccda00-0xbfccffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
[    0.000000]   node   0: [mem 0x0000000086000000-0x0000000089efffff]
[    0.000000]   node   0: [mem 0x0000000089f00000-0x000000008e9fffff]
[    0.000000]   node   0: [mem 0x000000008ea00000-0x000000008eafffff]
[    0.000000]   node   0: [mem 0x000000008eb00000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] cma: Reserved 32 MiB at 0x00000000bcc00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: failed to set PC mode: -3
[    0.000000] percpu: Embedded 20 pages/cpu s44840 r8192 d28888 u81920
[    0.000000] pcpu-alloc: s44840 r8192 d28888 u81920 alloc=20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM errata 826319, 827319, 824069, or 819472
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[    0.000000] Unknown kernel command line parameters "copy_modules", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 856604K/1048576K available (16192K kernel code, 3704K rwdata, 24600K rodata, 7552K init, 615K bss, 159204K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.011098] Console: colour dummy device 80x25
[    0.018757] printk: console [tty0] enabled
[    0.023261] printk: bootconsole [msm_serial_dm0] disabled
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 6.1.0-rc2-13606-g8bd1db35ef72-dirty (jesszhan@jesszhan-linux) (aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30) #14 SMP PREEMPT Fri Nov  4 19:49:32 PDT 2022
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b0000 (options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfccda00-0xbfccffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
[    0.000000]   node   0: [mem 0x0000000086000000-0x0000000089efffff]
[    0.000000]   node   0: [mem 0x0000000089f00000-0x000000008e9fffff]
[    0.000000]   node   0: [mem 0x000000008ea00000-0x000000008eafffff]
[    0.000000]   node   0: [mem 0x000000008eb00000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] cma: Reserved 32 MiB at 0x00000000bcc00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: failed to set PC mode: -3
[    0.000000] percpu: Embedded 20 pages/cpu s44840 r8192 d28888 u81920
[    0.000000] pcpu-alloc: s44840 r8192 d28888 u81920 alloc=20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM errata 826319, 827319, 824069, or 819472
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: ignore_loglevel earlycon root=/dev/mmcblk0p14 copy_modules -- androidboot.emmc=true androidboot.serialno=5d400375 androidboot.baseband=apq mdss_mdp.panel=0:dsi:0:
[    0.000000] Unknown kernel command line parameters "copy_modules", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 856604K/1048576K available (16192K kernel code, 3704K rwdata, 24600K rodata, 7552K init, 615K bss, 159204K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.011098] Console: colour dummy device 80x25
[    0.018757] printk: console [tty0] enabled
[    0.023261] printk: bootconsole [msm_serial_dm0] disabled
[    0.027432] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=76800)
[    0.027466] pid_max: default: 32768 minimum: 301
[    0.027565] LSM: Security Framework initializing
[    0.027698] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.027731] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.029682] cblist_init_generic: Setting adjustable number of callback queues.
[    0.029715] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.029821] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.030070] rcu: Hierarchical SRCU implementation.
[    0.030089] rcu: 	Max phase no-delay instances is 1000.
[    0.037460] EFI services will not be available.
[    0.037795] smp: Bringing up secondary CPUs ...
[    0.038555] Detected VIPT I-cache on CPU1
[    0.038694] CPU1: Booted secondary processor 0x0000000001 [0x410fd030]
[    0.039508] Detected VIPT I-cache on CPU2
[    0.039629] CPU2: Booted secondary processor 0x0000000002 [0x410fd030]
[    0.040390] Detected VIPT I-cache on CPU3
[    0.040512] CPU3: Booted secondary processor 0x0000000003 [0x410fd030]
[    0.040606] smp: Brought up 1 node, 4 CPUs
[    0.040688] SMP: Total of 4 processors activated.
[    0.040705] CPU features: detected: 32-bit EL0 Support
[    0.040720] CPU features: detected: 32-bit EL1 Support
[    0.040738] CPU features: detected: CRC32 instructions
[    0.040832] CPU: All CPU(s) started at EL1
[    0.040870] alternatives: applying system-wide alternatives
[    0.042864] devtmpfs: initialized
[    0.056663] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.056725] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.057991] pinctrl core: initialized pinctrl subsystem
[    0.062464] DMI not present or invalid.
[    0.063475] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.064927] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.065281] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.065455] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.065539] audit: initializing netlink subsys (disabled)
[    0.065783] audit: type=2000 audit(0.052:1): state=initialized audit_enabled=0 res=1
[    0.068063] thermal_sys: Registered thermal governor 'step_wise'
[    0.068071] thermal_sys: Registered thermal governor 'power_allocator'
[    0.068164] cpuidle: using governor menu
[    0.068507] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.068641] ASID allocator initialised with 32768 entries
[    0.071823] Serial: AMBA PL011 UART driver
[    0.091648] amba 821000.funnel: Fixing up cyclic dependency with 802000.stm
[    0.091929] amba 824000.replicator: Fixing up cyclic dependency with 820000.tpiu
[    0.092244] amba 825000.etf: Fixing up cyclic dependency with 824000.replicator
[    0.092335] amba 825000.etf: Fixing up cyclic dependency with 821000.funnel
[    0.092589] amba 826000.etr: Fixing up cyclic dependency with 824000.replicator
[    0.092853] amba 841000.funnel: Fixing up cyclic dependency with 821000.funnel
[    0.093850] amba 85c000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094094] amba 85d000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094336] amba 85e000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.094587] amba 85f000.etm: Fixing up cyclic dependency with 841000.funnel
[    0.097934] platform 1800000.clock-controller: Fixing up cyclic dependency with dsi-phy@1a98300 (1a00000.mdss)
[    0.117237] KASLR enabled
[    0.130253] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.130291] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.130313] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
[    0.130331] HugeTLB: 508 KiB vmemmap can be freed for a 32.0 MiB page
[    0.130350] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.130368] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.130388] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
[    0.130406] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.132621] ACPI: Interpreter disabled.
[    0.137110] iommu: Default domain type: Translated 
[    0.137142] iommu: DMA domain TLB invalidation policy: strict mode 
[    0.137475] SCSI subsystem initialized
[    0.137661] libata version 3.00 loaded.
[    0.138086] usbcore: registered new interface driver usbfs
[    0.138152] usbcore: registered new interface driver hub
[    0.138210] usbcore: registered new device driver usb
[    0.139804] pps_core: LinuxPPS API ver. 1 registered
[    0.139825] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.139861] PTP clock support registered
[    0.140044] EDAC MC: Ver: 3.0.0
[    0.140525] CPUidle PSCI: Initialized CPU PM domain topology
[    0.142955] FPGA manager framework
[    0.143070] Advanced Linux Sound Architecture Driver Initialized.
[    0.144140] vgaarb: loaded
[    0.144612] clocksource: Switched to clocksource arch_sys_counter
[    0.144883] VFS: Disk quotas dquot_6.6.0
[    0.144956] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.145191] pnp: PnP ACPI: disabled
[    0.153850] NET: Registered PF_INET protocol family
[    0.154072] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.155512] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
[    0.155614] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.155656] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.155762] TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.156078] TCP: Hash tables configured (established 8192 bind 8192)
[    0.156219] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.156275] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.156469] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.156970] RPC: Registered named UNIX socket transport module.
[    0.156994] RPC: Registered udp transport module.
[    0.157009] RPC: Registered tcp transport module.
[    0.157024] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.157047] PCI: CLS 0 bytes, default 64
[    0.157345] Unpacking initramfs...
[    0.169364] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters available
[    0.170087] kvm [1]: HYP mode not available
[    0.171375] Initialise system trusted keyrings
[    0.171677] workingset: timestamp_bits=42 max_order=18 bucket_order=0
[    0.180982] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.181866] NFS: Registering the id_resolver key type
[    0.181934] Key type id_resolver registered
[    0.181954] Key type id_legacy registered
[    0.182070] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.182095] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.182381] 9p: Installing v9fs 9p2000 file system support
[    0.236533] Key type asymmetric registered
[    0.236577] Asymmetric key parser 'x509' registered
[    0.236723] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.236754] io scheduler mq-deadline registered
[    0.236771] io scheduler kyber registered
[    0.258457] EINJ: ACPI disabled.
[    0.296118] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.300799] SuperH (H)SCI(F) driver initialized
[    0.301881] msm_serial: driver initialized
[    0.312913] loop: module loaded
[    0.314622] megasas: 07.719.03.00-rc1
[    0.320788] spmi spmi-0: PMIC arbiter version v2 (0x20010000)
[    0.330407] gpio gpiochip1: (200f000.spmi:pmic@0:mpps@a000): not an immutable chip, please consider fixing it!
[    0.339161] tun: Universal TUN/TAP device driver, 1.6
[    0.340986] thunder_xcv, ver 1.0
[    0.341066] thunder_bgx, ver 1.0
[    0.341136] nicpf, ver 1.0
[    0.343480] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    0.343511] hns3: Copyright (c) 2017 Huawei Corporation.
[    0.343604] hclge is initializing
[    0.343640] e1000: Intel(R) PRO/1000 Network Driver
[    0.343657] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.343721] e1000e: Intel(R) PRO/1000 Network Driver
[    0.343737] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.343798] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.343816] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.343869] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    0.343887] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.344520] sky2: driver version 1.30
[    0.346698] VFIO - User Level meta-driver version: 0.3
[    0.352708] usbcore: registered new interface driver usb-storage
[    0.373245] usb3503 usb2513: switched to HUB mode
[    0.373290] usb3503 usb2513: usb3503_probe: probed in hub mode
[    0.374166] usbcore: registered new device driver onboard-usb-hub
[    0.379339] i2c_dev: i2c /dev entries driver
[    0.394194] sdhci: Secure Digital Host Controller Interface driver
[    0.394232] sdhci: Copyright(c) Pierre Ossman
[    0.395811] Synopsys Designware Multimedia Card Interface Driver
[    0.397849] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.403605] ledtrig-cpu: registered to indicate activity on CPUs
[    0.407615] usbcore: registered new interface driver usbhid
[    0.407657] usbhid: USB HID core driver
[    0.422936] NET: Registered PF_PACKET protocol family
[    0.423153] 9pnet: Installing 9P2000 support
[    0.423247] Key type dns_resolver registered
[    0.424135] registered taskstats version 1
[    0.424187] Loading compiled-in X.509 certificates
[    0.458791] s3: Bringing 0uV into 375000-375000uV
[    0.459185] s4: Bringing 0uV into 1800000-1800000uV
[    0.459745] l1: Bringing 0uV into 375000-375000uV
[    0.460022] l2: Bringing 0uV into 1200000-1200000uV
[    0.460294] l4: Bringing 0uV into 1750000-1750000uV
[    0.460555] l5: Bringing 0uV into 1750000-1750000uV
[    0.460858] l6: Bringing 0uV into 1800000-1800000uV
[    0.461159] l7: Bringing 0uV into 1750000-1750000uV
[    0.461420] l8: Bringing 0uV into 1750000-1750000uV
[    0.461710] l9: Bringing 0uV into 1750000-1750000uV
[    0.462005] l10: Bringing 0uV into 1750000-1750000uV
[    0.462285] l11: Bringing 0uV into 1750000-1750000uV
[    0.462558] l12: Bringing 0uV into 1750000-1750000uV
[    0.462859] l13: Bringing 0uV into 1750000-1750000uV
[    0.463141] l14: Bringing 0uV into 1750000-1750000uV
[    0.463507] l15: Bringing 0uV into 1750000-1750000uV
[    0.465121] l16: Bringing 0uV into 1750000-1750000uV
[    0.465478] l17: Bringing 0uV into 3300000-3300000uV
[    0.465802] l18: Bringing 0uV into 1750000-1750000uV
[    0.469532] qcom_scm: convention: smc arm 32
[    0.480464] msm_serial 78af000.serial: msm_serial: detected port #1
[    0.480540] msm_serial 78af000.serial: uartclk = 19200000
[    0.480730] 78af000.serial: ttyMSM1 at MMIO 0x78af000 (irq = 25, base_baud = 1200000) is a MSM
[    0.483098] msm_serial 78b0000.serial: msm_serial: detected port #0
[    0.483157] msm_serial 78b0000.serial: uartclk = 7372800
[    0.483279] 78b0000.serial: ttyMSM0 at MMIO 0x78b0000 (irq = 26, base_baud = 460800) is a MSM
[    0.483322] msm_serial: console setup on port #0
[    1.598808] Freeing initrd memory: 19232K
[    1.599953] printk: console [ttyMSM0] enabled
[    1.913482] qcom-iommu 1ef0000.iommu: iommu sec: pgtable size: 94208
[    1.929230] spi_qup 78b7000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
[    1.932367] spi_qup 78b9000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
[    1.989431] i2c_qup 78b6000.i2c: using default clock-frequency 100000
[    1.989494] i2c_qup 78b6000.i2c: 
[    1.989494]  tx channel not available
[    1.997659] i2c_qup 78b8000.i2c: using default clock-frequency 100000
[    2.001676] i2c_qup 78b8000.i2c: 
[    2.001676]  tx channel not available
[    2.009366] i2c 3-0039: Fixing up cyclic dependency with hdmi-out
[    2.017753] i2c_qup 78ba000.i2c: using default clock-frequency 100000
[    2.021284] i2c_qup 78ba000.i2c: 
[    2.021284]  tx channel not available
[    2.044091] sdhci_msm 7864900.mmc: Got CD GPIO
[    2.076706] mmc0: SDHCI controller on 7824900.mmc [7824900.mmc] using ADMA 64-bit
[    2.078678] mmc1: SDHCI controller on 7864900.mmc [7864900.mmc] using ADMA 64-bit
[    2.092557] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.125826] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.153877] mmc0: Card appears overclocked; req 177770000 Hz, actual 177777777 Hz
[    2.153948] mmc0: Card appears overclocked; req 177770000 Hz, actual 177777777 Hz
[    2.165199] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.171080] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    2.176252] ALSA device list:
[    2.181935]   No soundcards found.
[    2.184754] mmc0: new HS200 MMC card at addressà[    2.197482] Freeing unused kernel memory: 7552K
[    2.197837]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
[    2.203041] mmcblk0boot0: mmc0:0001 S10008 4.00 MiB 
[    2.207296] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.208839] mmcblk0boot1: mmc0:0001 S10008 4.00 MiB 
[    2.220849] mmcblk0rpmb: mmc0:0001 S10008 4.00 MiB, chardev (234:0)
[    2.225005] Run /init as init process
[    2.230572]   with arguments:
[    2.234367]     /init
[    2.237303]     copy_modules
[    2.239544]     androidboot.emmc=true
[    2.242515]     androidboot.serialno=5d400375
[    2.246074]     androidboot.baseband=apq
[    2.250412]     mdss_mdp.panel=0:dsi:0:
[    2.253401] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.254392]   with environment:
[    2.265274]     HOME=/
[    2.268274]     TERM=linux
Starting version 250.4-1-gc3aead5+
[    2.907667] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.943521] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.958497] mc: Linux media interface: v0.10
[    2.977229] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    2.989347] videodev: Linux video capture interface: v2.00
[    3.017491] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.037841] adreno 1c00000.gpu: Adding to iommu group 0
[    3.046324] qcom-venus 1d00000.video-codec: Adding to iommu group 1
[    3.046707] platform 1a98000.dsi: Fixing up cyclic dependency with 3-0039
[    3.048826] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.053538] platform 1a98000.dsi: Fixing up cyclic dependency with 1a01000.mdp
[    3.080204] rtc-pm8xxx 200f000.spmi:pmic@0:rtc@6000: registered as rtc0
[    3.080314] rtc-pm8xxx 200f000.spmi:pmic@0:rtc@6000: setting system clock to 1970-01-01T01:00:14 UTC (3614)
[    3.081153] qcom-camss 1b0ac00.camss: Adding to iommu group 2
[    3.102047] spmi-temp-alarm 200f000.spmi:pmic@0:temp-alarm@2400: failed to register sensor
[    3.102852] qcom-camss 1b0ac00.camss: Failed to configure power domains: -17
[    3.109696] input: pm8941_pwrkey as /devices/platform/soc@0/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:pwrkey/input/input1
[    3.110970] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.124793] qcom-camss: probe of 1b0ac00.camss failed with error -17
[    3.145572] msm_mdp 1a01000.mdp: Adding to iommu group 3
[    3.145807] msm_mdp 1a01000.mdp: No interconnect support may cause display underflows!
[    3.150882] input: pm8941_resin as /devices/platform/soc@0/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:resin/input/input2
[    3.179823] apq8016-lpass-cpu 7708000.audio-controller: qcom,lpass-cpu-apq8016 compatible is deprecated
[    3.189858] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.217123] NET: Registered PF_QIPCRTR protocol family
[    3.225079] remoteproc remoteproc0: 4080000.remoteproc is available
[    3.225112] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.248234]  cs_system_cfg: CoreSight Configuration manager initialised
[    3.258949] coresight cti_sys0: CTI initialized
[    3.263831] coresight cti_sys1: CTI initialized
[    3.264564] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.264592] coresight cti_cpu0: CTI initialized
[    3.268967] coresight stm0: STM32 initialized
[    3.280725] adv7511 3-0039: supply dvdd not found, using dummy regulator
[    3.283653] adv7511 3-0039: supply pvdd not found, using dummy regulator
[    3.290589] adv7511 3-0039: supply a2vdd not found, using dummy regulator
[    3.292789] coresight cti_cpu1: CTI initialized
[    3.305611] coresight cti_cpu2: CTI initialized
[    3.309824] coresight cti_cpu3: CTI initialized
[    3.309826] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.310615] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    3.322607] msm_mdp 1a01000.mdp: bound 1a98000.dsi (ops dsi_ops [msm])
[    3.325527] Mem abort info:
[    3.334920] adreno 1c00000.gpu: supply vdd not found, using dummy regulator
[    3.339727]   ESR = 0x0000000096000006
[    3.342400] adreno 1c00000.gpu: supply vddcx not found, using dummy regulator
[    3.344547] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.349206]   EC = 0x25: DABT (current EL), IL = 32 bits
[    3.353526] msm_mdp 1a01000.mdp: bound 1c00000.gpu (ops a3xx_ops [msm])
[    3.360267]   SET = 0, FnV = 0
[    3.367811] ------------[ cut here ]------------
[    3.372812]   EA = 0, S1PTW = 0
[    3.376292] debugfs: Directory 'ci_hdrc.0' with parent 'ulpi' already present!
[    3.379054] gcc_mdss_ahb_clk status stuck at 'off'
[    3.379095] WARNING: CPU: 0 PID: 260 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    3.382206]   FSC = 0x06: level 2 translation fault
[    3.386954] Modules linked in: adv7511(+) cec coresight_tpiu
[    3.389831] Data abort info:
[    3.397112]  coresight_stm coresight_replicator coresight_funnel stm_core
[    3.401900]   ISV = 0, ISS = 0x00000006
[    3.411175]  coresight_cti coresight qrtr snd_soc_msm8916_digital
[    3.415957]   CM = 0, WnR = 0
[    3.421849]  snd_soc_lpass_apq8016 qcom_q6v5_mss snd_soc_lpass_cpu qcom_pil_info
[    3.424726] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008515c000
[    3.431399]  qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem
[    3.435055] [0000000000000000] pgd=0800000084ade003
[    3.441293]  snd_soc_lpass_platform snd_soc_apq8016_sbc snd_soc_qcom_common soundwire_bus
[    3.444251] , p4d=0800000084ade003
[    3.451715]  qmi_helpers qnoc_msm8916 snd_soc_msm8916_analog qcom_spmi_temp_alarm
[    3.458059] , pud=080000008d4d9003
[    3.463779]  qcom_pon qcom_camss qcom_spmi_vadc qcom_vadc_common videobuf2_dma_sg v4l2_fwnode
[    3.468567] , pmd=0000000000000000
[    3.476884]  rtc_pm8xxx venus_core v4l2_mem2mem v4l2_async
[    3.480188] 
[    3.487735]  videobuf2_memops qcom_stats msm mdt_loader
[    3.491049] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
[    3.499628]  llcc_qcom
[    3.502930] Modules linked in:
[    3.508393]  videobuf2_v4l2
[    3.510046]  adv7511(+)
[    3.514995]  videobuf2_common
[    3.521241]  cec
[    3.523673]  qcom_rng
[    3.526709]  coresight_tpiu
[    3.529400]  icc_smd_rpm
[    3.531831]  coresight_stm
[    3.534955]  ocmem
[    3.536865]  coresight_replicator
[    3.539036]  gpu_sched
[    3.541640]  coresight_funnel
[    3.544418]  drm_dp_aux_bus
[    3.546934]  stm_core
[    3.548932]  i2c_qcom_cci
[    3.552316]  coresight_cti
[    3.554575]  drm_display_helper
[    3.557612]  coresight
[    3.560216]  videodev
[    3.562647]  qrtr
[    3.565252]  mc
[    3.567855]  snd_soc_msm8916_digital
[    3.570893]  rpmsg_ctrl
[    3.573323]  snd_soc_lpass_apq8016
[    3.575667]  rpmsg_char
[    3.577576]  qcom_q6v5_mss
[    3.579142]  display_connector
[    3.582958]  snd_soc_lpass_cpu
[    3.585131]  drm_kms_helper
[    3.588600]  qcom_pil_info
[    3.590946]  socinfo
[    3.593724]  qcom_q6v5
[    3.596762]  drm
[    3.599799]  qcom_sysmon
[    3.602491]  rmtfs_mem
[    3.605267]  qcom_common
[    3.607611] 
[    3.609781]  qcom_glink_smem
[    3.611781] CPU: 0 PID: 260 Comm: udevd Not tainted 6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    3.614296]  snd_soc_lpass_platform
[    3.616467] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    3.619156]  snd_soc_apq8016_sbc
[    3.620635] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.623504]  snd_soc_qcom_common
[    3.631571] pc : clk_branch_toggle+0x194/0x1b8
[    3.635048]  soundwire_bus
[    3.641988] lr : clk_branch_toggle+0x194/0x1b8
[    3.645205]  qmi_helpers
[    3.651883] sp : ffff80000c233530
[    3.655357]  qnoc_msm8916
[    3.659608] x29: ffff80000c233530
[    3.662301]  snd_soc_msm8916_analog
[    3.666727]  x28: ffff80000afe9c90
[    3.669419]  qcom_spmi_temp_alarm
[    3.672629]  x27: ffff000011b41980
[    3.675235]  qcom_pon
[    3.678532] 
[    3.681832]  qcom_camss
[    3.685304] x26: ffff80000cc83000
[    3.688690]  qcom_spmi_vadc
[    3.691986]  x25: ffff80000a6fcea0
[    3.694329]  qcom_vadc_common
[    3.695893]  x24: 0000000000000000
[    3.698064]  videobuf2_dma_sg
[    3.701535] 
[    3.704142]  v4l2_fwnode
[    3.707612] x23: ffff80000b185118
[    3.710651]  rtc_pm8xxx
[    3.713949]  x22: ffff80000877bfa8
[    3.716986]  venus_core
[    3.718550]  x21: 0000000000000001
[    3.721068]  v4l2_mem2mem
[    3.724278] 
[    3.726536]  v4l2_async
[    3.730007] x20: 0000000000000000
[    3.732353]  videobuf2_memops
[    3.735823]  x19: ffff80000a7ea000
[    3.738514]  qcom_stats
[    3.740076]  x18: ffffffffffffffff
[    3.742248]  msm
[    3.745720] 
[    3.748671]  mdt_loader
[    3.751969] x17: 00000000fe815820
[    3.754315]  llcc_qcom
[    3.757784]  x16: 00000000a147d1a6
[    3.759781]  videobuf2_v4l2
[    3.761258]  x15: ffff80000b003218
[    3.763429]  videobuf2_common
[    3.766899] 
[    3.769157]  qcom_rng
[    3.772543] x14: 0000000000000000
[    3.775234]  icc_smd_rpm
[    3.778706]  x13: 6f27207461206b63
[    3.781743]  ocmem
[    3.783306]  x12: 7574732073757461
[    3.785478]  gpu_sched
[    3.788776] 
[    3.791380]  drm_dp_aux_bus
[    3.794590] x11: 0000000005f5e0ff
[    3.796588]  i2c_qcom_cci
[    3.799973]  x10: 0000000000000027
[    3.802316]  drm_display_helper
[    3.803966]  x9 : ffff80000c233530
[    3.806484]  videodev
[    3.809956] 
[    3.812561]  mc
[    3.815858] x8 : ffff80000b0031e8
[    3.818897]  rpmsg_ctrl
[    3.822368]  x7 : ffff80000c233340
[    3.824711]  rpmsg_char
[    3.826274]  x6 : ffff80000b05b240
[    3.827752]  display_connector
[    3.831223] 
[    3.833481]  drm_kms_helper
[    3.836951] x5 : 0000000000000000
[    3.839296]  socinfo
[    3.842769]  x4 : 0000000000000000
[    3.845806]  drm
[    3.847455]  x3 : 00000000ffffffff
[    3.849973]  rmtfs_mem
[    3.853445] 
[    3.855703] 
[    3.858913] x2 : ffff80000b003138
[    3.860913] CPU: 3 PID: 251 Comm: udevd Not tainted 6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    3.864121]  x1 : 8e6782fb2aa51200
[    3.866465] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    3.868114]  x0 : 0000000000000000
[    3.869594] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.872809] 
[    3.880964] pc : sysfs_kf_seq_show+0x34/0x140
[    3.884441] Call trace:
[    3.891294] lr : kernfs_seq_show+0x2c/0x38
[    3.894511]  clk_branch_toggle+0x194/0x1b8
[    3.901360] sp : ffff80000b633c20
[    3.903101]  clk_branch2_enable+0x1c/0x28
[    3.907352] x29: ffff80000b633c20
[    3.909611]  clk_core_enable+0x78/0xc0
[    3.913777]  x28: 0000000000000001
[    3.917855]  clk_core_enable_lock+0x24/0x48
[    3.921242]  x27: 0000000000400cc0
[    3.925234]  clk_enable+0x18/0x30
[    3.928533] 
[    3.932179]  mdp5_enable+0xb0/0x198 [msm]
[    3.935565] x26: 000000007ffff000
[    3.939644]  mdp5_kms_init+0x49c/0x818 [msm]
[    3.943116]  x25: ffff000012008038
[    3.946500]  msm_drm_bind+0x1d8/0x638 [msm]
[    3.948065]  x24: ffff000012008028
[    3.951971]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    3.955271] 
[    3.959610]  __component_add+0xa8/0x180
[    3.962822] x23: 0000000000000000
[    3.966901]  component_add+0x14/0x20
[    3.970375]  x22: ffff0000121086e8
[    3.975840]  dsi_dev_attach+0x20/0x30 [msm]
[    3.977405]  x21: ffff00001232d800
[    3.980965]  dsi_host_attach+0xa0/0x140 [msm]
[    3.984436] 
[    3.984438] x20: 0000000000000000
[    3.988081]  devm_mipi_dsi_attach+0x3c/0xa8
[    3.991294]  x19: ffff000012008000
[    3.995374]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    3.998846]  x18: 0000000000000000
[    4.003271]  adv7511_probe+0x8ac/0x908 [adv7511]
[    4.004834] 
[    4.008048]  i2c_device_probe+0x35c/0x378
[    4.012039] x17: 0000000000000000
[    4.015515]  really_probe+0xc0/0x2b8
[    4.020634]  x16: 0000000000000000
[    4.023848]  __driver_probe_device+0x7c/0xe8
[    4.028617]  x15: 0000000000000000
[    4.030097]  driver_probe_device+0x38/0x118
[    4.034001] 
[    4.037301]  __driver_attach+0xa8/0x138
[    4.040946] x14: 0000000000000000
[    4.044159]  bus_for_each_dev+0x7c/0xd8
[    4.048585]  x13: 0000000000000000
[    4.051798]  driver_attach+0x24/0x30
[    4.055875]  x12: 0000000000000000
[    4.057613]  bus_add_driver+0x15c/0x210
[    4.061171] 
[    4.064645]  driver_register+0x64/0x120
[    4.068290] x11: 0000000000000000
[    4.071763]  i2c_register_driver+0x48/0xb0
[    4.075494]  x10: 0000000000000000
[    4.078706]  adv7511_init+0x48/0x1000 [adv7511]
[    4.082437]  x9 : 0000000000000000
[    4.084176]  do_one_initcall+0x60/0x1f0
[    4.087734] 
[    4.091208]  do_init_module+0x48/0x1a8
[    4.095199] x8 : 00000000ffffffff
[    4.098587]  load_module+0x183c/0x1b28
[    4.103011]  x7 : ffff0000120ebb00
[    4.106485]  __do_sys_finit_module+0xc4/0x118
[    4.110214]  x6 : 0000000000000000
[    4.111954]  __arm64_sys_finit_module+0x20/0x30
[    4.115512] 
[    4.118899]  invoke_syscall+0x44/0x100
[    4.122544] x5 : 0000000000000000
[    4.125929]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.130356]  x4 : 0000000000000001
[    4.133656]  do_el0_svc+0x2c/0xc8
[    4.138079]  x3 : ffff00001232d800
[    4.139819]  el0_svc+0x20/0x60
[    4.143376] 
[    4.146764]  el0t_64_sync_handler+0x98/0xc0
[    4.151450] x2 : ffff8000083dbee0
[    4.154748]  el0t_64_sync+0x170/0x174
[    4.158134]  x1 : 0000000000000000
[    4.161432] ---[ end trace 0000000000000000 ]---
[    4.164468]  x0 : ffff000012008000
[    4.166542] ------------[ cut here ]------------
[    4.170025] 
[    4.170028] Call trace:
[    4.170031]  sysfs_kf_seq_show+0x34/0x140
[    4.173499] gcc_mdss_axi_clk status stuck at 'off'
[    4.177144]  kernfs_seq_show+0x2c/0x38
[    4.180479] WARNING: CPU: 0 PID: 260 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    4.185218]  seq_read_iter+0xe0/0x458
[    4.188431] Modules linked in:
[    4.193201]  kernfs_fop_read_iter+0x140/0x1d8
[    4.194679]  adv7511(+)
[    4.196850]  vfs_read+0x22c/0x2b8
[    4.201017]  cec
[    4.205704]  ksys_read+0x6c/0x100
[    4.209443]  coresight_tpiu
[    4.218725]  __arm64_sys_read+0x1c/0x28
[    4.222457]  coresight_stm
[    4.225410]  invoke_syscall+0x44/0x100
[    4.229833]  coresight_replicator
[    4.232092]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.235564]  coresight_funnel
[    4.237475]  do_el0_svc+0x2c/0xc8
[    4.240684]  stm_core
[    4.243290]  el0_svc+0x20/0x60
[    4.247108]  coresight_cti
[    4.249888]  el0t_64_sync_handler+0x98/0xc0
[    4.253620]  coresight
[    4.257006]  el0t_64_sync+0x170/0x174
[    4.261693]  qrtr
[    4.264651] Code: f9403036 f94016c1 b4000041 f9400434 (f9400281) 
[    4.267941]  snd_soc_msm8916_digital
[    4.270201] ---[ end trace 0000000000000000 ]---
[    4.273151]  snd_soc_lpass_apq8016 qcom_q6v5_mss snd_soc_lpass_cpu qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem snd_soc_lpass_platform snd_soc_apq8016_sbc snd_soc_qcom_common soundwire_bus qmi_helpers qnoc_msm8916 snd_soc_msm8916_analog qcom_spmi_temp_alarm qcom_pon qcom_camss qcom_spmi_vadc qcom_vadc_common videobuf2_dma_sg v4l2_fwnode rtc_pm8xxx venus_core v4l2_mem2mem v4l2_async videobuf2_memops qcom_stats msm mdt_loader llcc_qcom videobuf2_v4l2 videobuf2_common qcom_rng icc_smd_rpm ocmem gpu_sched drm_dp_aux_bus i2c_qcom_cci drm_display_helper videodev mc rpmsg_ctrl rpmsg_char display_connector drm_kms_helper socinfo drm rmtfs_mem
[    4.337885] CPU: 0 PID: 260 Comm: udevd Tainted: G      D W          6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    4.360067] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    4.369956] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.376639] pc : clk_branch_toggle+0x194/0x1b8
[    4.383316] lr : clk_branch_toggle+0x194/0x1b8
[    4.387831] sp : ffff80000c233530
[    4.392257] x29: ffff80000c233530 x28: ffff80000afe9c90 x27: ffff000011b41980
[    4.395650] x26: ffff80000cc83000 x25: ffff80000a6fce88 x24: 0000000000000000
[    4.402768] x23: ffff80000b185098 x22: ffff80000877bfa8 x21: 0000000000000001
[    4.409886] x20: 0000000000000000 x19: ffff80000a7ea000 x18: ffffffffffffffff
[    4.417003] x17: 00000000fe815820 x16: 00000000a147d1a6 x15: ffff80000a7eabd8
[    4.424122] x14: 0000000000000000 x13: 2d2d2d5d20303030 x12: 3030303030303030
[    4.431240] x11: 3030303030206563 x10: 0000000000000004 x9 : 000000000000000a
[    4.438357] x8 : 0000000000000000 x7 : 0000000000000001 x6 : 0000000000000035
[    4.445475] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
[    4.452593] x2 : ffff80000b003138 x1 : 8e6782fb2aa51200 x0 : 0000000000000000
[    4.459713] Call trace:
[    4.466821]  clk_branch_toggle+0x194/0x1b8
[    4.469081]  clk_branch2_enable+0x1c/0x28
[    4.473247]  clk_core_enable+0x78/0xc0
[    4.477326]  clk_core_enable_lock+0x24/0x48
[    4.480973]  clk_enable+0x18/0x30
[    4.485052]  mdp5_enable+0xd8/0x198 [msm]
[    4.488526]  mdp5_kms_init+0x49c/0x818 [msm]
[    4.492520]  msm_drm_bind+0x1d8/0x638 [msm]
[    4.496860]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    4.500768]  __component_add+0xa8/0x180
[    4.506320]  component_add+0x14/0x20
[    4.509966]  dsi_dev_attach+0x20/0x30 [msm]
[    4.513786]  dsi_host_attach+0xa0/0x140 [msm]
[    4.517693]  devm_mipi_dsi_attach+0x3c/0xa8
[    4.522205]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    4.526201]  adv7511_probe+0x8ac/0x908 [adv7511]
[    4.531408]  i2c_device_probe+0x35c/0x378
[    4.536007]  really_probe+0xc0/0x2b8
[    4.539913]  __driver_probe_device+0x7c/0xe8
[    4.543560]  driver_probe_device+0x38/0x118
[    4.547813]  __driver_attach+0xa8/0x138
[    4.551718]  bus_for_each_dev+0x7c/0xd8
[    4.555539]  driver_attach+0x24/0x30
[    4.559357]  bus_add_driver+0x15c/0x210
[    4.563177]  driver_register+0x64/0x120
[    4.566736]  i2c_register_driver+0x48/0xb0
[    4.570556]  adv7511_init+0x48/0x1000 [adv7511]
[    4.574724]  do_one_initcall+0x60/0x1f0
[    4.579149]  do_init_module+0x48/0x1a8
[    4.582969]  load_module+0x183c/0x1b28
[    4.586788]  __do_sys_finit_module+0xc4/0x118
[    4.590523]  __arm64_sys_finit_module+0x20/0x30
[    4.594950]  invoke_syscall+0x44/0x100
[    4.599287]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.603109]  do_el0_svc+0x2c/0xc8
[    4.607881]  el0_svc+0x20/0x60
[    4.611179]  el0t_64_sync_handler+0x98/0xc0
[    4.614133]  el0t_64_sync+0x170/0x174
[    4.618212] ---[ end trace 0000000000000000 ]---
[    4.622424] ------------[ cut here ]------------
[    4.626725] gcc_mdss_mdp_clk status stuck at 'off'
[    4.626766] WARNING: CPU: 0 PID: 260 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x194/0x1b8
[    4.635933] Modules linked in: adv7511(+) cec coresight_tpiu coresight_stm coresight_replicator coresight_funnel stm_core coresight_cti coresight qrtr snd_soc_msm8916_digital snd_soc_lpass_apq8016 qcom_q6v5_mss snd_soc_lpass_cpu qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem snd_soc_lpass_platform snd_soc_apq8016_sbc snd_soc_qcom_common soundwire_bus qmi_helpers qnoc_msm8916 snd_soc_msm8916_analog qcom_spmi_temp_alarm qcom_pon qcom_camss qcom_spmi_vadc qcom_vadc_common videobuf2_dma_sg v4l2_fwnode rtc_pm8xxx venus_core v4l2_mem2mem v4l2_async videobuf2_memops qcom_stats msm mdt_loader llcc_qcom videobuf2_v4l2 videobuf2_common qcom_rng icc_smd_rpm ocmem gpu_sched drm_dp_aux_bus i2c_qcom_cci drm_display_helper videodev mc rpmsg_ctrl rpmsg_char display_connector drm_kms_helper socinfo drm rmtfs_mem
[    4.694842] CPU: 0 PID: 260 Comm: udevd Tainted: G      D W          6.1.0-rc2-13606-g8bd1db35ef72-dirty #14
[    4.717011] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    4.727074] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.733756] pc : clk_branch_toggle+0x194/0x1b8
[    4.740435] lr : clk_branch_toggle+0x194/0x1b8
[    4.744949] sp : ffff80000c233530
[    4.749373] x29: ffff80000c233530 x28: ffff80000afe9c90 x27: ffff000011b41980
[    4.752768] x26: ffff80000cc83000 x25: ffff80000a6fce40 x24: 0000000000000000
[    4.759886] x23: ffff80000b184f18 x22: ffff80000877bfa8 x21: 0000000000000001
[    4.767003] x20: 0000000000000000 x19: ffff80000a7ea000 x18: ffffffffffffffff
[    4.774122] x17: 00000000fe815820 x16: 00000000a147d1a6 x15: 00000000000002a0
[    4.781239] x14: ffff80000c2332f0 x13: 00000000ffffffea x12: ffff80000b073228
[    4.788358] x11: 0000000000000001 x10: 0000000000000001 x9 : ffff80000b05b240
[    4.795476] x8 : c0000000ffffefff x7 : 0000000000017fe8 x6 : ffff80000b05b1e8
[    4.802593] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 00000000ffffefff
[    4.809711] x2 : ffff80000b003138 x1 : 8e6782fb2aa51200 x0 : 0000000000000000
[    4.816830] Call trace:
[    4.823938]  clk_branch_toggle+0x194/0x1b8
[    4.826199]  clk_branch2_enable+0x1c/0x28
[    4.830364]  clk_core_enable+0x78/0xc0
[    4.834444]  clk_core_enable_lock+0x24/0x48
[    4.838090]  clk_enable+0x18/0x30
[    4.842169]  mdp5_enable+0x100/0x198 [msm]
[    4.845644]  mdp5_kms_init+0x49c/0x818 [msm]
[    4.849638]  msm_drm_bind+0x1d8/0x638 [msm]
[    4.854065]  try_to_bring_up_aggregate_device+0x17c/0x1e8
[    4.857972]  __component_add+0xa8/0x180
[    4.863524]  component_add+0x14/0x20
[    4.867170]  dsi_dev_attach+0x20/0x30 [msm]
[    4.870992]  dsi_host_attach+0xa0/0x140 [msm]
[    4.874898]  devm_mipi_dsi_attach+0x3c/0xa8
[    4.879411]  adv7533_attach_dsi+0x98/0x118 [adv7511]
[    4.883405]  adv7511_probe+0x8ac/0x908 [adv7511]
[    4.888615]  i2c_device_probe+0x35c/0x378
[    4.893212]  really_probe+0xc0/0x2b8
[    4.897117]  __driver_probe_device+0x7c/0xe8
[    4.900765]  driver_probe_device+0x38/0x118
[    4.905017]  __driver_attach+0xa8/0x138
[    4.908923]  bus_for_each_dev+0x7c/0xd8
[    4.912744]  driver_attach+0x24/0x30
[    4.916561]  bus_add_driver+0x15c/0x210
[    4.920382]  driver_register+0x64/0x120
[    4.923941]  i2c_register_driver+0x48/0xb0
[    4.927760]  adv7511_init+0x48/0x1000 [adv7511]
[    4.931928]  do_one_initcall+0x60/0x1f0
[    4.936354]  do_init_module+0x48/0x1a8
[    4.940174]  load_module+0x183c/0x1b28
[    4.943992]  __do_sys_finit_module+0xc4/0x118
[    4.947727]  __arm64_sys_finit_module+0x20/0x30
[    4.952155]  invoke_syscall+0x44/0x100
[    4.956493]  el0_svc_common.constprop.3+0x6c/0xf0
[    4.960315]  do_el0_svc+0x2c/0xc8
[    4.965086]  el0_svc+0x20/0x60
[    4.968384]  el0t_64_sync_handler+0x98/0xc0
[    4.971337]  el0t_64_sync+0x170/0x174
[    4.975417] ---[ end trace 0000000000000000 ]---

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.BF.3.0-00288
S - IMAGE_VARIANT_STRING=HAAAANAZA
S - OEM_IMAGE_VERSION_STRING=CRM
S - Boot Config, 0x000002e1
S - Core 0 Frequency, 0 MHz
B -      1545 - PBL, Start
B -      3490 - bootable_media_detect_entry, Start
B -    155362 - bootable_media_detect_success, Start
B -    155367 - elf_loader_entry, Start
B -    156929 - auth_hash_seg_entry, Start
B -    157139 - auth_hash_seg_exit, Start
B -    173341 - elf_segs_hash_verify_entry, Start
B -    233922 - PBL, End
B -    240462 - SBL1, Start
B -    303109 - pm_device_init, Start
D -     14792 - pm_device_init, Delta
B -    318298 - boot_flash_init, Start
D -        30 - boot_flash_init, Delta
B -    322293 - boot_config_data_table_init, Start
D -     31628 - boot_config_data_table_init, Delta - (452 Bytes)
B -    358527 - CDT version:3,Platform ID:24,Major ID:1,Minor ID:0,Subtype:0
B -    364749 - sbl1_ddr_set_params, Start
B -    368562 - cpr_init, Start
D -         0 - cpr_init, Delta
B -    374174 - Pre_DDR_clock_init, Start
D -       183 - Pre_DDR_clock_init, Delta
D -         0 - sbl1_ddr_set_params, Delta
B -    386801 - pm_driver_init, Start
D -      3477 - pm_driver_init, Delta
B -    398909 - SBC platform detected: XO_ADJ_FINE = 0x20
B -    398940 - clock_init, Start
D -        30 - clock_init, Delta
B -    416264 - Image Load, Start
D -     24278 - QSEE Image Loaded, Delta - (571664 Bytes)
B -    440572 - Image Load, Start
D -       213 - SEC Image Loaded, Delta - (2048 Bytes)
B -    447801 - sbl1_efs_handle_cookies, Start
D -       305 - sbl1_efs_handle_cookies, Delta
B -    455548 - Image Load, Start
--------------hECn0Gqn7zl1YaMJg36Sy4Qd
Content-Type: text/plain; charset="UTF-8"; name=".config"
Content-Disposition: attachment; filename=".config"
Content-Transfer-Encoding: base64

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4
L2FybTY0IDYuMS4wLXJjMiBLZXJuZWwgQ29uZmlndXJhdGlvbgojCkNPTkZJR19DQ19WRVJT
SU9OX1RFWFQ9ImFhcmNoNjQtbGludXgtZ251LWdjYyAoVWJ1bnR1L0xpbmFybyA3LjUuMC0z
dWJ1bnR1MX4xOC4wNCkgNy41LjAiCkNPTkZJR19DQ19JU19HQ0M9eQpDT05GSUdfR0NDX1ZF
UlNJT049NzA1MDAKQ09ORklHX0NMQU5HX1ZFUlNJT049MApDT05GSUdfQVNfSVNfR05VPXkK
Q09ORklHX0FTX1ZFUlNJT049MjMwMDAKQ09ORklHX0xEX0lTX0JGRD15CkNPTkZJR19MRF9W
RVJTSU9OPTIzMDAwCkNPTkZJR19MTERfVkVSU0lPTj0wCkNPTkZJR19DQ19DQU5fTElOSz15
CkNPTkZJR19DQ19DQU5fTElOS19TVEFUSUM9eQpDT05GSUdfQ0NfSEFTX0FTTV9JTkxJTkU9
eQpDT05GSUdfQ0NfSEFTX05PX1BST0ZJTEVfRk5fQVRUUj15CkNPTkZJR19QQUhPTEVfVkVS
U0lPTj0wCkNPTkZJR19JUlFfV09SSz15CkNPTkZJR19CVUlMRFRJTUVfVEFCTEVfU09SVD15
CkNPTkZJR19USFJFQURfSU5GT19JTl9UQVNLPXkKCiMKIyBHZW5lcmFsIHNldHVwCiMKQ09O
RklHX0lOSVRfRU5WX0FSR19MSU1JVD0zMgojIENPTkZJR19DT01QSUxFX1RFU1QgaXMgbm90
IHNldAojIENPTkZJR19XRVJST1IgaXMgbm90IHNldApDT05GSUdfTE9DQUxWRVJTSU9OPSIi
CkNPTkZJR19MT0NBTFZFUlNJT05fQVVUTz15CkNPTkZJR19CVUlMRF9TQUxUPSIiCkNPTkZJ
R19ERUZBVUxUX0lOSVQ9IiIKQ09ORklHX0RFRkFVTFRfSE9TVE5BTUU9Iihub25lKSIKQ09O
RklHX1NZU1ZJUEM9eQpDT05GSUdfU1lTVklQQ19TWVNDVEw9eQpDT05GSUdfU1lTVklQQ19D
T01QQVQ9eQpDT05GSUdfUE9TSVhfTVFVRVVFPXkKQ09ORklHX1BPU0lYX01RVUVVRV9TWVND
VEw9eQojIENPTkZJR19XQVRDSF9RVUVVRSBpcyBub3Qgc2V0CkNPTkZJR19DUk9TU19NRU1P
UllfQVRUQUNIPXkKIyBDT05GSUdfVVNFTElCIGlzIG5vdCBzZXQKQ09ORklHX0FVRElUPXkK
Q09ORklHX0hBVkVfQVJDSF9BVURJVFNZU0NBTEw9eQpDT05GSUdfQVVESVRTWVNDQUxMPXkK
CiMKIyBJUlEgc3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX1BST0JFPXkKQ09ORklH
X0dFTkVSSUNfSVJRX1NIT1c9eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPV19MRVZFTD15CkNP
TkZJR19HRU5FUklDX0lSUV9FRkZFQ1RJVkVfQUZGX01BU0s9eQpDT05GSUdfR0VORVJJQ19J
UlFfTUlHUkFUSU9OPXkKQ09ORklHX0hBUkRJUlFTX1NXX1JFU0VORD15CkNPTkZJR19HRU5F
UklDX0lSUV9DSElQPXkKQ09ORklHX0lSUV9ET01BSU49eQpDT05GSUdfSVJRX0RPTUFJTl9I
SUVSQVJDSFk9eQpDT05GSUdfSVJRX0ZBU1RFT0lfSElFUkFSQ0hZX0hBTkRMRVJTPXkKQ09O
RklHX0dFTkVSSUNfSVJRX0lQST15CkNPTkZJR19HRU5FUklDX01TSV9JUlE9eQpDT05GSUdf
R0VORVJJQ19NU0lfSVJRX0RPTUFJTj15CkNPTkZJR19JUlFfTVNJX0lPTU1VPXkKQ09ORklH
X0lSUV9GT1JDRURfVEhSRUFESU5HPXkKQ09ORklHX1NQQVJTRV9JUlE9eQojIENPTkZJR19H
RU5FUklDX0lSUV9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVJRIHN1YnN5c3RlbQoK
Q09ORklHX0dFTkVSSUNfVElNRV9WU1lTQ0FMTD15CkNPTkZJR19HRU5FUklDX0NMT0NLRVZF
TlRTPXkKQ09ORklHX0FSQ0hfSEFTX1RJQ0tfQlJPQURDQVNUPXkKQ09ORklHX0dFTkVSSUNf
Q0xPQ0tFVkVOVFNfQlJPQURDQVNUPXkKQ09ORklHX0hBVkVfUE9TSVhfQ1BVX1RJTUVSU19U
QVNLX1dPUks9eQpDT05GSUdfUE9TSVhfQ1BVX1RJTUVSU19UQVNLX1dPUks9eQpDT05GSUdf
Q09OVEVYVF9UUkFDS0lORz15CkNPTkZJR19DT05URVhUX1RSQUNLSU5HX0lETEU9eQoKIwoj
IFRpbWVycyBzdWJzeXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9UPXkKQ09ORklHX05PX0ha
X0NPTU1PTj15CiMgQ09ORklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQKQ09ORklHX05PX0ha
X0lETEU9eQojIENPTkZJR19OT19IWl9GVUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9fSFog
aXMgbm90IHNldApDT05GSUdfSElHSF9SRVNfVElNRVJTPXkKIyBlbmQgb2YgVGltZXJzIHN1
YnN5c3RlbQoKQ09ORklHX0JQRj15CkNPTkZJR19IQVZFX0VCUEZfSklUPXkKQ09ORklHX0FS
Q0hfV0FOVF9ERUZBVUxUX0JQRl9KSVQ9eQoKIwojIEJQRiBzdWJzeXN0ZW0KIwpDT05GSUdf
QlBGX1NZU0NBTEw9eQpDT05GSUdfQlBGX0pJVD15CiMgQ09ORklHX0JQRl9KSVRfQUxXQVlT
X09OIGlzIG5vdCBzZXQKQ09ORklHX0JQRl9KSVRfREVGQVVMVF9PTj15CkNPTkZJR19CUEZf
VU5QUklWX0RFRkFVTFRfT0ZGPXkKIyBDT05GSUdfQlBGX1BSRUxPQUQgaXMgbm90IHNldAoj
IGVuZCBvZiBCUEYgc3Vic3lzdGVtCgpDT05GSUdfUFJFRU1QVF9CVUlMRD15CiMgQ09ORklH
X1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRfVk9MVU5UQVJZIGlz
IG5vdCBzZXQKQ09ORklHX1BSRUVNUFQ9eQpDT05GSUdfUFJFRU1QVF9DT1VOVD15CkNPTkZJ
R19QUkVFTVBUSU9OPXkKIyBDT05GSUdfUFJFRU1QVF9EWU5BTUlDIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NIRURfQ09SRSBpcyBub3Qgc2V0CgojCiMgQ1BVL1Rhc2sgdGltZSBhbmQgc3Rh
dHMgYWNjb3VudGluZwojCkNPTkZJR19USUNLX0NQVV9BQ0NPVU5USU5HPXkKIyBDT05GSUdf
VklSVF9DUFVfQUNDT1VOVElOR19HRU4gaXMgbm90IHNldApDT05GSUdfSVJRX1RJTUVfQUND
T1VOVElORz15CkNPTkZJR19IQVZFX1NDSEVEX0FWR19JUlE9eQpDT05GSUdfU0NIRURfVEhF
Uk1BTF9QUkVTU1VSRT15CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUPXkKQ09ORklHX0JTRF9Q
Uk9DRVNTX0FDQ1RfVjM9eQpDT05GSUdfVEFTS1NUQVRTPXkKIyBDT05GSUdfVEFTS19ERUxB
WV9BQ0NUIGlzIG5vdCBzZXQKQ09ORklHX1RBU0tfWEFDQ1Q9eQpDT05GSUdfVEFTS19JT19B
Q0NPVU5USU5HPXkKIyBDT05GSUdfUFNJIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ1BVL1Rhc2sg
dGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwoKQ09ORklHX0NQVV9JU09MQVRJT049eQoKIwoj
IFJDVSBTdWJzeXN0ZW0KIwpDT05GSUdfVFJFRV9SQ1U9eQpDT05GSUdfUFJFRU1QVF9SQ1U9
eQojIENPTkZJR19SQ1VfRVhQRVJUIGlzIG5vdCBzZXQKQ09ORklHX1NSQ1U9eQpDT05GSUdf
VFJFRV9TUkNVPXkKQ09ORklHX1RBU0tTX1JDVV9HRU5FUklDPXkKQ09ORklHX1RBU0tTX1JD
VT15CkNPTkZJR19UQVNLU19UUkFDRV9SQ1U9eQpDT05GSUdfUkNVX1NUQUxMX0NPTU1PTj15
CkNPTkZJR19SQ1VfTkVFRF9TRUdDQkxJU1Q9eQojIGVuZCBvZiBSQ1UgU3Vic3lzdGVtCgpD
T05GSUdfSUtDT05GSUc9eQpDT05GSUdfSUtDT05GSUdfUFJPQz15CiMgQ09ORklHX0lLSEVB
REVSUyBpcyBub3Qgc2V0CkNPTkZJR19MT0dfQlVGX1NISUZUPTE3CkNPTkZJR19MT0dfQ1BV
X01BWF9CVUZfU0hJRlQ9MTIKQ09ORklHX1BSSU5US19TQUZFX0xPR19CVUZfU0hJRlQ9MTMK
IyBDT05GSUdfUFJJTlRLX0lOREVYIGlzIG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfU0NIRURf
Q0xPQ0s9eQoKIwojIFNjaGVkdWxlciBmZWF0dXJlcwojCiMgQ09ORklHX1VDTEFNUF9UQVNL
IGlzIG5vdCBzZXQKIyBlbmQgb2YgU2NoZWR1bGVyIGZlYXR1cmVzCgpDT05GSUdfQVJDSF9T
VVBQT1JUU19OVU1BX0JBTEFOQ0lORz15CkNPTkZJR19DQ19IQVNfSU5UMTI4PXkKQ09ORklH
X0NDX0lNUExJQ0lUX0ZBTExUSFJPVUdIPSItV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTUiCkNP
TkZJR19HQ0MxMl9OT19BUlJBWV9CT1VORFM9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19JTlQx
Mjg9eQpDT05GSUdfTlVNQV9CQUxBTkNJTkc9eQpDT05GSUdfTlVNQV9CQUxBTkNJTkdfREVG
QVVMVF9FTkFCTEVEPXkKQ09ORklHX0NHUk9VUFM9eQpDT05GSUdfUEFHRV9DT1VOVEVSPXkK
IyBDT05GSUdfQ0dST1VQX0ZBVk9SX0RZTk1PRFMgaXMgbm90IHNldApDT05GSUdfTUVNQ0c9
eQpDT05GSUdfTUVNQ0dfS01FTT15CkNPTkZJR19CTEtfQ0dST1VQPXkKQ09ORklHX0NHUk9V
UF9XUklURUJBQ0s9eQpDT05GSUdfQ0dST1VQX1NDSEVEPXkKQ09ORklHX0ZBSVJfR1JPVVBf
U0NIRUQ9eQojIENPTkZJR19DRlNfQkFORFdJRFRIIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRf
R1JPVVBfU0NIRUQgaXMgbm90IHNldApDT05GSUdfQ0dST1VQX1BJRFM9eQojIENPTkZJR19D
R1JPVVBfUkRNQSBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfRlJFRVpFUj15CkNPTkZJR19D
R1JPVVBfSFVHRVRMQj15CkNPTkZJR19DUFVTRVRTPXkKQ09ORklHX1BST0NfUElEX0NQVVNF
VD15CkNPTkZJR19DR1JPVVBfREVWSUNFPXkKQ09ORklHX0NHUk9VUF9DUFVBQ0NUPXkKQ09O
RklHX0NHUk9VUF9QRVJGPXkKQ09ORklHX0NHUk9VUF9CUEY9eQojIENPTkZJR19DR1JPVVBf
TUlTQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJ
R19TT0NLX0NHUk9VUF9EQVRBPXkKQ09ORklHX05BTUVTUEFDRVM9eQpDT05GSUdfVVRTX05T
PXkKQ09ORklHX1RJTUVfTlM9eQpDT05GSUdfSVBDX05TPXkKQ09ORklHX1VTRVJfTlM9eQpD
T05GSUdfUElEX05TPXkKQ09ORklHX05FVF9OUz15CiMgQ09ORklHX0NIRUNLUE9JTlRfUkVT
VE9SRSBpcyBub3Qgc2V0CkNPTkZJR19TQ0hFRF9BVVRPR1JPVVA9eQojIENPTkZJR19TWVNG
U19ERVBSRUNBVEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVMQVkgaXMgbm90IHNldApDT05G
SUdfQkxLX0RFVl9JTklUUkQ9eQpDT05GSUdfSU5JVFJBTUZTX1NPVVJDRT0iIgpDT05GSUdf
UkRfR1pJUD15CkNPTkZJR19SRF9CWklQMj15CkNPTkZJR19SRF9MWk1BPXkKQ09ORklHX1JE
X1haPXkKQ09ORklHX1JEX0xaTz15CkNPTkZJR19SRF9MWjQ9eQpDT05GSUdfUkRfWlNURD15
CiMgQ09ORklHX0JPT1RfQ09ORklHIGlzIG5vdCBzZXQKQ09ORklHX0lOSVRSQU1GU19QUkVT
RVJWRV9NVElNRT15CkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfUEVSRk9STUFOQ0U9eQojIENP
TkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBpcyBub3Qgc2V0CkNPTkZJR19MRF9PUlBIQU5f
V0FSTj15CkNPTkZJR19TWVNDVEw9eQpDT05GSUdfSEFWRV9VSUQxNj15CkNPTkZJR19TWVND
VExfRVhDRVBUSU9OX1RSQUNFPXkKIyBDT05GSUdfRVhQRVJUIGlzIG5vdCBzZXQKQ09ORklH
X1VJRDE2PXkKQ09ORklHX01VTFRJVVNFUj15CkNPTkZJR19TWVNGU19TWVNDQUxMPXkKQ09O
RklHX0ZIQU5ETEU9eQpDT05GSUdfUE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNP
TkZJR19CVUc9eQpDT05GSUdfRUxGX0NPUkU9eQpDT05GSUdfQkFTRV9GVUxMPXkKQ09ORklH
X0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkKQ09ORklHX0VQT0xMPXkKQ09ORklHX1NJR05B
TEZEPXkKQ09ORklHX1RJTUVSRkQ9eQpDT05GSUdfRVZFTlRGRD15CkNPTkZJR19TSE1FTT15
CkNPTkZJR19BSU89eQpDT05GSUdfSU9fVVJJTkc9eQpDT05GSUdfQURWSVNFX1NZU0NBTExT
PXkKQ09ORklHX01FTUJBUlJJRVI9eQpDT05GSUdfS0FMTFNZTVM9eQpDT05GSUdfS0FMTFNZ
TVNfQUxMPXkKQ09ORklHX0tBTExTWU1TX0JBU0VfUkVMQVRJVkU9eQpDT05GSUdfQVJDSF9I
QVNfTUVNQkFSUklFUl9TWU5DX0NPUkU9eQpDT05GSUdfS0NNUD15CkNPTkZJR19SU0VRPXkK
IyBDT05GSUdfRU1CRURERUQgaXMgbm90IHNldApDT05GSUdfSEFWRV9QRVJGX0VWRU5UUz15
CkNPTkZJR19HVUVTVF9QRVJGX0VWRU5UUz15CgojCiMgS2VybmVsIFBlcmZvcm1hbmNlIEV2
ZW50cyBBbmQgQ291bnRlcnMKIwpDT05GSUdfUEVSRl9FVkVOVFM9eQojIENPTkZJR19ERUJV
R19QRVJGX1VTRV9WTUFMTE9DIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2VybmVsIFBlcmZvcm1h
bmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKCkNPTkZJR19TWVNURU1fREFUQV9WRVJJRklDQVRJ
T049eQpDT05GSUdfUFJPRklMSU5HPXkKIyBlbmQgb2YgR2VuZXJhbCBzZXR1cAoKQ09ORklH
X0FSTTY0PXkKQ09ORklHXzY0QklUPXkKQ09ORklHX01NVT15CkNPTkZJR19BUk02NF9QQUdF
X1NISUZUPTEyCkNPTkZJR19BUk02NF9DT05UX1BURV9TSElGVD00CkNPTkZJR19BUk02NF9D
T05UX1BNRF9TSElGVD00CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUlOPTE4CkNPTkZJ
R19BUkNIX01NQVBfUk5EX0JJVFNfTUFYPTMzCkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBB
VF9CSVRTX01JTj0xMQpDT05GSUdfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NQVg9MTYK
Q09ORklHX1NUQUNLVFJBQ0VfU1VQUE9SVD15CkNPTkZJR19JTExFR0FMX1BPSU5URVJfVkFM
VUU9MHhkZWFkMDAwMDAwMDAwMDAwCkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eQpDT05GSUdf
R0VORVJJQ19CVUc9eQpDT05GSUdfR0VORVJJQ19CVUdfUkVMQVRJVkVfUE9JTlRFUlM9eQpD
T05GSUdfR0VORVJJQ19IV0VJR0hUPXkKQ09ORklHX0dFTkVSSUNfQ1NVTT15CkNPTkZJR19H
RU5FUklDX0NBTElCUkFURV9ERUxBWT15CkNPTkZJR19BUkNIX01IUF9NRU1NQVBfT05fTUVN
T1JZX0VOQUJMRT15CkNPTkZJR19TTVA9eQpDT05GSUdfS0VSTkVMX01PREVfTkVPTj15CkNP
TkZJR19GSVhfRUFSTFlDT05fTUVNPXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTQKQ09ORklH
X0FSQ0hfU1VQUE9SVFNfVVBST0JFUz15CkNPTkZJR19BUkNIX1BST0NfS0NPUkVfVEVYVD15
CgojCiMgUGxhdGZvcm0gc2VsZWN0aW9uCiMKQ09ORklHX0FSQ0hfQUNUSU9OUz15CkNPTkZJ
R19BUkNIX1NVTlhJPXkKQ09ORklHX0FSQ0hfQUxQSU5FPXkKQ09ORklHX0FSQ0hfQVBQTEU9
eQpDT05GSUdfQVJDSF9CQ009eQpDT05GSUdfQVJDSF9CQ00yODM1PXkKQ09ORklHX0FSQ0hf
QkNNX0lQUk9DPXkKQ09ORklHX0FSQ0hfQkNNQkNBPXkKQ09ORklHX0FSQ0hfQlJDTVNUQj15
CkNPTkZJR19BUkNIX0JFUkxJTj15CiMgQ09ORklHX0FSQ0hfQklUTUFJTiBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0VYWU5PUz15CiMgQ09ORklHX0FSQ0hfU1BBUlg1IGlzIG5vdCBzZXQK
Q09ORklHX0FSQ0hfSzM9eQpDT05GSUdfQVJDSF9MRzFLPXkKQ09ORklHX0FSQ0hfSElTST15
CkNPTkZJR19BUkNIX0tFRU1CQVk9eQpDT05GSUdfQVJDSF9NRURJQVRFSz15CkNPTkZJR19B
UkNIX01FU09OPXkKQ09ORklHX0FSQ0hfTVZFQlU9eQpDT05GSUdfQVJDSF9OWFA9eQpDT05G
SUdfQVJDSF9MQVlFUlNDQVBFPXkKQ09ORklHX0FSQ0hfTVhDPXkKQ09ORklHX0FSQ0hfUzMy
PXkKQ09ORklHX0FSQ0hfTlBDTT15CkNPTkZJR19BUkNIX1FDT009eQojIENPTkZJR19BUkNI
X1JFQUxURUsgaXMgbm90IHNldApDT05GSUdfQVJDSF9SRU5FU0FTPXkKQ09ORklHX0FSQ0hf
Uk9DS0NISVA9eQpDT05GSUdfQVJDSF9TRUFUVExFPXkKQ09ORklHX0FSQ0hfSU5URUxfU09D
RlBHQT15CkNPTkZJR19BUkNIX1NZTlFVQUNFUj15CkNPTkZJR19BUkNIX1RFR1JBPXkKQ09O
RklHX0FSQ0hfVEVTTEFfRlNEPXkKQ09ORklHX0FSQ0hfU1BSRD15CkNPTkZJR19BUkNIX1RI
VU5ERVI9eQpDT05GSUdfQVJDSF9USFVOREVSMj15CkNPTkZJR19BUkNIX1VOSVBISUVSPXkK
Q09ORklHX0FSQ0hfVkVYUFJFU1M9eQpDT05GSUdfQVJDSF9WSVNDT05UST15CkNPTkZJR19B
UkNIX1hHRU5FPXkKQ09ORklHX0FSQ0hfWllOUU1QPXkKIyBlbmQgb2YgUGxhdGZvcm0gc2Vs
ZWN0aW9uCgojCiMgS2VybmVsIEZlYXR1cmVzCiMKCiMKIyBBUk0gZXJyYXRhIHdvcmthcm91
bmRzIHZpYSB0aGUgYWx0ZXJuYXRpdmVzIGZyYW1ld29yawojCkNPTkZJR19BUk02NF9XT1JL
QVJPVU5EX0NMRUFOX0NBQ0hFPXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fODI2MzE5PXkKQ09O
RklHX0FSTTY0X0VSUkFUVU1fODI3MzE5PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fODI0MDY5
PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fODE5NDcyPXkKQ09ORklHX0FSTTY0X0VSUkFUVU1f
ODMyMDc1PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fODM0MjIwPXkKQ09ORklHX0FSTTY0X0VS
UkFUVU1fMTc0MjA5OD15CkNPTkZJR19BUk02NF9FUlJBVFVNXzg0NTcxOT15CkNPTkZJR19B
Uk02NF9FUlJBVFVNXzg0MzQxOT15CkNPTkZJR19BUk02NF9MRF9IQVNfRklYX0VSUkFUVU1f
ODQzNDE5PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fMTAyNDcxOD15CkNPTkZJR19BUk02NF9F
UlJBVFVNXzE0MTgwNDA9eQpDT05GSUdfQVJNNjRfV09SS0FST1VORF9TUEVDVUxBVElWRV9B
VD15CkNPTkZJR19BUk02NF9FUlJBVFVNXzExNjU1MjI9eQpDT05GSUdfQVJNNjRfRVJSQVRV
TV8xMzE5MzY3PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fMTUzMDkyMz15CkNPTkZJR19BUk02
NF9XT1JLQVJPVU5EX1JFUEVBVF9UTEJJPXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fMjQ0MTAw
Nz15CkNPTkZJR19BUk02NF9FUlJBVFVNXzEyODY4MDc9eQpDT05GSUdfQVJNNjRfRVJSQVRV
TV8xNDYzMjI1PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fMTU0MjQxOT15CkNPTkZJR19BUk02
NF9FUlJBVFVNXzE1MDg0MTI9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV8yMDUxNjc4PXkKQ09O
RklHX0FSTTY0X0VSUkFUVU1fMjA3NzA1Nz15CkNPTkZJR19BUk02NF9FUlJBVFVNXzI2NTg0
MTc9eQpDT05GSUdfQVJNNjRfV09SS0FST1VORF9UU0JfRkxVU0hfRkFJTFVSRT15CkNPTkZJ
R19BUk02NF9FUlJBVFVNXzIwNTQyMjM9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV8yMDY3OTYx
PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fMjQ0MTAwOT15CkNPTkZJR19BUk02NF9FUlJBVFVN
XzI0NTcxNjg9eQpDT05GSUdfQ0FWSVVNX0VSUkFUVU1fMjIzNzU9eQpDT05GSUdfQ0FWSVVN
X0VSUkFUVU1fMjMxNDQ9eQpDT05GSUdfQ0FWSVVNX0VSUkFUVU1fMjMxNTQ9eQpDT05GSUdf
Q0FWSVVNX0VSUkFUVU1fMjc0NTY9eQpDT05GSUdfQ0FWSVVNX0VSUkFUVU1fMzAxMTU9eQpD
T05GSUdfQ0FWSVVNX1RYMl9FUlJBVFVNXzIxOT15CkNPTkZJR19GVUpJVFNVX0VSUkFUVU1f
MDEwMDAxPXkKQ09ORklHX0hJU0lMSUNPTl9FUlJBVFVNXzE2MTYwMDgwMj15CkNPTkZJR19R
Q09NX0ZBTEtPUl9FUlJBVFVNXzEwMDM9eQpDT05GSUdfUUNPTV9GQUxLT1JfRVJSQVRVTV8x
MDA5PXkKQ09ORklHX1FDT01fUURGMjQwMF9FUlJBVFVNXzAwNjU9eQpDT05GSUdfUUNPTV9G
QUxLT1JfRVJSQVRVTV9FMTA0MT15CkNPTkZJR19OVklESUFfQ0FSTUVMX0NOUF9FUlJBVFVN
PXkKQ09ORklHX1NPQ0lPTkVYVF9TWU5RVUFDRVJfUFJFSVRTPXkKIyBlbmQgb2YgQVJNIGVy
cmF0YSB3b3JrYXJvdW5kcyB2aWEgdGhlIGFsdGVybmF0aXZlcyBmcmFtZXdvcmsKCkNPTkZJ
R19BUk02NF80S19QQUdFUz15CiMgQ09ORklHX0FSTTY0XzE2S19QQUdFUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0FSTTY0XzY0S19QQUdFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTTY0X1ZB
X0JJVFNfMzkgaXMgbm90IHNldApDT05GSUdfQVJNNjRfVkFfQklUU180OD15CkNPTkZJR19B
Uk02NF9WQV9CSVRTPTQ4CkNPTkZJR19BUk02NF9QQV9CSVRTXzQ4PXkKQ09ORklHX0FSTTY0
X1BBX0JJVFM9NDgKIyBDT05GSUdfQ1BVX0JJR19FTkRJQU4gaXMgbm90IHNldApDT05GSUdf
Q1BVX0xJVFRMRV9FTkRJQU49eQpDT05GSUdfU0NIRURfTUM9eQojIENPTkZJR19TQ0hFRF9D
TFVTVEVSIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX1NNVD15CkNPTkZJR19OUl9DUFVTPTI1
NgpDT05GSUdfSE9UUExVR19DUFU9eQpDT05GSUdfTlVNQT15CkNPTkZJR19OT0RFU19TSElG
VD00CiMgQ09ORklHX0haXzEwMCBpcyBub3Qgc2V0CkNPTkZJR19IWl8yNTA9eQojIENPTkZJ
R19IWl8zMDAgaXMgbm90IHNldAojIENPTkZJR19IWl8xMDAwIGlzIG5vdCBzZXQKQ09ORklH
X0haPTI1MApDT05GSUdfU0NIRURfSFJUSUNLPXkKQ09ORklHX0FSQ0hfU1BBUlNFTUVNX0VO
QUJMRT15CkNPTkZJR19IV19QRVJGX0VWRU5UUz15CkNPTkZJR19QQVJBVklSVD15CiMgQ09O
RklHX1BBUkFWSVJUX1RJTUVfQUNDT1VOVElORyBpcyBub3Qgc2V0CkNPTkZJR19LRVhFQz15
CkNPTkZJR19LRVhFQ19GSUxFPXkKIyBDT05GSUdfS0VYRUNfU0lHIGlzIG5vdCBzZXQKQ09O
RklHX0NSQVNIX0RVTVA9eQpDT05GSUdfVFJBTlNfVEFCTEU9eQpDT05GSUdfWEVOX0RPTTA9
eQpDT05GSUdfWEVOPXkKQ09ORklHX0FSQ0hfRk9SQ0VfTUFYX09SREVSPTExCkNPTkZJR19V
Tk1BUF9LRVJORUxfQVRfRUwwPXkKQ09ORklHX01JVElHQVRFX1NQRUNUUkVfQlJBTkNIX0hJ
U1RPUlk9eQpDT05GSUdfUk9EQVRBX0ZVTExfREVGQVVMVF9FTkFCTEVEPXkKIyBDT05GSUdf
QVJNNjRfU1dfVFRCUjBfUEFOIGlzIG5vdCBzZXQKQ09ORklHX0FSTTY0X1RBR0dFRF9BRERS
X0FCST15CkNPTkZJR19DT01QQVQ9eQpDT05GSUdfS1VTRVJfSEVMUEVSUz15CiMgQ09ORklH
X0NPTVBBVF9BTElHTk1FTlRfRklYVVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNVjhfREVQ
UkVDQVRFRCBpcyBub3Qgc2V0CgojCiMgQVJNdjguMSBhcmNoaXRlY3R1cmFsIGZlYXR1cmVz
CiMKQ09ORklHX0FSTTY0X0hXX0FGREJNPXkKQ09ORklHX0FSTTY0X1BBTj15CkNPTkZJR19B
U19IQVNfTERBUFI9eQpDT05GSUdfQVNfSEFTX0xTRV9BVE9NSUNTPXkKQ09ORklHX0FSTTY0
X0xTRV9BVE9NSUNTPXkKQ09ORklHX0FSTTY0X1VTRV9MU0VfQVRPTUlDUz15CiMgZW5kIG9m
IEFSTXY4LjEgYXJjaGl0ZWN0dXJhbCBmZWF0dXJlcwoKIwojIEFSTXY4LjIgYXJjaGl0ZWN0
dXJhbCBmZWF0dXJlcwojCkNPTkZJR19BU19IQVNfQVJNVjhfMj15CkNPTkZJR19BU19IQVNf
U0hBMz15CiMgQ09ORklHX0FSTTY0X1BNRU0gaXMgbm90IHNldApDT05GSUdfQVJNNjRfUkFT
X0VYVE49eQpDT05GSUdfQVJNNjRfQ05QPXkKIyBlbmQgb2YgQVJNdjguMiBhcmNoaXRlY3R1
cmFsIGZlYXR1cmVzCgojCiMgQVJNdjguMyBhcmNoaXRlY3R1cmFsIGZlYXR1cmVzCiMKQ09O
RklHX0FSTTY0X1BUUl9BVVRIPXkKQ09ORklHX0FSTTY0X1BUUl9BVVRIX0tFUk5FTD15CkNP
TkZJR19DQ19IQVNfU0lHTl9SRVRVUk5fQUREUkVTUz15CkNPTkZJR19BU19IQVNfUEFDPXkK
IyBlbmQgb2YgQVJNdjguMyBhcmNoaXRlY3R1cmFsIGZlYXR1cmVzCgojCiMgQVJNdjguNCBh
cmNoaXRlY3R1cmFsIGZlYXR1cmVzCiMKQ09ORklHX0FSTTY0X0FNVV9FWFROPXkKQ09ORklH
X0FTX0hBU19BUk1WOF80PXkKQ09ORklHX0FSTTY0X1RMQl9SQU5HRT15CiMgZW5kIG9mIEFS
TXY4LjQgYXJjaGl0ZWN0dXJhbCBmZWF0dXJlcwoKIwojIEFSTXY4LjUgYXJjaGl0ZWN0dXJh
bCBmZWF0dXJlcwojCkNPTkZJR19BUk02NF9CVEk9eQpDT05GSUdfQVJNNjRfRTBQRD15CiMg
ZW5kIG9mIEFSTXY4LjUgYXJjaGl0ZWN0dXJhbCBmZWF0dXJlcwoKIwojIEFSTXY4LjcgYXJj
aGl0ZWN0dXJhbCBmZWF0dXJlcwojCkNPTkZJR19BUk02NF9FUEFOPXkKIyBlbmQgb2YgQVJN
djguNyBhcmNoaXRlY3R1cmFsIGZlYXR1cmVzCgpDT05GSUdfQVJNNjRfU1ZFPXkKQ09ORklH
X0FSTTY0X1NNRT15CkNPTkZJR19BUk02NF9NT0RVTEVfUExUUz15CiMgQ09ORklHX0FSTTY0
X1BTRVVET19OTUkgaXMgbm90IHNldApDT05GSUdfUkVMT0NBVEFCTEU9eQpDT05GSUdfUkFO
RE9NSVpFX0JBU0U9eQpDT05GSUdfUkFORE9NSVpFX01PRFVMRV9SRUdJT05fRlVMTD15CkNP
TkZJR19BUkNIX05SX0dQSU89MjA0OAojIGVuZCBvZiBLZXJuZWwgRmVhdHVyZXMKCiMKIyBC
b290IG9wdGlvbnMKIwojIENPTkZJR19BUk02NF9BQ1BJX1BBUktJTkdfUFJPVE9DT0wgaXMg
bm90IHNldApDT05GSUdfQ01ETElORT0iIgpDT05GSUdfRUZJX1NUVUI9eQpDT05GSUdfRUZJ
PXkKQ09ORklHX0RNST15CiMgZW5kIG9mIEJvb3Qgb3B0aW9ucwoKIwojIFBvd2VyIG1hbmFn
ZW1lbnQgb3B0aW9ucwojCkNPTkZJR19TVVNQRU5EPXkKQ09ORklHX1NVU1BFTkRfRlJFRVpF
Uj15CkNPTkZJR19ISUJFUk5BVEVfQ0FMTEJBQ0tTPXkKQ09ORklHX0hJQkVSTkFUSU9OPXkK
Q09ORklHX0hJQkVSTkFUSU9OX1NOQVBTSE9UX0RFVj15CkNPTkZJR19QTV9TVERfUEFSVElU
SU9OPSIiCkNPTkZJR19QTV9TTEVFUD15CkNPTkZJR19QTV9TTEVFUF9TTVA9eQojIENPTkZJ
R19QTV9BVVRPU0xFRVAgaXMgbm90IHNldAojIENPTkZJR19QTV9VU0VSU1BBQ0VfQVVUT1NM
RUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1fV0FLRUxPQ0tTIGlzIG5vdCBzZXQKQ09ORklH
X1BNPXkKIyBDT05GSUdfUE1fREVCVUcgaXMgbm90IHNldApDT05GSUdfUE1fQ0xLPXkKQ09O
RklHX1BNX0dFTkVSSUNfRE9NQUlOUz15CkNPTkZJR19XUV9QT1dFUl9FRkZJQ0lFTlRfREVG
QVVMVD15CkNPTkZJR19QTV9HRU5FUklDX0RPTUFJTlNfU0xFRVA9eQpDT05GSUdfUE1fR0VO
RVJJQ19ET01BSU5TX09GPXkKQ09ORklHX0NQVV9QTT15CkNPTkZJR19FTkVSR1lfTU9ERUw9
eQpDT05GSUdfQVJDSF9ISUJFUk5BVElPTl9QT1NTSUJMRT15CkNPTkZJR19BUkNIX0hJQkVS
TkFUSU9OX0hFQURFUj15CkNPTkZJR19BUkNIX1NVU1BFTkRfUE9TU0lCTEU9eQojIGVuZCBv
ZiBQb3dlciBtYW5hZ2VtZW50IG9wdGlvbnMKCiMKIyBDUFUgUG93ZXIgTWFuYWdlbWVudAoj
CgojCiMgQ1BVIElkbGUKIwpDT05GSUdfQ1BVX0lETEU9eQpDT05GSUdfQ1BVX0lETEVfTVVM
VElQTEVfRFJJVkVSUz15CiMgQ09ORklHX0NQVV9JRExFX0dPVl9MQURERVIgaXMgbm90IHNl
dApDT05GSUdfQ1BVX0lETEVfR09WX01FTlU9eQojIENPTkZJR19DUFVfSURMRV9HT1ZfVEVP
IGlzIG5vdCBzZXQKQ09ORklHX0RUX0lETEVfU1RBVEVTPXkKQ09ORklHX0RUX0lETEVfR0VO
UEQ9eQoKIwojIEFSTSBDUFUgSWRsZSBEcml2ZXJzCiMKQ09ORklHX0FSTV9QU0NJX0NQVUlE
TEU9eQpDT05GSUdfQVJNX1BTQ0lfQ1BVSURMRV9ET01BSU49eQojIGVuZCBvZiBBUk0gQ1BV
IElkbGUgRHJpdmVycwojIGVuZCBvZiBDUFUgSWRsZQoKIwojIENQVSBGcmVxdWVuY3kgc2Nh
bGluZwojCkNPTkZJR19DUFVfRlJFUT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQVRUUl9TRVQ9
eQpDT05GSUdfQ1BVX0ZSRVFfR09WX0NPTU1PTj15CkNPTkZJR19DUFVfRlJFUV9TVEFUPXkK
IyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfUEVSRk9STUFOQ0UgaXMgbm90IHNldAoj
IENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QT1dFUlNBVkUgaXMgbm90IHNldAojIENP
TkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9VU0VSU1BBQ0UgaXMgbm90IHNldAojIENPTkZJ
R19DUFVfRlJFUV9ERUZBVUxUX0dPVl9PTkRFTUFORCBpcyBub3Qgc2V0CiMgQ09ORklHX0NQ
VV9GUkVRX0RFRkFVTFRfR09WX0NPTlNFUlZBVElWRSBpcyBub3Qgc2V0CkNPTkZJR19DUFVf
RlJFUV9ERUZBVUxUX0dPVl9TQ0hFRFVUSUw9eQpDT05GSUdfQ1BVX0ZSRVFfR09WX1BFUkZP
Uk1BTkNFPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9QT1dFUlNBVkU9bQpDT05GSUdfQ1BVX0ZS
RVFfR09WX1VTRVJTUEFDRT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfT05ERU1BTkQ9eQpDT05G
SUdfQ1BVX0ZSRVFfR09WX0NPTlNFUlZBVElWRT1tCkNPTkZJR19DUFVfRlJFUV9HT1ZfU0NI
RURVVElMPXkKCiMKIyBDUFUgZnJlcXVlbmN5IHNjYWxpbmcgZHJpdmVycwojCkNPTkZJR19D
UFVGUkVRX0RUPXkKQ09ORklHX0NQVUZSRVFfRFRfUExBVERFVj15CkNPTkZJR19BQ1BJX0NQ
UENfQ1BVRlJFUT1tCkNPTkZJR19BQ1BJX0NQUENfQ1BVRlJFUV9GSUU9eQpDT05GSUdfQVJN
X0FMTFdJTk5FUl9TVU41MElfQ1BVRlJFUV9OVk1FTT1tCkNPTkZJR19BUk1fQVJNQURBXzM3
WFhfQ1BVRlJFUT15CiMgQ09ORklHX0FSTV9BUk1BREFfOEtfQ1BVRlJFUSBpcyBub3Qgc2V0
CkNPTkZJR19BUk1fU0NQSV9DUFVGUkVRPXkKQ09ORklHX0FSTV9CUkNNU1RCX0FWU19DUFVG
UkVRPXkKQ09ORklHX0FSTV9JTVhfQ1BVRlJFUV9EVD1tCkNPTkZJR19BUk1fTUVESUFURUtf
Q1BVRlJFUT15CkNPTkZJR19BUk1fTUVESUFURUtfQ1BVRlJFUV9IVz1tCkNPTkZJR19BUk1f
UUNPTV9DUFVGUkVRX05WTUVNPXkKQ09ORklHX0FSTV9RQ09NX0NQVUZSRVFfSFc9eQpDT05G
SUdfQVJNX1JBU1BCRVJSWVBJX0NQVUZSRVE9bQpDT05GSUdfQVJNX1NDTUlfQ1BVRlJFUT15
CkNPTkZJR19BUk1fVEVHUkEyMF9DUFVGUkVRPXkKQ09ORklHX0FSTV9URUdSQTEyNF9DUFVG
UkVRPXkKQ09ORklHX0FSTV9URUdSQTE4Nl9DUFVGUkVRPXkKQ09ORklHX0FSTV9URUdSQTE5
NF9DUFVGUkVRPXkKQ09ORklHX1FPUklRX0NQVUZSRVE9eQojIGVuZCBvZiBDUFUgRnJlcXVl
bmN5IHNjYWxpbmcKIyBlbmQgb2YgQ1BVIFBvd2VyIE1hbmFnZW1lbnQKCkNPTkZJR19BUkNI
X1NVUFBPUlRTX0FDUEk9eQpDT05GSUdfQUNQST15CkNPTkZJR19BQ1BJX0dFTkVSSUNfR1NJ
PXkKQ09ORklHX0FDUElfQ0NBX1JFUVVJUkVEPXkKIyBDT05GSUdfQUNQSV9ERUJVR0dFUiBp
cyBub3Qgc2V0CkNPTkZJR19BQ1BJX1NQQ1JfVEFCTEU9eQojIENPTkZJR19BQ1BJX0VDX0RF
QlVHRlMgaXMgbm90IHNldApDT05GSUdfQUNQSV9BQz15CkNPTkZJR19BQ1BJX0JBVFRFUlk9
eQpDT05GSUdfQUNQSV9CVVRUT049eQojIENPTkZJR19BQ1BJX1ZJREVPIGlzIG5vdCBzZXQK
Q09ORklHX0FDUElfRkFOPXkKIyBDT05GSUdfQUNQSV9UQUQgaXMgbm90IHNldAojIENPTkZJ
R19BQ1BJX0RPQ0sgaXMgbm90IHNldApDT05GSUdfQUNQSV9QUk9DRVNTT1JfSURMRT15CkNP
TkZJR19BQ1BJX01DRkc9eQpDT05GSUdfQUNQSV9DUFBDX0xJQj15CkNPTkZJR19BQ1BJX1BS
T0NFU1NPUj15CiMgQ09ORklHX0FDUElfSVBNSSBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0hP
VFBMVUdfQ1BVPXkKQ09ORklHX0FDUElfVEhFUk1BTD15CkNPTkZJR19BUkNIX0hBU19BQ1BJ
X1RBQkxFX1VQR1JBREU9eQpDT05GSUdfQUNQSV9UQUJMRV9VUEdSQURFPXkKIyBDT05GSUdf
QUNQSV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfUENJX1NMT1QgaXMgbm90IHNl
dApDT05GSUdfQUNQSV9DT05UQUlORVI9eQpDT05GSUdfQUNQSV9IT1RQTFVHX01FTU9SWT15
CkNPTkZJR19BQ1BJX0hFRD15CiMgQ09ORklHX0FDUElfQ1VTVE9NX01FVEhPRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0FDUElfQkdSVCBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX1JFRFVDRURf
SEFSRFdBUkVfT05MWT15CkNPTkZJR19BQ1BJX05VTUE9eQpDT05GSUdfQUNQSV9ITUFUPXkK
Q09ORklHX0hBVkVfQUNQSV9BUEVJPXkKQ09ORklHX0FDUElfQVBFST15CkNPTkZJR19BQ1BJ
X0FQRUlfR0hFUz15CkNPTkZJR19BQ1BJX0FQRUlfUENJRUFFUj15CkNPTkZJR19BQ1BJX0FQ
RUlfU0VBPXkKQ09ORklHX0FDUElfQVBFSV9NRU1PUllfRkFJTFVSRT15CkNPTkZJR19BQ1BJ
X0FQRUlfRUlOSj15CiMgQ09ORklHX0FDUElfQVBFSV9FUlNUX0RFQlVHIGlzIG5vdCBzZXQK
IyBDT05GSUdfQUNQSV9DT05GSUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfUEZSVVQg
aXMgbm90IHNldApDT05GSUdfQUNQSV9JT1JUPXkKQ09ORklHX0FDUElfR1REVD15CkNPTkZJ
R19BQ1BJX1BQVFQ9eQpDT05GSUdfQUNQSV9QQ0M9eQojIENPTkZJR19QTUlDX09QUkVHSU9O
IGlzIG5vdCBzZXQKQ09ORklHX0FDUElfUFJNVD15CkNPTkZJR19JUlFfQllQQVNTX01BTkFH
RVI9eQpDT05GSUdfSEFWRV9LVk09eQpDT05GSUdfSEFWRV9LVk1fSVJRQ0hJUD15CkNPTkZJ
R19IQVZFX0tWTV9JUlFGRD15CkNPTkZJR19IQVZFX0tWTV9JUlFfUk9VVElORz15CkNPTkZJ
R19IQVZFX0tWTV9FVkVOVEZEPXkKQ09ORklHX0tWTV9NTUlPPXkKQ09ORklHX0hBVkVfS1ZN
X01TST15CkNPTkZJR19IQVZFX0tWTV9DUFVfUkVMQVhfSU5URVJDRVBUPXkKQ09ORklHX0tW
TV9WRklPPXkKQ09ORklHX0hBVkVfS1ZNX0FSQ0hfVExCX0ZMVVNIX0FMTD15CkNPTkZJR19L
Vk1fR0VORVJJQ19ESVJUWUxPR19SRUFEX1BST1RFQ1Q9eQpDT05GSUdfSEFWRV9LVk1fSVJR
X0JZUEFTUz15CkNPTkZJR19IQVZFX0tWTV9WQ1BVX1JVTl9QSURfQ0hBTkdFPXkKQ09ORklH
X0tWTV9YRkVSX1RPX0dVRVNUX1dPUks9eQpDT05GSUdfVklSVFVBTElaQVRJT049eQpDT05G
SUdfS1ZNPXkKIyBDT05GSUdfTlZIRV9FTDJfREVCVUcgaXMgbm90IHNldAoKIwojIEdlbmVy
YWwgYXJjaGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRpb25zCiMKQ09ORklHX0NSQVNIX0NPUkU9
eQpDT05GSUdfS0VYRUNfQ09SRT15CiMgQ09ORklHX0tQUk9CRVMgaXMgbm90IHNldApDT05G
SUdfSlVNUF9MQUJFTD15CiMgQ09ORklHX1NUQVRJQ19LRVlTX1NFTEZURVNUIGlzIG5vdCBz
ZXQKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9eQpDT05GSUdfSEFW
RV9JT1JFTUFQX1BST1Q9eQpDT05GSUdfSEFWRV9LUFJPQkVTPXkKQ09ORklHX0hBVkVfS1JF
VFBST0JFUz15CkNPTkZJR19BUkNIX0NPUlJFQ1RfU1RBQ0tUUkFDRV9PTl9LUkVUUFJPQkU9
eQpDT05GSUdfSEFWRV9GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT049eQpDT05GSUdfSEFWRV9O
TUk9eQpDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVD15CkNPTkZJR19UUkFDRV9JUlFG
TEFHU19OTUlfU1VQUE9SVD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VIT09LPXkKQ09ORklH
X0hBVkVfRE1BX0NPTlRJR1VPVVM9eQpDT05GSUdfR0VORVJJQ19TTVBfSURMRV9USFJFQUQ9
eQpDT05GSUdfR0VORVJJQ19JRExFX1BPTExfU0VUVVA9eQpDT05GSUdfQVJDSF9IQVNfRk9S
VElGWV9TT1VSQ0U9eQpDT05GSUdfQVJDSF9IQVNfS0VFUElOSVRSRD15CkNPTkZJR19BUkNI
X0hBU19TRVRfTUVNT1JZPXkKQ09ORklHX0FSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQPXkKQ09O
RklHX0hBVkVfQVJDSF9USFJFQURfU1RSVUNUX1dISVRFTElTVD15CkNPTkZJR19BUkNIX1dB
TlRTX05PX0lOU1RSPXkKQ09ORklHX0hBVkVfQVNNX01PRFZFUlNJT05TPXkKQ09ORklHX0hB
VkVfUkVHU19BTkRfU1RBQ0tfQUNDRVNTX0FQST15CkNPTkZJR19IQVZFX1JTRVE9eQpDT05G
SUdfSEFWRV9GVU5DVElPTl9BUkdfQUNDRVNTX0FQST15CkNPTkZJR19IQVZFX0hXX0JSRUFL
UE9JTlQ9eQpDT05GSUdfSEFWRV9QRVJGX1JFR1M9eQpDT05GSUdfSEFWRV9QRVJGX1VTRVJf
U1RBQ0tfRFVNUD15CkNPTkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15CkNPTkZJR19IQVZF
X0FSQ0hfSlVNUF9MQUJFTF9SRUxBVElWRT15CkNPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZS
RUU9eQpDT05GSUdfTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRT15CkNPTkZJR19BUkNIX0hB
VkVfTk1JX1NBRkVfQ01QWENIRz15CkNPTkZJR19IQVZFX0FMSUdORURfU1RSVUNUX1BBR0U9
eQpDT05GSUdfSEFWRV9DTVBYQ0hHX0xPQ0FMPXkKQ09ORklHX0hBVkVfQ01QWENIR19ET1VC
TEU9eQpDT05GSUdfQVJDSF9XQU5UX0NPTVBBVF9JUENfUEFSU0VfVkVSU0lPTj15CkNPTkZJ
R19IQVZFX0FSQ0hfU0VDQ09NUD15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUF9GSUxURVI9
eQpDT05GSUdfU0VDQ09NUD15CkNPTkZJR19TRUNDT01QX0ZJTFRFUj15CiMgQ09ORklHX1NF
Q0NPTVBfQ0FDSEVfREVCVUcgaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX1NUQUNLTEVB
Sz15CkNPTkZJR19IQVZFX1NUQUNLUFJPVEVDVE9SPXkKQ09ORklHX1NUQUNLUFJPVEVDVE9S
PXkKQ09ORklHX1NUQUNLUFJPVEVDVE9SX1NUUk9ORz15CkNPTkZJR19BUkNIX1NVUFBPUlRT
X0xUT19DTEFORz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0xUT19DTEFOR19USElOPXkKQ09O
RklHX0xUT19OT05FPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQ0ZJX0NMQU5HPXkKQ09ORklH
X0hBVkVfQ09OVEVYVF9UUkFDS0lOR19VU0VSPXkKQ09ORklHX0hBVkVfVklSVF9DUFVfQUND
T1VOVElOR19HRU49eQpDT05GSUdfSEFWRV9JUlFfVElNRV9BQ0NPVU5USU5HPXkKQ09ORklH
X0hBVkVfTU9WRV9QVUQ9eQpDT05GSUdfSEFWRV9NT1ZFX1BNRD15CkNPTkZJR19IQVZFX0FS
Q0hfVFJBTlNQQVJFTlRfSFVHRVBBR0U9eQpDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BUD15
CkNPTkZJR19IQVZFX0FSQ0hfSFVHRV9WTUFMTE9DPXkKQ09ORklHX0FSQ0hfV0FOVF9IVUdF
X1BNRF9TSEFSRT15CkNPTkZJR19IQVZFX01PRF9BUkNIX1NQRUNJRklDPXkKQ09ORklHX01P
RFVMRVNfVVNFX0VMRl9SRUxBPXkKQ09ORklHX0hBVkVfU09GVElSUV9PTl9PV05fU1RBQ0s9
eQpDT05GSUdfU09GVElSUV9PTl9PV05fU1RBQ0s9eQpDT05GSUdfQVJDSF9IQVNfRUxGX1JB
TkRPTUlaRT15CkNPTkZJR19IQVZFX0FSQ0hfTU1BUF9STkRfQklUUz15CkNPTkZJR19BUkNI
X01NQVBfUk5EX0JJVFM9MTgKQ09ORklHX0hBVkVfQVJDSF9NTUFQX1JORF9DT01QQVRfQklU
Uz15CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTPTExCkNPTkZJR19QQUdFX1NJ
WkVfTEVTU19USEFOXzY0S0I9eQpDT05GSUdfUEFHRV9TSVpFX0xFU1NfVEhBTl8yNTZLQj15
CkNPTkZJR19BUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01NQVBfTEFZT1VUPXkKQ09ORklH
X0NMT05FX0JBQ0tXQVJEUz15CkNPTkZJR19PTERfU0lHU1VTUEVORDM9eQpDT05GSUdfQ09N
UEFUX09MRF9TSUdBQ1RJT049eQpDT05GSUdfQ09NUEFUXzMyQklUX1RJTUU9eQpDT05GSUdf
SEFWRV9BUkNIX1ZNQVBfU1RBQ0s9eQpDT05GSUdfVk1BUF9TVEFDSz15CkNPTkZJR19IQVZF
X0FSQ0hfUkFORE9NSVpFX0tTVEFDS19PRkZTRVQ9eQpDT05GSUdfUkFORE9NSVpFX0tTVEFD
S19PRkZTRVQ9eQojIENPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVF9ERUZBVUxUIGlz
IG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklHX1NU
UklDVF9LRVJORUxfUldYPXkKQ09ORklHX0FSQ0hfSEFTX1NUUklDVF9NT0RVTEVfUldYPXkK
Q09ORklHX1NUUklDVF9NT0RVTEVfUldYPXkKQ09ORklHX0hBVkVfQVJDSF9DT01QSUxFUl9I
PXkKQ09ORklHX0hBVkVfQVJDSF9QUkVMMzJfUkVMT0NBVElPTlM9eQpDT05GSUdfQVJDSF9V
U0VfTUVNUkVNQVBfUFJPVD15CiMgQ09ORklHX0xPQ0tfRVZFTlRfQ09VTlRTIGlzIG5vdCBz
ZXQKQ09ORklHX0FSQ0hfSEFTX1JFTFI9eQpDT05GSUdfSEFWRV9QUkVFTVBUX0RZTkFNSUM9
eQpDT05GSUdfSEFWRV9QUkVFTVBUX0RZTkFNSUNfS0VZPXkKQ09ORklHX0FSQ0hfV0FOVF9M
RF9PUlBIQU5fV0FSTj15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQz15
CkNPTkZJR19BUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0s9eQpDT05GSUdfQVJDSF9I
QVZFX1RSQUNFX01NSU9fQUNDRVNTPXkKCiMKIyBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxp
bmcKIwojIENPTkZJR19HQ09WX0tFUk5FTCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19H
Q09WX1BST0ZJTEVfQUxMPXkKIyBlbmQgb2YgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5n
CgpDT05GSUdfSEFWRV9HQ0NfUExVR0lOUz15CiMgZW5kIG9mIEdlbmVyYWwgYXJjaGl0ZWN0
dXJlLWRlcGVuZGVudCBvcHRpb25zCgpDT05GSUdfUlRfTVVURVhFUz15CkNPTkZJR19CQVNF
X1NNQUxMPTAKQ09ORklHX01PRFVMRVM9eQojIENPTkZJR19NT0RVTEVfRk9SQ0VfTE9BRCBp
cyBub3Qgc2V0CkNPTkZJR19NT0RVTEVfVU5MT0FEPXkKIyBDT05GSUdfTU9EVUxFX0ZPUkNF
X1VOTE9BRCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9VTkxPQURfVEFJTlRfVFJBQ0tJ
TkcgaXMgbm90IHNldAojIENPTkZJR19NT0RWRVJTSU9OUyBpcyBub3Qgc2V0CiMgQ09ORklH
X01PRFVMRV9TUkNWRVJTSU9OX0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TSUcg
aXMgbm90IHNldApDT05GSUdfTU9EVUxFX0NPTVBSRVNTX05PTkU9eQojIENPTkZJR19NT0RV
TEVfQ09NUFJFU1NfR1pJUCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19Y
WiBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19aU1REIGlzIG5vdCBzZXQK
IyBDT05GSUdfTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFNRVNQQUNFX0lNUE9SVFMgaXMgbm90
IHNldApDT05GSUdfTU9EUFJPQkVfUEFUSD0iL3NiaW4vbW9kcHJvYmUiCkNPTkZJR19NT0RV
TEVTX1RSRUVfTE9PS1VQPXkKQ09ORklHX0JMT0NLPXkKQ09ORklHX0JMT0NLX0xFR0FDWV9B
VVRPTE9BRD15CkNPTkZJR19CTEtfREVWX0JTR19DT01NT049eQpDT05GSUdfQkxLX0RFVl9C
U0dMSUI9eQpDT05GSUdfQkxLX0RFVl9JTlRFR1JJVFk9eQpDT05GSUdfQkxLX0RFVl9JTlRF
R1JJVFlfVDEwPXkKIyBDT05GSUdfQkxLX0RFVl9aT05FRCBpcyBub3Qgc2V0CiMgQ09ORklH
X0JMS19ERVZfVEhST1RUTElORyBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19XQlQgaXMgbm90
IHNldAojIENPTkZJR19CTEtfQ0dST1VQX0lPTEFURU5DWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JMS19DR1JPVVBfSU9DT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0NHUk9VUF9JT1BS
SU8gaXMgbm90IHNldApDT05GSUdfQkxLX0RFQlVHX0ZTPXkKIyBDT05GSUdfQkxLX1NFRF9P
UEFMIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0lOTElORV9FTkNSWVBUSU9OIGlzIG5vdCBz
ZXQKCiMKIyBQYXJ0aXRpb24gVHlwZXMKIwojIENPTkZJR19QQVJUSVRJT05fQURWQU5DRUQg
aXMgbm90IHNldApDT05GSUdfTVNET1NfUEFSVElUSU9OPXkKQ09ORklHX0VGSV9QQVJUSVRJ
T049eQojIGVuZCBvZiBQYXJ0aXRpb24gVHlwZXMKCkNPTkZJR19CTE9DS19DT01QQVQ9eQpD
T05GSUdfQkxLX01RX1BDST15CkNPTkZJR19CTEtfTVFfVklSVElPPXkKQ09ORklHX0JMS19Q
TT15CkNPTkZJR19CTE9DS19IT0xERVJfREVQUkVDQVRFRD15CkNPTkZJR19CTEtfTVFfU1RB
Q0tJTkc9eQoKIwojIElPIFNjaGVkdWxlcnMKIwpDT05GSUdfTVFfSU9TQ0hFRF9ERUFETElO
RT15CkNPTkZJR19NUV9JT1NDSEVEX0tZQkVSPXkKIyBDT05GSUdfSU9TQ0hFRF9CRlEgaXMg
bm90IHNldAojIGVuZCBvZiBJTyBTY2hlZHVsZXJzCgpDT05GSUdfUFJFRU1QVF9OT1RJRklF
UlM9eQpDT05GSUdfQVNOMT15CkNPTkZJR19VTklOTElORV9TUElOX1VOTE9DSz15CkNPTkZJ
R19BUkNIX1NVUFBPUlRTX0FUT01JQ19STVc9eQpDT05GSUdfTVVURVhfU1BJTl9PTl9PV05F
Uj15CkNPTkZJR19SV1NFTV9TUElOX09OX09XTkVSPXkKQ09ORklHX0xPQ0tfU1BJTl9PTl9P
V05FUj15CkNPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTPXkKQ09ORklHX1FVRVVF
RF9TUElOTE9DS1M9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdf
UVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJF
U1NfU1BBQ0U9eQpDT05GSUdfQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSPXkKQ09ORklHX0ZS
RUVaRVI9eQoKIwojIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMKQ09ORklHX0JJTkZNVF9F
TEY9eQpDT05GSUdfQ09NUEFUX0JJTkZNVF9FTEY9eQpDT05GSUdfQVJDSF9CSU5GTVRfRUxG
X1NUQVRFPXkKQ09ORklHX0FSQ0hfQklORk1UX0VMRl9FWFRSQV9QSERSUz15CkNPTkZJR19B
UkNIX0hBVkVfRUxGX1BST1Q9eQpDT05GSUdfQVJDSF9VU0VfR05VX1BST1BFUlRZPXkKQ09O
RklHX0VMRkNPUkU9eQojIENPTkZJR19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUyBp
cyBub3Qgc2V0CkNPTkZJR19CSU5GTVRfU0NSSVBUPXkKIyBDT05GSUdfQklORk1UX01JU0Mg
aXMgbm90IHNldApDT05GSUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRhYmxlIGZpbGUg
Zm9ybWF0cwoKIwojIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKIwpDT05GSUdfU1dBUD15
CiMgQ09ORklHX1pTV0FQIGlzIG5vdCBzZXQKCiMKIyBTTEFCIGFsbG9jYXRvciBvcHRpb25z
CiMKIyBDT05GSUdfU0xBQiBpcyBub3Qgc2V0CkNPTkZJR19TTFVCPXkKQ09ORklHX1NMQUJf
TUVSR0VfREVGQVVMVD15CiMgQ09ORklHX1NMQUJfRlJFRUxJU1RfUkFORE9NIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0xBQl9GUkVFTElTVF9IQVJERU5FRCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NMVUJfU1RBVFMgaXMgbm90IHNldApDT05GSUdfU0xVQl9DUFVfUEFSVElBTD15CiMgZW5k
IG9mIFNMQUIgYWxsb2NhdG9yIG9wdGlvbnMKCiMgQ09ORklHX1NIVUZGTEVfUEFHRV9BTExP
Q0FUT1IgaXMgbm90IHNldAojIENPTkZJR19DT01QQVRfQlJLIGlzIG5vdCBzZXQKQ09ORklH
X1NQQVJTRU1FTT15CkNPTkZJR19TUEFSU0VNRU1fRVhUUkVNRT15CkNPTkZJR19TUEFSU0VN
RU1fVk1FTU1BUF9FTkFCTEU9eQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVA9eQpDT05GSUdf
SEFWRV9GQVNUX0dVUD15CkNPTkZJR19BUkNIX0tFRVBfTUVNQkxPQ0s9eQpDT05GSUdfTlVN
QV9LRUVQX01FTUlORk89eQpDT05GSUdfTUVNT1JZX0lTT0xBVElPTj15CkNPTkZJR19FWENM
VVNJVkVfU1lTVEVNX1JBTT15CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllfSE9UUExVRz15
CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFPXkKQ09ORklHX01FTU9SWV9I
T1RQTFVHPXkKIyBDT05GSUdfTUVNT1JZX0hPVFBMVUdfREVGQVVMVF9PTkxJTkUgaXMgbm90
IHNldApDT05GSUdfTUVNT1JZX0hPVFJFTU9WRT15CkNPTkZJR19NSFBfTUVNTUFQX09OX01F
TU9SWT15CkNPTkZJR19TUExJVF9QVExPQ0tfQ1BVUz00CkNPTkZJR19BUkNIX0VOQUJMRV9T
UExJVF9QTURfUFRMT0NLPXkKQ09ORklHX01FTU9SWV9CQUxMT09OPXkKQ09ORklHX0JBTExP
T05fQ09NUEFDVElPTj15CkNPTkZJR19DT01QQUNUSU9OPXkKQ09ORklHX0NPTVBBQ1RfVU5F
VklDVEFCTEVfREVGQVVMVD0xCkNPTkZJR19QQUdFX1JFUE9SVElORz15CkNPTkZJR19NSUdS
QVRJT049eQpDT05GSUdfQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OPXkKQ09ORklH
X0FSQ0hfRU5BQkxFX1RIUF9NSUdSQVRJT049eQpDT05GSUdfQ09OVElHX0FMTE9DPXkKQ09O
RklHX1BIWVNfQUREUl9UXzY0QklUPXkKQ09ORklHX01NVV9OT1RJRklFUj15CkNPTkZJR19L
U009eQpDT05GSUdfREVGQVVMVF9NTUFQX01JTl9BRERSPTQwOTYKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfTUVNT1JZX0ZBSUxVUkU9eQpDT05GSUdfTUVNT1JZX0ZBSUxVUkU9eQojIENPTkZJ
R19IV1BPSVNPTl9JTkpFQ1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9XQU5UU19USFBfU1dB
UD15CkNPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRT15CkNPTkZJR19UUkFOU1BBUkVOVF9I
VUdFUEFHRV9BTFdBWVM9eQojIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRV9NQURWSVNF
IGlzIG5vdCBzZXQKQ09ORklHX1RIUF9TV0FQPXkKIyBDT05GSUdfUkVBRF9PTkxZX1RIUF9G
T1JfRlMgaXMgbm90IHNldApDT05GSUdfTkVFRF9QRVJfQ1BVX0VNQkVEX0ZJUlNUX0NIVU5L
PXkKQ09ORklHX05FRURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LPXkKQ09ORklHX1VTRV9Q
RVJDUFVfTlVNQV9OT0RFX0lEPXkKQ09ORklHX0hBVkVfU0VUVVBfUEVSX0NQVV9BUkVBPXkK
Q09ORklHX0NNQT15CiMgQ09ORklHX0NNQV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NN
QV9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01BX1NZU0ZTIGlzIG5vdCBzZXQKQ09O
RklHX0NNQV9BUkVBUz0xOQpDT05GSUdfR0VORVJJQ19FQVJMWV9JT1JFTUFQPXkKIyBDT05G
SUdfREVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lETEVf
UEFHRV9UUkFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19DQUNIRV9MSU5FX1NJ
WkU9eQpDT05GSUdfQVJDSF9IQVNfQ1VSUkVOVF9TVEFDS19QT0lOVEVSPXkKQ09ORklHX0FS
Q0hfSEFTX1BURV9ERVZNQVA9eQpDT05GSUdfWk9ORV9ETUE9eQpDT05GSUdfWk9ORV9ETUEz
Mj15CiMgQ09ORklHX1pPTkVfREVWSUNFIGlzIG5vdCBzZXQKQ09ORklHX1ZNX0VWRU5UX0NP
VU5URVJTPXkKIyBDT05GSUdfUEVSQ1BVX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfR1VQ
X1RFU1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUw9eQpDT05GSUdf
U0VDUkVUTUVNPXkKIyBDT05GSUdfQU5PTl9WTUFfTkFNRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTRVJGQVVMVEZEIGlzIG5vdCBzZXQKIyBDT05GSUdfTFJVX0dFTiBpcyBub3Qgc2V0Cgoj
CiMgRGF0YSBBY2Nlc3MgTW9uaXRvcmluZwojCiMgQ09ORklHX0RBTU9OIGlzIG5vdCBzZXQK
IyBlbmQgb2YgRGF0YSBBY2Nlc3MgTW9uaXRvcmluZwojIGVuZCBvZiBNZW1vcnkgTWFuYWdl
bWVudCBvcHRpb25zCgpDT05GSUdfTkVUPXkKQ09ORklHX05FVF9JTkdSRVNTPXkKQ09ORklH
X05FVF9FR1JFU1M9eQpDT05GSUdfU0tCX0VYVEVOU0lPTlM9eQoKIwojIE5ldHdvcmtpbmcg
b3B0aW9ucwojCkNPTkZJR19QQUNLRVQ9eQojIENPTkZJR19QQUNLRVRfRElBRyBpcyBub3Qg
c2V0CkNPTkZJR19VTklYPXkKQ09ORklHX1VOSVhfU0NNPXkKQ09ORklHX0FGX1VOSVhfT09C
PXkKIyBDT05GSUdfVU5JWF9ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfVExTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfWEZSTV9VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0tFWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1hEUF9TT0NLRVRTIGlzIG5vdCBzZXQKQ09ORklHX0lORVQ9eQpD
T05GSUdfSVBfTVVMVElDQVNUPXkKIyBDT05GSUdfSVBfQURWQU5DRURfUk9VVEVSIGlzIG5v
dCBzZXQKQ09ORklHX0lQX1BOUD15CkNPTkZJR19JUF9QTlBfREhDUD15CkNPTkZJR19JUF9Q
TlBfQk9PVFA9eQojIENPTkZJR19JUF9QTlBfUkFSUCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9JUElQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0lQR1JFX0RFTVVYIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9JUF9UVU5ORUw9bQojIENPTkZJR19JUF9NUk9VVEUgaXMgbm90IHNldAoj
IENPTkZJR19TWU5fQ09PS0lFUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9JUFZUSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9GT1UgaXMgbm90IHNldAojIENPTkZJR19ORVRfRk9VX0lQ
X1RVTk5FTFMgaXMgbm90IHNldAojIENPTkZJR19JTkVUX0FIIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5FVF9FU1AgaXMgbm90IHNldAojIENPTkZJR19JTkVUX0lQQ09NUCBpcyBub3Qgc2V0
CkNPTkZJR19JTkVUX1RVTk5FTD1tCkNPTkZJR19JTkVUX0RJQUc9eQpDT05GSUdfSU5FVF9U
Q1BfRElBRz15CiMgQ09ORklHX0lORVRfVURQX0RJQUcgaXMgbm90IHNldAojIENPTkZJR19J
TkVUX1JBV19ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVF9ESUFHX0RFU1RST1kgaXMg
bm90IHNldAojIENPTkZJR19UQ1BfQ09OR19BRFZBTkNFRCBpcyBub3Qgc2V0CkNPTkZJR19U
Q1BfQ09OR19DVUJJQz15CkNPTkZJR19ERUZBVUxUX1RDUF9DT05HPSJjdWJpYyIKIyBDT05G
SUdfVENQX01ENVNJRyBpcyBub3Qgc2V0CkNPTkZJR19JUFY2PW0KIyBDT05GSUdfSVBWNl9S
T1VURVJfUFJFRiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfT1BUSU1JU1RJQ19EQUQgaXMg
bm90IHNldAojIENPTkZJR19JTkVUNl9BSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVQ2X0VT
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVQ2X0lQQ09NUCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lQVjZfTUlQNiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfSUxBIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBWNl9WVEkgaXMgbm90IHNldApDT05GSUdfSVBWNl9TSVQ9bQojIENPTkZJR19J
UFY2X1NJVF82UkQgaXMgbm90IHNldApDT05GSUdfSVBWNl9ORElTQ19OT0RFVFlQRT15CiMg
Q09ORklHX0lQVjZfVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9NVUxUSVBMRV9U
QUJMRVMgaXMgbm90IHNldAojIENPTkZJR19JUFY2X01ST1VURSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lQVjZfU0VHNl9MV1RVTk5FTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfU0VHNl9I
TUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9SUExfTFdUVU5ORUwgaXMgbm90IHNldAoj
IENPTkZJR19JUFY2X0lPQU02X0xXVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUTEFC
RUwgaXMgbm90IHNldAojIENPTkZJR19NUFRDUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVFdP
UktfU0VDTUFSSyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfUFRQX0NMQVNTSUZZPXkKIyBDT05G
SUdfTkVUV09SS19QSFlfVElNRVNUQU1QSU5HIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRF
Uj15CkNPTkZJR19ORVRGSUxURVJfQURWQU5DRUQ9eQpDT05GSUdfQlJJREdFX05FVEZJTFRF
Uj1tCgojCiMgQ29yZSBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgojCkNPTkZJR19ORVRGSUxU
RVJfSU5HUkVTUz15CkNPTkZJR19ORVRGSUxURVJfRUdSRVNTPXkKQ09ORklHX05FVEZJTFRF
Ul9TS0lQX0VHUkVTUz15CkNPTkZJR19ORVRGSUxURVJfRkFNSUxZX0JSSURHRT15CiMgQ09O
RklHX05FVEZJTFRFUl9ORVRMSU5LX0FDQ1QgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxU
RVJfTkVUTElOS19RVUVVRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9ORVRMSU5L
X0xPRyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LX09TRiBpcyBub3Qg
c2V0CkNPTkZJR19ORl9DT05OVFJBQ0s9bQpDT05GSUdfTkZfTE9HX1NZU0xPRz1tCiMgQ09O
RklHX05GX0NPTk5UUkFDS19NQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNL
X1pPTkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX1BST0NGUyBpcyBub3Qg
c2V0CkNPTkZJR19ORl9DT05OVFJBQ0tfRVZFTlRTPXkKIyBDT05GSUdfTkZfQ09OTlRSQUNL
X1RJTUVPVVQgaXMgbm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfVElNRVNUQU1QIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX0xBQkVMUyBpcyBub3Qgc2V0CkNPTkZJ
R19ORl9DVF9QUk9UT19EQ0NQPXkKQ09ORklHX05GX0NUX1BST1RPX1NDVFA9eQpDT05GSUdf
TkZfQ1RfUFJPVE9fVURQTElURT15CiMgQ09ORklHX05GX0NPTk5UUkFDS19BTUFOREEgaXMg
bm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfRlRQIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkZfQ09OTlRSQUNLX0gzMjMgaXMgbm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfSVJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX05FVEJJT1NfTlMgaXMgbm90IHNl
dAojIENPTkZJR19ORl9DT05OVFJBQ0tfU05NUCBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0NP
Tk5UUkFDS19QUFRQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX1NBTkUgaXMg
bm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfU0lQIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkZfQ09OTlRSQUNLX1RGVFAgaXMgbm90IHNldAojIENPTkZJR19ORl9DVF9ORVRMSU5LIGlz
IG5vdCBzZXQKQ09ORklHX05GX05BVD1tCkNPTkZJR19ORl9OQVRfTUFTUVVFUkFERT15CiMg
Q09ORklHX05GX1RBQkxFUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRBQkxFUz1t
CkNPTkZJR19ORVRGSUxURVJfWFRBQkxFU19DT01QQVQ9eQoKIwojIFh0YWJsZXMgY29tYmlu
ZWQgbW9kdWxlcwojCkNPTkZJR19ORVRGSUxURVJfWFRfTUFSSz1tCiMgQ09ORklHX05FVEZJ
TFRFUl9YVF9DT05OTUFSSyBpcyBub3Qgc2V0CgojCiMgWHRhYmxlcyB0YXJnZXRzCiMKIyBD
T05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9BVURJVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRG
SUxURVJfWFRfVEFSR0VUX0NIRUNLU1VNPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9DTEFTU0lGWSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfQ09O
Tk1BUksgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0RTQ1AgaXMg
bm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0hMIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9ITUFSSyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VEZJTFRFUl9YVF9UQVJHRVRfSURMRVRJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklM
VEVSX1hUX1RBUkdFVF9MRUQgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9MT0c9bQojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX01BUksgaXMgbm90IHNldApD
T05GSUdfTkVURklMVEVSX1hUX05BVD1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRf
TkVUTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9ORkxPRyBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfTkZRVUVVRSBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfUkFURUVTVCBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfUkVESVJFQ1QgaXMgbm90IHNldApDT05GSUdf
TkVURklMVEVSX1hUX1RBUkdFVF9NQVNRVUVSQURFPW0KIyBDT05GSUdfTkVURklMVEVSX1hU
X1RBUkdFVF9URUUgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX1RQ
Uk9YWSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVENQTVNTIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9UQ1BPUFRTVFJJUCBpcyBu
b3Qgc2V0CgojCiMgWHRhYmxlcyBtYXRjaGVzCiMKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRD
SF9BRERSVFlQRT1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9CUEYgaXMgbm90IHNl
dAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ0dST1VQIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVURklMVEVSX1hUX01BVENIX0NMVVNURVIgaXMgbm90IHNldAojIENPTkZJR19ORVRG
SUxURVJfWFRfTUFUQ0hfQ09NTUVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9Y
VF9NQVRDSF9DT05OQllURVMgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFU
Q0hfQ09OTkxBQkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NP
Tk5MSU1JVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT05OTUFS
SyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTlRSQUNLPW0KIyBD
T05GSUdfTkVURklMVEVSX1hUX01BVENIX0NQVSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9EQ0NQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01B
VENIX0RFVkdST1VQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0RT
Q1AgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfRUNOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0VTUCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9IQVNITElNSVQgaXMgbm90IHNldAojIENPTkZJR19ORVRG
SUxURVJfWFRfTUFUQ0hfSEVMUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX0hMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0lQQ09N
UCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9JUFJBTkdFIGlzIG5v
dCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9JUFZTPW0KIyBDT05GSUdfTkVURklM
VEVSX1hUX01BVENIX0wyVFAgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFU
Q0hfTEVOR1RIIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0xJTUlU
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX01BQyBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9NQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVURklMVEVSX1hUX01BVENIX01VTFRJUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9ORkFDQ1QgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRf
TUFUQ0hfT1NGIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX09XTkVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1BIWVNERVYgaXMgbm90
IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUEtUVFlQRSBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9RVU9UQSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VEZJTFRFUl9YVF9NQVRDSF9SQVRFRVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVS
X1hUX01BVENIX1JFQUxNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X1JFQ0VOVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9TQ1RQIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NPQ0tFVCBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9TVEFURSBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9TVEFUSVNUSUMgaXMgbm90IHNldAojIENPTkZJR19ORVRG
SUxURVJfWFRfTUFUQ0hfU1RSSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX1RDUE1TUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9U
SU1FIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1UzMiBpcyBub3Qg
c2V0CiMgZW5kIG9mIENvcmUgTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KCiMgQ09ORklHX0lQ
X1NFVCBpcyBub3Qgc2V0CkNPTkZJR19JUF9WUz1tCiMgQ09ORklHX0lQX1ZTX0lQVjYgaXMg
bm90IHNldAojIENPTkZJR19JUF9WU19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19JUF9WU19U
QUJfQklUUz0xMgoKIwojIElQVlMgdHJhbnNwb3J0IHByb3RvY29sIGxvYWQgYmFsYW5jaW5n
IHN1cHBvcnQKIwojIENPTkZJR19JUF9WU19QUk9UT19UQ1AgaXMgbm90IHNldAojIENPTkZJ
R19JUF9WU19QUk9UT19VRFAgaXMgbm90IHNldAojIENPTkZJR19JUF9WU19QUk9UT19FU1Ag
aXMgbm90IHNldAojIENPTkZJR19JUF9WU19QUk9UT19BSCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lQX1ZTX1BST1RPX1NDVFAgaXMgbm90IHNldAoKIwojIElQVlMgc2NoZWR1bGVyCiMKIyBD
T05GSUdfSVBfVlNfUlIgaXMgbm90IHNldAojIENPTkZJR19JUF9WU19XUlIgaXMgbm90IHNl
dAojIENPTkZJR19JUF9WU19MQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX1dMQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lQX1ZTX0ZPIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfT1ZG
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfTEJMQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQ
X1ZTX0xCTENSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfREggaXMgbm90IHNldAojIENP
TkZJR19JUF9WU19TSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX01IIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVBfVlNfU0VEIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfTlEgaXMgbm90
IHNldAojIENPTkZJR19JUF9WU19UV09TIGlzIG5vdCBzZXQKCiMKIyBJUFZTIFNIIHNjaGVk
dWxlcgojCkNPTkZJR19JUF9WU19TSF9UQUJfQklUUz04CgojCiMgSVBWUyBNSCBzY2hlZHVs
ZXIKIwpDT05GSUdfSVBfVlNfTUhfVEFCX0lOREVYPTEyCgojCiMgSVBWUyBhcHBsaWNhdGlv
biBoZWxwZXIKIwojIENPTkZJR19JUF9WU19ORkNUIGlzIG5vdCBzZXQKCiMKIyBJUDogTmV0
ZmlsdGVyIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfTkZfREVGUkFHX0lQVjQ9bQojIENPTkZJ
R19ORl9TT0NLRVRfSVBWNCBpcyBub3Qgc2V0CiMgQ09ORklHX05GX1RQUk9YWV9JUFY0IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkZfRFVQX0lQVjQgaXMgbm90IHNldAojIENPTkZJR19ORl9M
T0dfQVJQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfTE9HX0lQVjQgaXMgbm90IHNldApDT05G
SUdfTkZfUkVKRUNUX0lQVjQ9bQpDT05GSUdfSVBfTkZfSVBUQUJMRVM9bQojIENPTkZJR19J
UF9ORl9NQVRDSF9BSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX01BVENIX0VDTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lQX05GX01BVENIX1JQRklMVEVSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBfTkZfTUFUQ0hfVFRMIGlzIG5vdCBzZXQKQ09ORklHX0lQX05GX0ZJTFRFUj1tCkNP
TkZJR19JUF9ORl9UQVJHRVRfUkVKRUNUPW0KIyBDT05GSUdfSVBfTkZfVEFSR0VUX1NZTlBS
T1hZIGlzIG5vdCBzZXQKQ09ORklHX0lQX05GX05BVD1tCkNPTkZJR19JUF9ORl9UQVJHRVRf
TUFTUVVFUkFERT1tCiMgQ09ORklHX0lQX05GX1RBUkdFVF9ORVRNQVAgaXMgbm90IHNldAoj
IENPTkZJR19JUF9ORl9UQVJHRVRfUkVESVJFQ1QgaXMgbm90IHNldApDT05GSUdfSVBfTkZf
TUFOR0xFPW0KIyBDT05GSUdfSVBfTkZfVEFSR0VUX0NMVVNURVJJUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0lQX05GX1RBUkdFVF9FQ04gaXMgbm90IHNldAojIENPTkZJR19JUF9ORl9UQVJH
RVRfVFRMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfTkZfUkFXIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBfTkZfU0VDVVJJVFkgaXMgbm90IHNldAojIENPTkZJR19JUF9ORl9BUlBUQUJMRVMg
aXMgbm90IHNldAojIGVuZCBvZiBJUDogTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KCiMKIyBJ
UHY2OiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgojCiMgQ09ORklHX05GX1NPQ0tFVF9JUFY2
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfVFBST1hZX0lQVjYgaXMgbm90IHNldAojIENPTkZJ
R19ORl9EVVBfSVBWNiBpcyBub3Qgc2V0CkNPTkZJR19ORl9SRUpFQ1RfSVBWNj1tCkNPTkZJ
R19ORl9MT0dfSVBWNj1tCkNPTkZJR19JUDZfTkZfSVBUQUJMRVM9bQojIENPTkZJR19JUDZf
TkZfTUFUQ0hfQUggaXMgbm90IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfRVVJNjQgaXMg
bm90IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfRlJBRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0lQNl9ORl9NQVRDSF9PUFRTIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05GX01BVENIX0hM
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05GX01BVENIX0lQVjZIRUFERVIgaXMgbm90IHNl
dAojIENPTkZJR19JUDZfTkZfTUFUQ0hfTUggaXMgbm90IHNldAojIENPTkZJR19JUDZfTkZf
TUFUQ0hfUlBGSUxURVIgaXMgbm90IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfUlQgaXMg
bm90IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfU1JIIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVA2X05GX1RBUkdFVF9ITCBpcyBub3Qgc2V0CkNPTkZJR19JUDZfTkZfRklMVEVSPW0KQ09O
RklHX0lQNl9ORl9UQVJHRVRfUkVKRUNUPW0KIyBDT05GSUdfSVA2X05GX1RBUkdFVF9TWU5Q
Uk9YWSBpcyBub3Qgc2V0CkNPTkZJR19JUDZfTkZfTUFOR0xFPW0KIyBDT05GSUdfSVA2X05G
X1JBVyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQNl9ORl9TRUNVUklUWSBpcyBub3Qgc2V0CkNP
TkZJR19JUDZfTkZfTkFUPW0KQ09ORklHX0lQNl9ORl9UQVJHRVRfTUFTUVVFUkFERT1tCiMg
Q09ORklHX0lQNl9ORl9UQVJHRVRfTlBUIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVB2NjogTmV0
ZmlsdGVyIENvbmZpZ3VyYXRpb24KCkNPTkZJR19ORl9ERUZSQUdfSVBWNj1tCiMgQ09ORklH
X05GX0NPTk5UUkFDS19CUklER0UgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfTkZfRUJU
QUJMRVMgaXMgbm90IHNldAojIENPTkZJR19CUEZJTFRFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0lQX0RDQ1AgaXMgbm90IHNldAojIENPTkZJR19JUF9TQ1RQIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkRTIGlzIG5vdCBzZXQKIyBDT05GSUdfVElQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FU
TSBpcyBub3Qgc2V0CiMgQ09ORklHX0wyVFAgaXMgbm90IHNldApDT05GSUdfU1RQPW0KQ09O
RklHX0dBUlA9bQpDT05GSUdfTVJQPW0KQ09ORklHX0JSSURHRT1tCkNPTkZJR19CUklER0Vf
SUdNUF9TTk9PUElORz15CkNPTkZJR19CUklER0VfVkxBTl9GSUxURVJJTkc9eQojIENPTkZJ
R19CUklER0VfTVJQIGlzIG5vdCBzZXQKIyBDT05GSUdfQlJJREdFX0NGTSBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfRFNBPW0KIyBDT05GSUdfTkVUX0RTQV9UQUdfQVI5MzMxIGlzIG5vdCBz
ZXQKQ09ORklHX05FVF9EU0FfVEFHX0JSQ01fQ09NTU9OPW0KQ09ORklHX05FVF9EU0FfVEFH
X0JSQ009bQpDT05GSUdfTkVUX0RTQV9UQUdfQlJDTV9MRUdBQ1k9bQpDT05GSUdfTkVUX0RT
QV9UQUdfQlJDTV9QUkVQRU5EPW0KIyBDT05GSUdfTkVUX0RTQV9UQUdfSEVMTENSRUVLIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQV9UQUdfR1NXSVAgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfRFNBX1RBR19EU0EgaXMgbm90IHNldAojIENPTkZJR19ORVRfRFNBX1RBR19FRFNB
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQV9UQUdfTVRLIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX0RTQV9UQUdfS1NaIGlzIG5vdCBzZXQKQ09ORklHX05FVF9EU0FfVEFHX09DRUxP
VD1tCkNPTkZJR19ORVRfRFNBX1RBR19PQ0VMT1RfODAyMVE9bQojIENPTkZJR19ORVRfRFNB
X1RBR19RQ0EgaXMgbm90IHNldAojIENPTkZJR19ORVRfRFNBX1RBR19SVEw0X0EgaXMgbm90
IHNldAojIENPTkZJR19ORVRfRFNBX1RBR19SVEw4XzQgaXMgbm90IHNldAojIENPTkZJR19O
RVRfRFNBX1RBR19SWk4xX0E1UFNXIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQV9UQUdf
TEFOOTMwMyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9EU0FfVEFHX1NKQTExMDUgaXMgbm90
IHNldAojIENPTkZJR19ORVRfRFNBX1RBR19UUkFJTEVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0RTQV9UQUdfWFJTNzAwWCBpcyBub3Qgc2V0CkNPTkZJR19WTEFOXzgwMjFRPW0KQ09O
RklHX1ZMQU5fODAyMVFfR1ZSUD15CkNPTkZJR19WTEFOXzgwMjFRX01WUlA9eQpDT05GSUdf
TExDPW0KIyBDT05GSUdfTExDMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FUQUxLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfWDI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTEFQQiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIT05FVCBpcyBub3Qgc2V0CiMgQ09ORklHXzZMT1dQQU4gaXMgbm90IHNldAoj
IENPTkZJR19JRUVFODAyMTU0IGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hFRD15CgojCiMg
UXVldWVpbmcvU2NoZWR1bGluZwojCiMgQ09ORklHX05FVF9TQ0hfQ0JRIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1NDSF9IVEIgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0hGU0Mg
aXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1BSSU8gaXMgbm90IHNldAojIENPTkZJR19O
RVRfU0NIX01VTFRJUSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUkVEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1NDSF9TRkIgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1NG
USBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfVEVRTCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9TQ0hfVEJGIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfQ0JTPW0KQ09ORklHX05F
VF9TQ0hfRVRGPW0KQ09ORklHX05FVF9TQ0hfVEFQUklPPW0KIyBDT05GSUdfTkVUX1NDSF9H
UkVEIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9EU01BUksgaXMgbm90IHNldAojIENP
TkZJR19ORVRfU0NIX05FVEVNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9EUlIgaXMg
bm90IHNldApDT05GSUdfTkVUX1NDSF9NUVBSSU89bQojIENPTkZJR19ORVRfU0NIX1NLQlBS
SU8gaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0NIT0tFIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1NDSF9RRlEgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0NPREVMIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1NDSF9GUV9DT0RFTCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9TQ0hfQ0FLRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRlEgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfU0NIX0hIRiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUElFIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfSU5HUkVTUz1tCiMgQ09ORklHX05FVF9TQ0hfUExV
RyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRVRTIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1NDSF9ERUZBVUxUIGlzIG5vdCBzZXQKCiMKIyBDbGFzc2lmaWNhdGlvbgojCkNPTkZJ
R19ORVRfQ0xTPXkKQ09ORklHX05FVF9DTFNfQkFTSUM9bQojIENPTkZJR19ORVRfQ0xTX1RD
SU5ERVggaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX1JPVVRFNCBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9DTFNfRlcgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX1UzMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfUlNWUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9D
TFNfUlNWUDYgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0ZMT1cgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfQ0xTX0NHUk9VUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfQlBG
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9DTFNfRkxPV0VSPW0KIyBDT05GSUdfTkVUX0NMU19N
QVRDSEFMTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9FTUFUQ0ggaXMgbm90IHNldApDT05G
SUdfTkVUX0NMU19BQ1Q9eQojIENPTkZJR19ORVRfQUNUX1BPTElDRSBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfQUNUX0dBQ1Q9bQojIENPTkZJR19HQUNUX1BST0IgaXMgbm90IHNldApDT05G
SUdfTkVUX0FDVF9NSVJSRUQ9bQojIENPTkZJR19ORVRfQUNUX1NBTVBMRSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9BQ1RfSVBUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9OQVQg
aXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX1BFRElUIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0FDVF9TSU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9TS0JFRElUIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX0FDVF9DU1VNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FD
VF9NUExTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9WTEFOIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0FDVF9CUEYgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX1NLQk1PRCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfSUZFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X0FDVF9UVU5ORUxfS0VZIGlzIG5vdCBzZXQKQ09ORklHX05FVF9BQ1RfR0FURT1tCiMgQ09O
RklHX05FVF9UQ19TS0JfRVhUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfRklGTz15CiMg
Q09ORklHX0RDQiBpcyBub3Qgc2V0CkNPTkZJR19ETlNfUkVTT0xWRVI9eQojIENPTkZJR19C
QVRNQU5fQURWIGlzIG5vdCBzZXQKIyBDT05GSUdfT1BFTlZTV0lUQ0ggaXMgbm90IHNldAoj
IENPTkZJR19WU09DS0VUUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVExJTktfRElBRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01QTFMgaXMgbm90IHNldAojIENPTkZJR19ORVRfTlNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfSFNSIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TV0lUQ0hERVY9eQoj
IENPTkZJR19ORVRfTDNfTUFTVEVSX0RFViBpcyBub3Qgc2V0CkNPTkZJR19RUlRSPW0KQ09O
RklHX1FSVFJfU01EPW0KQ09ORklHX1FSVFJfVFVOPW0KQ09ORklHX1FSVFJfTUhJPW0KIyBD
T05GSUdfTkVUX05DU0kgaXMgbm90IHNldApDT05GSUdfUENQVV9ERVZfUkVGQ05UPXkKQ09O
RklHX1JQUz15CkNPTkZJR19SRlNfQUNDRUw9eQpDT05GSUdfU09DS19SWF9RVUVVRV9NQVBQ
SU5HPXkKQ09ORklHX1hQUz15CiMgQ09ORklHX0NHUk9VUF9ORVRfUFJJTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0NHUk9VUF9ORVRfQ0xBU1NJRCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfUlhf
QlVTWV9QT0xMPXkKQ09ORklHX0JRTD15CiMgQ09ORklHX0JQRl9TVFJFQU1fUEFSU0VSIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9GTE9XX0xJTUlUPXkKCiMKIyBOZXR3b3JrIHRlc3RpbmcK
IwojIENPTkZJR19ORVRfUEtUR0VOIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29yayB0ZXN0
aW5nCiMgZW5kIG9mIE5ldHdvcmtpbmcgb3B0aW9ucwoKIyBDT05GSUdfSEFNUkFESU8gaXMg
bm90IHNldApDT05GSUdfQ0FOPW0KQ09ORklHX0NBTl9SQVc9bQpDT05GSUdfQ0FOX0JDTT1t
CkNPTkZJR19DQU5fR1c9bQojIENPTkZJR19DQU5fSjE5MzkgaXMgbm90IHNldAojIENPTkZJ
R19DQU5fSVNPVFAgaXMgbm90IHNldApDT05GSUdfQlQ9bQpDT05GSUdfQlRfQlJFRFI9eQoj
IENPTkZJR19CVF9SRkNPTU0gaXMgbm90IHNldAojIENPTkZJR19CVF9CTkVQIGlzIG5vdCBz
ZXQKQ09ORklHX0JUX0hJRFA9bQojIENPTkZJR19CVF9IUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0JUX0xFIGlzIG5vdCBzZXQKQ09ORklHX0JUX0xFRFM9eQojIENPTkZJR19CVF9NU0ZURVhU
IGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfQU9TUEVYVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JU
X0RFQlVHRlMgaXMgbm90IHNldAojIENPTkZJR19CVF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0JUX0ZFQVRVUkVfREVCVUcgaXMgbm90IHNldAoKIwojIEJsdWV0b290aCBkZXZp
Y2UgZHJpdmVycwojCkNPTkZJR19CVF9JTlRFTD1tCkNPTkZJR19CVF9CQ009bQpDT05GSUdf
QlRfUlRMPW0KQ09ORklHX0JUX1FDQT1tCkNPTkZJR19CVF9IQ0lCVFVTQj1tCiMgQ09ORklH
X0JUX0hDSUJUVVNCX0FVVE9TVVNQRU5EIGlzIG5vdCBzZXQKQ09ORklHX0JUX0hDSUJUVVNC
X0JDTT15CiMgQ09ORklHX0JUX0hDSUJUVVNCX01USyBpcyBub3Qgc2V0CkNPTkZJR19CVF9I
Q0lCVFVTQl9SVEw9eQojIENPTkZJR19CVF9IQ0lCVFNESU8gaXMgbm90IHNldApDT05GSUdf
QlRfSENJVUFSVD1tCkNPTkZJR19CVF9IQ0lVQVJUX1NFUkRFVj15CkNPTkZJR19CVF9IQ0lV
QVJUX0g0PXkKIyBDT05GSUdfQlRfSENJVUFSVF9OT0tJQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JUX0hDSVVBUlRfQkNTUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX0hDSVVBUlRfQVRIM0sg
aXMgbm90IHNldApDT05GSUdfQlRfSENJVUFSVF9MTD15CiMgQ09ORklHX0JUX0hDSVVBUlRf
M1dJUkUgaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lVQVJUX0lOVEVMIGlzIG5vdCBzZXQK
Q09ORklHX0JUX0hDSVVBUlRfQkNNPXkKIyBDT05GSUdfQlRfSENJVUFSVF9SVEwgaXMgbm90
IHNldApDT05GSUdfQlRfSENJVUFSVF9RQ0E9eQojIENPTkZJR19CVF9IQ0lVQVJUX0FHNlhY
IGlzIG5vdCBzZXQKQ09ORklHX0JUX0hDSVVBUlRfTVJWTD15CiMgQ09ORklHX0JUX0hDSUJD
TTIwM1ggaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lCUEExMFggaXMgbm90IHNldAojIENP
TkZJR19CVF9IQ0lCRlVTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX0hDSVZIQ0kgaXMgbm90
IHNldApDT05GSUdfQlRfTVJWTD1tCkNPTkZJR19CVF9NUlZMX1NESU89bQojIENPTkZJR19C
VF9BVEgzSyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX01US1NESU8gaXMgbm90IHNldAojIENP
TkZJR19CVF9NVEtVQVJUIGlzIG5vdCBzZXQKQ09ORklHX0JUX1FDT01TTUQ9bQojIENPTkZJ
R19CVF9WSVJUSU8gaXMgbm90IHNldAojIGVuZCBvZiBCbHVldG9vdGggZGV2aWNlIGRyaXZl
cnMKCiMgQ09ORklHX0FGX1JYUlBDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZfS0NNIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUNUUCBpcyBub3Qgc2V0CkNPTkZJR19XSVJFTEVTUz15CkNPTkZJ
R19DRkc4MDIxMT1tCiMgQ09ORklHX05MODAyMTFfVEVTVE1PREUgaXMgbm90IHNldAojIENP
TkZJR19DRkc4MDIxMV9ERVZFTE9QRVJfV0FSTklOR1MgaXMgbm90IHNldApDT05GSUdfQ0ZH
ODAyMTFfUkVRVUlSRV9TSUdORURfUkVHREI9eQpDT05GSUdfQ0ZHODAyMTFfVVNFX0tFUk5F
TF9SRUdEQl9LRVlTPXkKQ09ORklHX0NGRzgwMjExX0RFRkFVTFRfUFM9eQojIENPTkZJR19D
Rkc4MDIxMV9ERUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0NGRzgwMjExX0NSREFfU1VQUE9S
VD15CiMgQ09ORklHX0NGRzgwMjExX1dFWFQgaXMgbm90IHNldApDT05GSUdfTUFDODAyMTE9
bQpDT05GSUdfTUFDODAyMTFfSEFTX1JDPXkKQ09ORklHX01BQzgwMjExX1JDX01JTlNUUkVM
PXkKQ09ORklHX01BQzgwMjExX1JDX0RFRkFVTFRfTUlOU1RSRUw9eQpDT05GSUdfTUFDODAy
MTFfUkNfREVGQVVMVD0ibWluc3RyZWxfaHQiCiMgQ09ORklHX01BQzgwMjExX01FU0ggaXMg
bm90IHNldApDT05GSUdfTUFDODAyMTFfTEVEUz15CiMgQ09ORklHX01BQzgwMjExX0RFQlVH
RlMgaXMgbm90IHNldAojIENPTkZJR19NQUM4MDIxMV9NRVNTQUdFX1RSQUNJTkcgaXMgbm90
IHNldAojIENPTkZJR19NQUM4MDIxMV9ERUJVR19NRU5VIGlzIG5vdCBzZXQKQ09ORklHX01B
QzgwMjExX1NUQV9IQVNIX01BWF9TSVpFPTAKQ09ORklHX1JGS0lMTD1tCkNPTkZJR19SRktJ
TExfTEVEUz15CkNPTkZJR19SRktJTExfSU5QVVQ9eQojIENPTkZJR19SRktJTExfR1BJTyBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfOVA9eQpDT05GSUdfTkVUXzlQX0ZEPXkKQ09ORklHX05F
VF85UF9WSVJUSU89eQojIENPTkZJR19ORVRfOVBfWEVOIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUXzlQX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FJRiBpcyBub3Qgc2V0CiMgQ09O
RklHX0NFUEhfTElCIGlzIG5vdCBzZXQKQ09ORklHX05GQz1tCiMgQ09ORklHX05GQ19ESUdJ
VEFMIGlzIG5vdCBzZXQKQ09ORklHX05GQ19OQ0k9bQojIENPTkZJR19ORkNfTkNJX1NQSSBp
cyBub3Qgc2V0CiMgQ09ORklHX05GQ19OQ0lfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX05G
Q19IQ0kgaXMgbm90IHNldAoKIwojIE5lYXIgRmllbGQgQ29tbXVuaWNhdGlvbiAoTkZDKSBk
ZXZpY2VzCiMKIyBDT05GSUdfTkZDX1ZJUlRVQUxfTkNJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkZDX0ZEUCBpcyBub3Qgc2V0CiMgQ09ORklHX05GQ19QTjUzM19VU0IgaXMgbm90IHNldAoj
IENPTkZJR19ORkNfUE41MzNfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZDX1BONTMyX1VB
UlQgaXMgbm90IHNldAojIENPTkZJR19ORkNfTVJWTF9VU0IgaXMgbm90IHNldAojIENPTkZJ
R19ORkNfU1RfTkNJX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX05GQ19TVF9OQ0lfU1BJIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkZDX05YUF9OQ0kgaXMgbm90IHNldApDT05GSUdfTkZDX1Mz
RldSTjU9bQpDT05GSUdfTkZDX1MzRldSTjVfSTJDPW0KIyBDT05GSUdfTkZDX1MzRldSTjgy
X1VBUlQgaXMgbm90IHNldAojIGVuZCBvZiBOZWFyIEZpZWxkIENvbW11bmljYXRpb24gKE5G
QykgZGV2aWNlcwoKIyBDT05GSUdfUFNBTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9J
RkUgaXMgbm90IHNldAojIENPTkZJR19MV1RVTk5FTCBpcyBub3Qgc2V0CkNPTkZJR19EU1Rf
Q0FDSEU9eQpDT05GSUdfR1JPX0NFTExTPXkKQ09ORklHX05FVF9TRUxGVEVTVFM9eQpDT05G
SUdfTkVUX1NPQ0tfTVNHPXkKQ09ORklHX05FVF9ERVZMSU5LPXkKQ09ORklHX1BBR0VfUE9P
TD15CkNPTkZJR19QQUdFX1BPT0xfU1RBVFM9eQpDT05GSUdfRkFJTE9WRVI9eQpDT05GSUdf
RVRIVE9PTF9ORVRMSU5LPXkKCiMKIyBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19BUk1fQU1C
QT15CkNPTkZJR19URUdSQV9BSEI9eQpDT05GSUdfSEFWRV9QQ0k9eQpDT05GSUdfUENJPXkK
Q09ORklHX1BDSV9ET01BSU5TPXkKQ09ORklHX1BDSV9ET01BSU5TX0dFTkVSSUM9eQpDT05G
SUdfUENJX1NZU0NBTEw9eQpDT05GSUdfUENJRVBPUlRCVVM9eQojIENPTkZJR19IT1RQTFVH
X1BDSV9QQ0lFIGlzIG5vdCBzZXQKQ09ORklHX1BDSUVBRVI9eQojIENPTkZJR19QQ0lFQUVS
X0lOSkVDVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfRUNSQyBpcyBub3Qgc2V0CkNPTkZJ
R19QQ0lFQVNQTT15CkNPTkZJR19QQ0lFQVNQTV9ERUZBVUxUPXkKIyBDT05GSUdfUENJRUFT
UE1fUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRUFTUE1fUE9XRVJfU1VQRVJT
QVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRUFTUE1fUEVSRk9STUFOQ0UgaXMgbm90IHNl
dApDT05GSUdfUENJRV9QTUU9eQojIENPTkZJR19QQ0lFX0RQQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1BDSUVfUFRNIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9NU0k9eQpDT05GSUdfUENJX01T
SV9JUlFfRE9NQUlOPXkKQ09ORklHX1BDSV9RVUlSS1M9eQojIENPTkZJR19QQ0lfREVCVUcg
aXMgbm90IHNldAojIENPTkZJR19QQ0lfUkVBTExPQ19FTkFCTEVfQVVUTyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BDSV9TVFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX1BGX1NUVUIgaXMg
bm90IHNldApDT05GSUdfUENJX0FUUz15CkNPTkZJR19QQ0lfRUNBTT15CkNPTkZJR19QQ0lf
QlJJREdFX0VNVUw9eQpDT05GSUdfUENJX0lPVj15CiMgQ09ORklHX1BDSV9QUkkgaXMgbm90
IHNldApDT05GSUdfUENJX1BBU0lEPXkKQ09ORklHX1BDSV9MQUJFTD15CkNPTkZJR19WR0Ff
QVJCPXkKQ09ORklHX1ZHQV9BUkJfTUFYX0dQVVM9MTYKQ09ORklHX0hPVFBMVUdfUENJPXkK
Q09ORklHX0hPVFBMVUdfUENJX0FDUEk9eQojIENPTkZJR19IT1RQTFVHX1BDSV9BQ1BJX0lC
TSBpcyBub3Qgc2V0CiMgQ09ORklHX0hPVFBMVUdfUENJX0NQQ0kgaXMgbm90IHNldAojIENP
TkZJR19IT1RQTFVHX1BDSV9TSFBDIGlzIG5vdCBzZXQKCiMKIyBQQ0kgY29udHJvbGxlciBk
cml2ZXJzCiMKQ09ORklHX1BDSV9BQVJEVkFSSz15CiMgQ09ORklHX1BDSUVfWElMSU5YX05X
TCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9GVFBDSTEwMCBpcyBub3Qgc2V0CkNPTkZJR19Q
Q0lfVEVHUkE9eQpDT05GSUdfUENJRV9SQ0FSX0hPU1Q9eQpDT05GSUdfUENJRV9SQ0FSX0VQ
PXkKQ09ORklHX1BDSV9IT1NUX0NPTU1PTj15CkNPTkZJR19QQ0lfSE9TVF9HRU5FUklDPXkK
IyBDT05GSUdfUENJRV9YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19QQ0lFX1hJTElOWF9D
UE0gaXMgbm90IHNldApDT05GSUdfUENJX1hHRU5FPXkKQ09ORklHX1BDSV9YR0VORV9NU0k9
eQpDT05GSUdfUENJRV9JUFJPQz15CkNPTkZJR19QQ0lFX0lQUk9DX1BMQVRGT1JNPXkKQ09O
RklHX1BDSUVfSVBST0NfTVNJPXkKQ09ORklHX1BDSUVfQUxURVJBPXkKQ09ORklHX1BDSUVf
QUxURVJBX01TST15CkNPTkZJR19QQ0lfSE9TVF9USFVOREVSX1BFTT15CkNPTkZJR19QQ0lf
SE9TVF9USFVOREVSX0VDQU09eQpDT05GSUdfUENJRV9ST0NLQ0hJUD15CkNPTkZJR19QQ0lF
X1JPQ0tDSElQX0hPU1Q9bQojIENPTkZJR19QQ0lFX1JPQ0tDSElQX0VQIGlzIG5vdCBzZXQK
IyBDT05GSUdfUENJRV9NRURJQVRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfTUVESUFU
RUtfR0VOMyBpcyBub3Qgc2V0CkNPTkZJR19QQ0lFX0JSQ01TVEI9bQojIENPTkZJR19QQ0lF
X01JQ1JPQ0hJUF9IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9ISVNJX0VSUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BDSUVfQVBQTEUgaXMgbm90IHNldAoKIwojIERlc2lnbldhcmUg
UENJIENvcmUgU3VwcG9ydAojCkNPTkZJR19QQ0lFX0RXPXkKQ09ORklHX1BDSUVfRFdfSE9T
VD15CiMgQ09ORklHX1BDSUVfRFdfUExBVF9IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJ
RV9EV19QTEFUX0VQIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0VYWU5PUyBpcyBub3Qgc2V0
CkNPTkZJR19QQ0lfSU1YNj15CiMgQ09ORklHX1BDSV9LRVlTVE9ORV9IT1NUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUENJX0tFWVNUT05FX0VQIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9MQVlF
UlNDQVBFPXkKIyBDT05GSUdfUENJX0xBWUVSU0NBUEVfRVAgaXMgbm90IHNldApDT05GSUdf
UENJX0hJU0k9eQpDT05GSUdfUENJRV9RQ09NPXkKIyBDT05GSUdfUENJRV9RQ09NX0VQIGlz
IG5vdCBzZXQKQ09ORklHX1BDSUVfQVJNQURBXzhLPXkKIyBDT05GSUdfUENJRV9ST0NLQ0hJ
UF9EV19IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9LRUVNQkFZX0hPU1QgaXMgbm90
IHNldAojIENPTkZJR19QQ0lFX0tFRU1CQVlfRVAgaXMgbm90IHNldApDT05GSUdfUENJRV9L
SVJJTj15CkNPTkZJR19QQ0lFX0hJU0lfU1RCPXkKQ09ORklHX1BDSV9NRVNPTj1tCkNPTkZJ
R19QQ0lFX1RFR1JBMTk0PW0KQ09ORklHX1BDSUVfVEVHUkExOTRfSE9TVD1tCiMgQ09ORklH
X1BDSUVfVEVHUkExOTRfRVAgaXMgbm90IHNldApDT05GSUdfUENJRV9WSVNDT05USV9IT1NU
PXkKIyBDT05GSUdfUENJRV9VTklQSElFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfVU5J
UEhJRVJfRVAgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX0FMIGlzIG5vdCBzZXQKIyBlbmQg
b2YgRGVzaWduV2FyZSBQQ0kgQ29yZSBTdXBwb3J0CgojCiMgTW9iaXZlaWwgUENJZSBDb3Jl
IFN1cHBvcnQKIwpDT05GSUdfUENJRV9NT0JJVkVJTD15CkNPTkZJR19QQ0lFX01PQklWRUlM
X0hPU1Q9eQojIENPTkZJR19QQ0lFX01PQklWRUlMX1BMQVQgaXMgbm90IHNldApDT05GSUdf
UENJRV9MQVlFUlNDQVBFX0dFTjQ9eQojIGVuZCBvZiBNb2JpdmVpbCBQQ0llIENvcmUgU3Vw
cG9ydAoKIwojIENhZGVuY2UgUENJZSBjb250cm9sbGVycyBzdXBwb3J0CiMKIyBDT05GSUdf
UENJRV9DQURFTkNFX1BMQVRfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfQ0FERU5D
RV9QTEFUX0VQIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0o3MjFFX0hPU1QgaXMgbm90IHNl
dAojIENPTkZJR19QQ0lfSjcyMUVfRVAgaXMgbm90IHNldAojIGVuZCBvZiBDYWRlbmNlIFBD
SWUgY29udHJvbGxlcnMgc3VwcG9ydAojIGVuZCBvZiBQQ0kgY29udHJvbGxlciBkcml2ZXJz
CgojCiMgUENJIEVuZHBvaW50CiMKQ09ORklHX1BDSV9FTkRQT0lOVD15CkNPTkZJR19QQ0lf
RU5EUE9JTlRfQ09ORklHRlM9eQpDT05GSUdfUENJX0VQRl9URVNUPW0KIyBDT05GSUdfUENJ
X0VQRl9OVEIgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgRW5kcG9pbnQKCiMKIyBQQ0kgc3dp
dGNoIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX1BDSV9TV19TV0lUQ0hURUMgaXMg
bm90IHNldAojIGVuZCBvZiBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwoKIyBDT05G
SUdfQ1hMX0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BDQ0FSRCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JBUElESU8gaXMgbm90IHNldAoKIwojIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKIwpD
T05GSUdfQVVYSUxJQVJZX0JVUz15CiMgQ09ORklHX1VFVkVOVF9IRUxQRVIgaXMgbm90IHNl
dApDT05GSUdfREVWVE1QRlM9eQpDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQojIENPTkZJR19E
RVZUTVBGU19TQUZFIGlzIG5vdCBzZXQKQ09ORklHX1NUQU5EQUxPTkU9eQpDT05GSUdfUFJF
VkVOVF9GSVJNV0FSRV9CVUlMRD15CgojCiMgRmlybXdhcmUgbG9hZGVyCiMKQ09ORklHX0ZX
X0xPQURFUj15CkNPTkZJR19GV19MT0FERVJfUEFHRURfQlVGPXkKQ09ORklHX0ZXX0xPQURF
Ul9TWVNGUz15CkNPTkZJR19FWFRSQV9GSVJNV0FSRT0icWNvbS92ZW51cy0xLjgvdmVudXMu
bWR0IHFjb20vdmVudXMtMS44L3ZlbnVzLmIwMiBxY29tL3ZlbnVzLTEuOC92ZW51cy5iMDMg
cWNvbS92ZW51cy0xLjgvdmVudXMuYjA0IHFjb20vYXBxODAxNi93Y25zcy5tYm4gcWNvbS9h
cHE4MDE2L21iYS5tYm4gcWNvbS9hMzAwX3BtNC5mdyBxY29tL2FwcTgwMTYvV0NOU1NfcWNv
bV93bGFuX252X3NiYy5iaW4gcWNvbS9hcHE4MDE2L21vZGVtLm1ibiBxY29tL2EzMDBfcGZw
LmZ3IgpDT05GSUdfRVhUUkFfRklSTVdBUkVfRElSPSIvbG9jYWwvbW50Mi93b3Jrc3BhY2Uy
L2xpbnV4LWZpcm13YXJlIgpDT05GSUdfRldfTE9BREVSX1VTRVJfSEVMUEVSPXkKIyBDT05G
SUdfRldfTE9BREVSX1VTRVJfSEVMUEVSX0ZBTExCQUNLIGlzIG5vdCBzZXQKIyBDT05GSUdf
RldfTE9BREVSX0NPTVBSRVNTIGlzIG5vdCBzZXQKQ09ORklHX0ZXX0NBQ0hFPXkKIyBDT05G
SUdfRldfVVBMT0FEIGlzIG5vdCBzZXQKIyBlbmQgb2YgRmlybXdhcmUgbG9hZGVyCgpDT05G
SUdfV0FOVF9ERVZfQ09SRURVTVA9eQpDT05GSUdfQUxMT1dfREVWX0NPUkVEVU1QPXkKQ09O
RklHX0RFVl9DT1JFRFVNUD15CiMgQ09ORklHX0RFQlVHX0RSSVZFUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX0RFVlJFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1RFU1RfRFJJ
VkVSX1JFTU9WRSBpcyBub3Qgc2V0CkNPTkZJR19ITUVNX1JFUE9SVElORz15CiMgQ09ORklH
X1RFU1RfQVNZTkNfRFJJVkVSX1BST0JFIGlzIG5vdCBzZXQKQ09ORklHX1NZU19IWVBFUlZJ
U09SPXkKQ09ORklHX0dFTkVSSUNfQ1BVX0FVVE9QUk9CRT15CkNPTkZJR19HRU5FUklDX0NQ
VV9WVUxORVJBQklMSVRJRVM9eQpDT05GSUdfU09DX0JVUz15CkNPTkZJR19SRUdNQVA9eQpD
T05GSUdfUkVHTUFQX0kyQz15CkNPTkZJR19SRUdNQVBfU0xJTUJVUz1tCkNPTkZJR19SRUdN
QVBfU1BJPXkKQ09ORklHX1JFR01BUF9TUE1JPXkKQ09ORklHX1JFR01BUF9NTUlPPXkKQ09O
RklHX1JFR01BUF9JUlE9eQpDT05GSUdfUkVHTUFQX1NPVU5EV0lSRT1tCkNPTkZJR19ETUFf
U0hBUkVEX0JVRkZFUj15CiMgQ09ORklHX0RNQV9GRU5DRV9UUkFDRSBpcyBub3Qgc2V0CkNP
TkZJR19HRU5FUklDX0FSQ0hfVE9QT0xPR1k9eQpDT05GSUdfR0VORVJJQ19BUkNIX05VTUE9
eQojIGVuZCBvZiBHZW5lcmljIERyaXZlciBPcHRpb25zCgojCiMgQnVzIGRldmljZXMKIwpD
T05GSUdfQVJNX0NDST15CkNPTkZJR19BUk1fQ0NJNDAwX0NPTU1PTj15CkNPTkZJR19CUkNN
U1RCX0dJU0JfQVJCPXkKIyBDT05GSUdfTU9YVEVUIGlzIG5vdCBzZXQKQ09ORklHX0hJU0lM
SUNPTl9MUEM9eQojIENPTkZJR19JTVhfV0VJTSBpcyBub3Qgc2V0CkNPTkZJR19RQ09NX0VC
STI9eQojIENPTkZJR19RQ09NX1NTQ19CTE9DS19CVVMgaXMgbm90IHNldApDT05GSUdfU1VO
NTBJX0RFMl9CVVM9eQpDT05GSUdfU1VOWElfUlNCPXkKQ09ORklHX1RFR1JBX0FDT05ORUNU
PW0KIyBDT05GSUdfVEVHUkFfR01JIGlzIG5vdCBzZXQKQ09ORklHX1VOSVBISUVSX1NZU1RF
TV9CVVM9eQpDT05GSUdfVkVYUFJFU1NfQ09ORklHPXkKQ09ORklHX0ZTTF9NQ19CVVM9eQoj
IENPTkZJR19GU0xfTUNfVUFQSV9TVVBQT1JUIGlzIG5vdCBzZXQKQ09ORklHX01ISV9CVVM9
bQojIENPTkZJR19NSElfQlVTX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJX0JVU19Q
Q0lfR0VORVJJQyBpcyBub3Qgc2V0CiMgQ09ORklHX01ISV9CVVNfRVAgaXMgbm90IHNldAoj
IGVuZCBvZiBCdXMgZGV2aWNlcwoKIyBDT05GSUdfQ09OTkVDVE9SIGlzIG5vdCBzZXQKCiMK
IyBGaXJtd2FyZSBEcml2ZXJzCiMKCiMKIyBBUk0gU3lzdGVtIENvbnRyb2wgYW5kIE1hbmFn
ZW1lbnQgSW50ZXJmYWNlIFByb3RvY29sCiMKQ09ORklHX0FSTV9TQ01JX1BST1RPQ09MPXkK
Q09ORklHX0FSTV9TQ01JX0hBVkVfVFJBTlNQT1JUPXkKQ09ORklHX0FSTV9TQ01JX0hBVkVf
U0hNRU09eQpDT05GSUdfQVJNX1NDTUlfSEFWRV9NU0c9eQpDT05GSUdfQVJNX1NDTUlfVFJB
TlNQT1JUX01BSUxCT1g9eQpDT05GSUdfQVJNX1NDTUlfVFJBTlNQT1JUX09QVEVFPXkKQ09O
RklHX0FSTV9TQ01JX1RSQU5TUE9SVF9TTUM9eQojIENPTkZJR19BUk1fU0NNSV9UUkFOU1BP
UlRfU01DX0FUT01JQ19FTkFCTEUgaXMgbm90IHNldAojIENPTkZJR19BUk1fU0NNSV9UUkFO
U1BPUlRfVklSVElPIGlzIG5vdCBzZXQKQ09ORklHX0FSTV9TQ01JX1BPV0VSX0RPTUFJTj15
CiMgQ09ORklHX0FSTV9TQ01JX1BPV0VSX0NPTlRST0wgaXMgbm90IHNldAojIGVuZCBvZiBB
Uk0gU3lzdGVtIENvbnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFByb3RvY29sCgpD
T05GSUdfQVJNX1NDUElfUFJPVE9DT0w9eQpDT05GSUdfQVJNX1NDUElfUE9XRVJfRE9NQUlO
PXkKIyBDT05GSUdfQVJNX1NERV9JTlRFUkZBQ0UgaXMgbm90IHNldApDT05GSUdfRE1JSUQ9
eQojIENPTkZJR19ETUlfU1lTRlMgaXMgbm90IHNldAojIENPTkZJR19JU0NTSV9JQkZUIGlz
IG5vdCBzZXQKQ09ORklHX1JBU1BCRVJSWVBJX0ZJUk1XQVJFPXkKIyBDT05GSUdfRldfQ0ZH
X1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVMX1NUUkFUSVgxMF9TRVJWSUNFPXkKQ09O
RklHX0lOVEVMX1NUUkFUSVgxMF9SU1U9bQpDT05GSUdfUUNPTV9TQ009eQojIENPTkZJR19R
Q09NX1NDTV9ET1dOTE9BRF9NT0RFX0RFRkFVTFQgaXMgbm90IHNldApDT05GSUdfU1lTRkI9
eQojIENPTkZJR19TWVNGQl9TSU1QTEVGQiBpcyBub3Qgc2V0CkNPTkZJR19USV9TQ0lfUFJP
VE9DT0w9eQojIENPTkZJR19UVVJSSVNfTU9YX1JXVE0gaXMgbm90IHNldAojIENPTkZJR19B
Uk1fRkZBX1RSQU5TUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19URUVfQk5YVF9GVz15CiMgQ09O
RklHX0dPT0dMRV9GSVJNV0FSRSBpcyBub3Qgc2V0CgojCiMgRUZJIChFeHRlbnNpYmxlIEZp
cm13YXJlIEludGVyZmFjZSkgU3VwcG9ydAojCkNPTkZJR19FRklfRVNSVD15CkNPTkZJR19F
RklfVkFSU19QU1RPUkU9eQojIENPTkZJR19FRklfVkFSU19QU1RPUkVfREVGQVVMVF9ESVNB
QkxFIGlzIG5vdCBzZXQKQ09ORklHX0VGSV9TT0ZUX1JFU0VSVkU9eQpDT05GSUdfRUZJX1BB
UkFNU19GUk9NX0ZEVD15CkNPTkZJR19FRklfUlVOVElNRV9XUkFQUEVSUz15CkNPTkZJR19F
RklfR0VORVJJQ19TVFVCPXkKIyBDT05GSUdfRUZJX1pCT09UIGlzIG5vdCBzZXQKQ09ORklH
X0VGSV9BUk1TVFVCX0RUQl9MT0FERVI9eQojIENPTkZJR19FRklfR0VORVJJQ19TVFVCX0lO
SVRSRF9DTURMSU5FX0xPQURFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9CT09UTE9BREVS
X0NPTlRST0wgaXMgbm90IHNldApDT05GSUdfRUZJX0NBUFNVTEVfTE9BREVSPXkKIyBDT05G
SUdfRUZJX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9BVFRBQ0tfTUlUSUdBVElP
TiBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9ESVNBQkxFX1BDSV9ETUEgaXMgbm90IHNldApD
T05GSUdfRUZJX0VBUkxZQ09OPXkKQ09ORklHX0VGSV9DVVNUT01fU1NEVF9PVkVSTEFZUz15
CiMgQ09ORklHX0VGSV9ESVNBQkxFX1JVTlRJTUUgaXMgbm90IHNldAojIENPTkZJR19FRklf
Q09DT19TRUNSRVQgaXMgbm90IHNldAojIGVuZCBvZiBFRkkgKEV4dGVuc2libGUgRmlybXdh
cmUgSW50ZXJmYWNlKSBTdXBwb3J0CgpDT05GSUdfVUVGSV9DUEVSPXkKQ09ORklHX1VFRklf
Q1BFUl9BUk09eQojIENPTkZJR19JTVhfRFNQIGlzIG5vdCBzZXQKQ09ORklHX0lNWF9TQ1U9
eQpDT05GSUdfSU1YX1NDVV9QRD15CkNPTkZJR19NRVNPTl9TTT15CkNPTkZJR19BUk1fUFND
SV9GVz15CiMgQ09ORklHX0FSTV9QU0NJX0NIRUNLRVIgaXMgbm90IHNldApDT05GSUdfSEFW
RV9BUk1fU01DQ0M9eQpDT05GSUdfSEFWRV9BUk1fU01DQ0NfRElTQ09WRVJZPXkKQ09ORklH
X0FSTV9TTUNDQ19TT0NfSUQ9eQoKIwojIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCkNPTkZJ
R19URUdSQV9JVkM9eQpDT05GSUdfVEVHUkFfQlBNUD15CiMgZW5kIG9mIFRlZ3JhIGZpcm13
YXJlIGRyaXZlcgoKIwojIFp5bnEgTVBTb0MgRmlybXdhcmUgRHJpdmVycwojCkNPTkZJR19a
WU5RTVBfRklSTVdBUkU9eQojIENPTkZJR19aWU5RTVBfRklSTVdBUkVfREVCVUcgaXMgbm90
IHNldAojIGVuZCBvZiBaeW5xIE1QU29DIEZpcm13YXJlIERyaXZlcnMKIyBlbmQgb2YgRmly
bXdhcmUgRHJpdmVycwoKQ09ORklHX0dOU1M9bQpDT05GSUdfR05TU19TRVJJQUw9bQpDT05G
SUdfR05TU19NVEtfU0VSSUFMPW0KIyBDT05GSUdfR05TU19TSVJGX1NFUklBTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0dOU1NfVUJYX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX0dOU1Nf
VVNCIGlzIG5vdCBzZXQKQ09ORklHX01URD15CiMgQ09ORklHX01URF9URVNUUyBpcyBub3Qg
c2V0CgojCiMgUGFydGl0aW9uIHBhcnNlcnMKIwojIENPTkZJR19NVERfQVI3X1BBUlRTIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX0NNRExJTkVfUEFSVFMgaXMgbm90IHNldApDT05GSUdf
TVREX09GX1BBUlRTPXkKQ09ORklHX01URF9PRl9QQVJUU19CQ000OTA4PXkKIyBDT05GSUdf
TVREX09GX1BBUlRTX0xJTktTWVNfTlMgaXMgbm90IHNldAojIENPTkZJR19NVERfQUZTX1BB
UlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1BBUlNFUl9UUlggaXMgbm90IHNldAojIENP
TkZJR19NVERfUkVEQk9PVF9QQVJUUyBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9RQ09NU01F
TV9QQVJUUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFBhcnRpdGlvbiBwYXJzZXJzCgojCiMgVXNl
ciBNb2R1bGVzIEFuZCBUcmFuc2xhdGlvbiBMYXllcnMKIwpDT05GSUdfTVREX0JMS0RFVlM9
eQpDT05GSUdfTVREX0JMT0NLPXkKCiMKIyBOb3RlIHRoYXQgaW4gc29tZSBjYXNlcyBVQkkg
YmxvY2sgaXMgcHJlZmVycmVkLiBTZWUgTVREX1VCSV9CTE9DSy4KIwojIENPTkZJR19GVEwg
aXMgbm90IHNldAojIENPTkZJR19ORlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5GVEwgaXMg
bm90IHNldAojIENPTkZJR19SRkRfRlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfU1NGREMgaXMg
bm90IHNldAojIENPTkZJR19TTV9GVEwgaXMgbm90IHNldAojIENPTkZJR19NVERfT09QUyBp
cyBub3Qgc2V0CiMgQ09ORklHX01URF9TV0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1BB
UlRJVElPTkVEX01BU1RFUiBpcyBub3Qgc2V0CgojCiMgUkFNL1JPTS9GbGFzaCBjaGlwIGRy
aXZlcnMKIwpDT05GSUdfTVREX0NGST15CiMgQ09ORklHX01URF9KRURFQ1BST0JFIGlzIG5v
dCBzZXQKQ09ORklHX01URF9HRU5fUFJPQkU9eQpDT05GSUdfTVREX0NGSV9BRFZfT1BUSU9O
Uz15CkNPTkZJR19NVERfQ0ZJX05PU1dBUD15CiMgQ09ORklHX01URF9DRklfQkVfQllURV9T
V0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0NGSV9MRV9CWVRFX1NXQVAgaXMgbm90IHNl
dAojIENPTkZJR19NVERfQ0ZJX0dFT01FVFJZIGlzIG5vdCBzZXQKQ09ORklHX01URF9NQVBf
QkFOS19XSURUSF8xPXkKQ09ORklHX01URF9NQVBfQkFOS19XSURUSF8yPXkKQ09ORklHX01U
RF9NQVBfQkFOS19XSURUSF80PXkKQ09ORklHX01URF9DRklfSTE9eQpDT05GSUdfTVREX0NG
SV9JMj15CiMgQ09ORklHX01URF9PVFAgaXMgbm90IHNldApDT05GSUdfTVREX0NGSV9JTlRF
TEVYVD15CkNPTkZJR19NVERfQ0ZJX0FNRFNURD15CkNPTkZJR19NVERfQ0ZJX1NUQUE9eQpD
T05GSUdfTVREX0NGSV9VVElMPXkKIyBDT05GSUdfTVREX1JBTSBpcyBub3Qgc2V0CiMgQ09O
RklHX01URF9ST00gaXMgbm90IHNldAojIENPTkZJR19NVERfQUJTRU5UIGlzIG5vdCBzZXQK
IyBlbmQgb2YgUkFNL1JPTS9GbGFzaCBjaGlwIGRyaXZlcnMKCiMKIyBNYXBwaW5nIGRyaXZl
cnMgZm9yIGNoaXAgYWNjZXNzCiMKIyBDT05GSUdfTVREX0NPTVBMRVhfTUFQUElOR1MgaXMg
bm90IHNldApDT05GSUdfTVREX1BIWVNNQVA9eQojIENPTkZJR19NVERfUEhZU01BUF9DT01Q
QVQgaXMgbm90IHNldApDT05GSUdfTVREX1BIWVNNQVBfT0Y9eQojIENPTkZJR19NVERfUEhZ
U01BUF9WRVJTQVRJTEUgaXMgbm90IHNldAojIENPTkZJR19NVERfUEhZU01BUF9HRU1JTkkg
aXMgbm90IHNldAojIENPTkZJR19NVERfSU5URUxfVlJfTk9SIGlzIG5vdCBzZXQKIyBDT05G
SUdfTVREX1BMQVRSQU0gaXMgbm90IHNldAojIGVuZCBvZiBNYXBwaW5nIGRyaXZlcnMgZm9y
IGNoaXAgYWNjZXNzCgojCiMgU2VsZi1jb250YWluZWQgTVREIGRldmljZSBkcml2ZXJzCiMK
IyBDT05GSUdfTVREX1BNQzU1MSBpcyBub3Qgc2V0CkNPTkZJR19NVERfREFUQUZMQVNIPXkK
IyBDT05GSUdfTVREX0RBVEFGTEFTSF9XUklURV9WRVJJRlkgaXMgbm90IHNldAojIENPTkZJ
R19NVERfREFUQUZMQVNIX09UUCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9NQ0hQMjNLMjU2
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX01DSFA0OEw2NDAgaXMgbm90IHNldApDT05GSUdf
TVREX1NTVDI1TD15CiMgQ09ORklHX01URF9TTFJBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01U
RF9QSFJBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9NVERSQU0gaXMgbm90IHNldAojIENP
TkZJR19NVERfQkxPQ0syTVREIGlzIG5vdCBzZXQKCiMKIyBEaXNrLU9uLUNoaXAgRGV2aWNl
IERyaXZlcnMKIwojIENPTkZJR19NVERfRE9DRzMgaXMgbm90IHNldAojIGVuZCBvZiBTZWxm
LWNvbnRhaW5lZCBNVEQgZGV2aWNlIGRyaXZlcnMKCiMKIyBOQU5ECiMKQ09ORklHX01URF9O
QU5EX0NPUkU9eQojIENPTkZJR19NVERfT05FTkFORCBpcyBub3Qgc2V0CkNPTkZJR19NVERf
UkFXX05BTkQ9eQoKIwojIFJhdy9wYXJhbGxlbCBOQU5EIGZsYXNoIGNvbnRyb2xsZXJzCiMK
Q09ORklHX01URF9OQU5EX0RFTkFMST15CiMgQ09ORklHX01URF9OQU5EX0RFTkFMSV9QQ0kg
aXMgbm90IHNldApDT05GSUdfTVREX05BTkRfREVOQUxJX0RUPXkKIyBDT05GSUdfTVREX05B
TkRfQ0FGRSBpcyBub3Qgc2V0CkNPTkZJR19NVERfTkFORF9NQVJWRUxMPXkKQ09ORklHX01U
RF9OQU5EX0JSQ01OQU5EPW0KIyBDT05GSUdfTVREX05BTkRfQlJDTU5BTkRfQkNNNjNYWCBp
cyBub3Qgc2V0CkNPTkZJR19NVERfTkFORF9CUkNNTkFORF9CQ01CQ0E9bQpDT05GSUdfTVRE
X05BTkRfQlJDTU5BTkRfQlJDTVNUQj1tCkNPTkZJR19NVERfTkFORF9CUkNNTkFORF9JUFJP
Qz1tCkNPTkZJR19NVERfTkFORF9GU0xfSUZDPXkKIyBDT05GSUdfTVREX05BTkRfTVhDIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfU1VOWEkgaXMgbm90IHNldAojIENPTkZJR19N
VERfTkFORF9ISVNJNTA0IGlzIG5vdCBzZXQKQ09ORklHX01URF9OQU5EX1FDT009eQojIENP
TkZJR19NVERfTkFORF9NWElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfVEVHUkEg
aXMgbm90IHNldAojIENPTkZJR19NVERfTkFORF9NRVNPTiBpcyBub3Qgc2V0CiMgQ09ORklH
X01URF9OQU5EX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19NVERfTkFORF9QTEFURk9STSBp
cyBub3Qgc2V0CiMgQ09ORklHX01URF9OQU5EX0NBREVOQ0UgaXMgbm90IHNldAojIENPTkZJ
R19NVERfTkFORF9BUkFTQU4gaXMgbm90IHNldAojIENPTkZJR19NVERfTkFORF9JTlRFTF9M
R00gaXMgbm90IHNldAojIENPTkZJR19NVERfTkFORF9ST0NLQ0hJUCBpcyBub3Qgc2V0CiMg
Q09ORklHX01URF9OQU5EX1JFTkVTQVMgaXMgbm90IHNldAoKIwojIE1pc2MKIwojIENPTkZJ
R19NVERfTkFORF9OQU5EU0lNIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfUklDT0gg
aXMgbm90IHNldAojIENPTkZJR19NVERfTkFORF9ESVNLT05DSElQIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVREX1NQSV9OQU5EIGlzIG5vdCBzZXQKCiMKIyBFQ0MgZW5naW5lIHN1cHBvcnQK
IwpDT05GSUdfTVREX05BTkRfRUNDPXkKQ09ORklHX01URF9OQU5EX0VDQ19TV19IQU1NSU5H
PXkKIyBDT05GSUdfTVREX05BTkRfRUNDX1NXX0hBTU1JTkdfU01DIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVREX05BTkRfRUNDX1NXX0JDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9OQU5E
X0VDQ19NWElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfRUNDX01FRElBVEVLIGlz
IG5vdCBzZXQKIyBlbmQgb2YgRUNDIGVuZ2luZSBzdXBwb3J0CiMgZW5kIG9mIE5BTkQKCiMK
IyBMUEREUiAmIExQRERSMiBQQ00gbWVtb3J5IGRyaXZlcnMKIwojIENPTkZJR19NVERfTFBE
RFIgaXMgbm90IHNldAojIGVuZCBvZiBMUEREUiAmIExQRERSMiBQQ00gbWVtb3J5IGRyaXZl
cnMKCkNPTkZJR19NVERfU1BJX05PUj15CkNPTkZJR19NVERfU1BJX05PUl9VU0VfNEtfU0VD
VE9SUz15CiMgQ09ORklHX01URF9TUElfTk9SX1NXUF9ESVNBQkxFIGlzIG5vdCBzZXQKQ09O
RklHX01URF9TUElfTk9SX1NXUF9ESVNBQkxFX09OX1ZPTEFUSUxFPXkKIyBDT05GSUdfTVRE
X1NQSV9OT1JfU1dQX0tFRVAgaXMgbm90IHNldAojIENPTkZJR19TUElfSElTSV9TRkMgaXMg
bm90IHNldAojIENPTkZJR19NVERfVUJJIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0hZUEVS
QlVTIGlzIG5vdCBzZXQKQ09ORklHX0RUQz15CkNPTkZJR19PRj15CiMgQ09ORklHX09GX1VO
SVRURVNUIGlzIG5vdCBzZXQKQ09ORklHX09GX0ZMQVRUUkVFPXkKQ09ORklHX09GX0VBUkxZ
X0ZMQVRUUkVFPXkKQ09ORklHX09GX0tPQko9eQpDT05GSUdfT0ZfRFlOQU1JQz15CkNPTkZJ
R19PRl9BRERSRVNTPXkKQ09ORklHX09GX0lSUT15CkNPTkZJR19PRl9SRVNFUlZFRF9NRU09
eQpDT05GSUdfT0ZfUkVTT0xWRT15CkNPTkZJR19PRl9PVkVSTEFZPXkKQ09ORklHX09GX05V
TUE9eQojIENPTkZJR19QQVJQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1BOUD15CkNPTkZJR19Q
TlBfREVCVUdfTUVTU0FHRVM9eQoKIwojIFByb3RvY29scwojCkNPTkZJR19QTlBBQ1BJPXkK
Q09ORklHX0JMS19ERVY9eQojIENPTkZJR19CTEtfREVWX05VTExfQkxLIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkxLX0RFVl9QQ0lFU1NEX01USVAzMlhYIGlzIG5vdCBzZXQKQ09ORklHX0JM
S19ERVZfTE9PUD15CkNPTkZJR19CTEtfREVWX0xPT1BfTUlOX0NPVU5UPTgKIyBDT05GSUdf
QkxLX0RFVl9EUkJEIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfTkJEPW0KIyBDT05GSUdf
QkxLX0RFVl9SQU0gaXMgbm90IHNldAojIENPTkZJR19DRFJPTV9QS1RDRFZEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVRBX09WRVJfRVRIIGlzIG5vdCBzZXQKQ09ORklHX1hFTl9CTEtERVZf
RlJPTlRFTkQ9eQojIENPTkZJR19YRU5fQkxLREVWX0JBQ0tFTkQgaXMgbm90IHNldApDT05G
SUdfVklSVElPX0JMSz15CiMgQ09ORklHX0JMS19ERVZfUkJEIGlzIG5vdCBzZXQKIyBDT05G
SUdfQkxLX0RFVl9VQkxLIGlzIG5vdCBzZXQKCiMKIyBOVk1FIFN1cHBvcnQKIwpDT05GSUdf
TlZNRV9DT1JFPW0KQ09ORklHX0JMS19ERVZfTlZNRT1tCiMgQ09ORklHX05WTUVfTVVMVElQ
QVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRV9WRVJCT1NFX0VSUk9SUyBpcyBub3Qgc2V0
CiMgQ09ORklHX05WTUVfSFdNT04gaXMgbm90IHNldAojIENPTkZJR19OVk1FX0ZDIGlzIG5v
dCBzZXQKIyBDT05GSUdfTlZNRV9UQ1AgaXMgbm90IHNldAojIENPTkZJR19OVk1FX0FVVEgg
aXMgbm90IHNldAojIENPTkZJR19OVk1FX0FQUExFIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZN
RV9UQVJHRVQgaXMgbm90IHNldAojIGVuZCBvZiBOVk1FIFN1cHBvcnQKCiMKIyBNaXNjIGRl
dmljZXMKIwojIENPTkZJR19BRDUyNVhfRFBPVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RVTU1Z
X0lSUSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIQU5UT00gaXMgbm90IHNldAojIENPTkZJR19U
SUZNX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JQ1M5MzJTNDAxIGlzIG5vdCBzZXQKIyBD
T05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSEk2NDIxVjYw
MF9JUlEgaXMgbm90IHNldAojIENPTkZJR19IUF9JTE8gaXMgbm90IHNldApDT05GSUdfUUNP
TV9DT0lOQ0VMTD1tCkNPTkZJR19RQ09NX0ZBU1RSUEM9bQojIENPTkZJR19BUERTOTgwMkFM
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNM
MjkwMjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RTTDI1NTAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0JIMTc3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVBE
Uzk5MFggaXMgbm90IHNldAojIENPTkZJR19ITUM2MzUyIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFMxNjgyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEFUVElDRV9FQ1AzX0NPTkZJRyBpcyBub3Qg
c2V0CkNPTkZJR19TUkFNPXkKIyBDT05GSUdfRFdfWERBVEFfUENJRSBpcyBub3Qgc2V0CkNP
TkZJR19QQ0lfRU5EUE9JTlRfVEVTVD1tCiMgQ09ORklHX1hJTElOWF9TREZFQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJU0lfSElLRVlfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfT1BFTl9E
SUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfVkNQVV9TVEFMTF9ERVRFQ1RPUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0MyUE9SVCBpcyBub3Qgc2V0CgojCiMgRUVQUk9NIHN1cHBvcnQKIwpDT05G
SUdfRUVQUk9NX0FUMjQ9bQpDT05GSUdfRUVQUk9NX0FUMjU9bQojIENPTkZJR19FRVBST01f
TEVHQUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX01BWDY4NzUgaXMgbm90IHNldAoj
IENPTkZJR19FRVBST01fOTNDWDYgaXMgbm90IHNldAojIENPTkZJR19FRVBST01fOTNYWDQ2
IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX0lEVF84OUhQRVNYIGlzIG5vdCBzZXQKIyBD
T05GSUdfRUVQUk9NX0VFMTAwNCBpcyBub3Qgc2V0CiMgZW5kIG9mIEVFUFJPTSBzdXBwb3J0
CgojIENPTkZJR19DQjcxMF9DT1JFIGlzIG5vdCBzZXQKCiMKIyBUZXhhcyBJbnN0cnVtZW50
cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQojCiMgQ09ORklHX1RJX1NUIGlz
IG5vdCBzZXQKIyBlbmQgb2YgVGV4YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBs
aW5lIGRpc2NpcGxpbmUKCiMgQ09ORklHX1NFTlNPUlNfTElTM19JMkMgaXMgbm90IHNldAoj
IENPTkZJR19BTFRFUkFfU1RBUEwgaXMgbm90IHNldAojIENPTkZJR19WTVdBUkVfVk1DSSBp
cyBub3Qgc2V0CiMgQ09ORklHX0dFTldRRSBpcyBub3Qgc2V0CiMgQ09ORklHX0VDSE8gaXMg
bm90IHNldAojIENPTkZJR19CQ01fVksgaXMgbm90IHNldAojIENPTkZJR19NSVNDX0FMQ09S
X1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX01JU0NfUlRTWF9QQ0kgaXMgbm90IHNldAojIENP
TkZJR19NSVNDX1JUU1hfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfSEFCQU5BX0FJIGlzIG5v
dCBzZXQKQ09ORklHX1VBQ0NFPW0KIyBDT05GSUdfUFZQQU5JQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQX1BDSTFYWFhYIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2VzCgojCiMg
U0NTSSBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CkNPTkZJR19SQUlEX0FU
VFJTPW0KQ09ORklHX1NDU0lfQ09NTU9OPXkKQ09ORklHX1NDU0k9eQpDT05GSUdfU0NTSV9E
TUE9eQojIENPTkZJR19TQ1NJX1BST0NfRlMgaXMgbm90IHNldAoKIwojIFNDU0kgc3VwcG9y
dCB0eXBlIChkaXNrLCB0YXBlLCBDRC1ST00pCiMKQ09ORklHX0JMS19ERVZfU0Q9eQojIENP
TkZJR19DSFJfREVWX1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9TUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NIUl9ERVZfU0cgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9CU0c9
eQojIENPTkZJR19DSFJfREVWX1NDSCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQ09OU1RB
TlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9MT0dHSU5HIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9TQ0FOX0FTWU5DIGlzIG5vdCBzZXQKCiMKIyBTQ1NJIFRyYW5zcG9ydHMKIwoj
IENPTkZJR19TQ1NJX1NQSV9BVFRSUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfRkNfQVRU
UlMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lTQ1NJX0FUVFJTIGlzIG5vdCBzZXQKQ09O
RklHX1NDU0lfU0FTX0FUVFJTPXkKQ09ORklHX1NDU0lfU0FTX0xJQlNBUz15CkNPTkZJR19T
Q1NJX1NBU19BVEE9eQpDT05GSUdfU0NTSV9TQVNfSE9TVF9TTVA9eQojIENPTkZJR19TQ1NJ
X1NSUF9BVFRSUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgVHJhbnNwb3J0cwoKQ09ORklH
X1NDU0lfTE9XTEVWRUw9eQojIENPTkZJR19JU0NTSV9UQ1AgaXMgbm90IHNldAojIENPTkZJ
R19JU0NTSV9CT09UX1NZU0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9DWEdCM19JU0NT
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQ1hHQjRfSVNDU0kgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX0JOWDJfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19CRTJJU0NTSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfM1dfWFhYWF9SQUlEIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9IUFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV8zV185WFhYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV8zV19TQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FDQVJE
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BQUNSQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NTSV9BSUM3WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM3OVhYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9BSUM5NFhYIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfSElTSV9T
QVM9eQpDT05GSUdfU0NTSV9ISVNJX1NBU19QQ0k9eQojIENPTkZJR19TQ1NJX0hJU0lfU0FT
X0RFQlVHRlNfREVGQVVMVF9FTkFCTEUgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01WU0FT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NVlVNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1ND
U0lfQURWQU5TWVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FSQ01TUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfRVNBUzJSIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVHQVJBSURfTkVX
R0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVHQVJBSURfTEVHQUNZIGlzIG5vdCBzZXQKQ09O
RklHX01FR0FSQUlEX1NBUz15CkNPTkZJR19TQ1NJX01QVDNTQVM9bQpDT05GSUdfU0NTSV9N
UFQyU0FTX01BWF9TR0U9MTI4CkNPTkZJR19TQ1NJX01QVDNTQVNfTUFYX1NHRT0xMjgKIyBD
T05GSUdfU0NTSV9NUFQyU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NUEkzTVIgaXMg
bm90IHNldAojIENPTkZJR19TQ1NJX1NNQVJUUFFJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NT
SV9IUFRJT1AgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0JVU0xPR0lDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9NWVJCIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NWVJTIGlzIG5v
dCBzZXQKIyBDT05GSUdfWEVOX1NDU0lfRlJPTlRFTkQgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX1NOSUMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0RNWDMxOTFEIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9GRE9NQUlOX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSVBT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JTklUSU8gaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0lOSUExMDAgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NURVggaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX1NZTTUzQzhYWF8yIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JUFIg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX1FMT0dJQ18xMjgwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9RTEFfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0RDMzk1eCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfQU01M0M5NzQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X1dENzE5WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfREVCVUcgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX1BNQ1JBSUQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1BNODAwMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfVklSVElPIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9E
SCBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgZGV2aWNlIHN1cHBvcnQKCkNPTkZJR19BVEE9
eQpDT05GSUdfU0FUQV9IT1NUPXkKQ09ORklHX1BBVEFfVElNSU5HUz15CkNPTkZJR19BVEFf
VkVSQk9TRV9FUlJPUj15CkNPTkZJR19BVEFfRk9SQ0U9eQpDT05GSUdfQVRBX0FDUEk9eQoj
IENPTkZJR19TQVRBX1pQT0REIGlzIG5vdCBzZXQKQ09ORklHX1NBVEFfUE1QPXkKCiMKIyBD
b250cm9sbGVycyB3aXRoIG5vbi1TRkYgbmF0aXZlIGludGVyZmFjZQojCkNPTkZJR19TQVRB
X0FIQ0k9eQpDT05GSUdfU0FUQV9NT0JJTEVfTFBNX1BPTElDWT0wCkNPTkZJR19TQVRBX0FI
Q0lfUExBVEZPUk09eQpDT05GSUdfQUhDSV9CUkNNPW0KIyBDT05GSUdfQUhDSV9EV0MgaXMg
bm90IHNldAojIENPTkZJR19BSENJX0lNWCBpcyBub3Qgc2V0CkNPTkZJR19BSENJX0NFVkE9
eQojIENPTkZJR19BSENJX01USyBpcyBub3Qgc2V0CkNPTkZJR19BSENJX01WRUJVPXkKIyBD
T05GSUdfQUhDSV9TVU5YSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FIQ0lfVEVHUkEgaXMgbm90
IHNldApDT05GSUdfQUhDSV9YR0VORT15CkNPTkZJR19BSENJX1FPUklRPXkKIyBDT05GSUdf
U0FUQV9BSENJX1NFQVRUTEUgaXMgbm90IHNldAojIENPTkZJR19TQVRBX0lOSUMxNjJYIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0FUQV9BQ0FSRF9BSENJIGlzIG5vdCBzZXQKQ09ORklHX1NB
VEFfU0lMMjQ9eQpDT05GSUdfQVRBX1NGRj15CgojCiMgU0ZGIGNvbnRyb2xsZXJzIHdpdGgg
Y3VzdG9tIERNQSBpbnRlcmZhY2UKIwojIENPTkZJR19QRENfQURNQSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NBVEFfUVNUT1IgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1NYNCBpcyBub3Qg
c2V0CkNPTkZJR19BVEFfQk1ETUE9eQoKIwojIFNBVEEgU0ZGIGNvbnRyb2xsZXJzIHdpdGgg
Qk1ETUEKIwojIENPTkZJR19BVEFfUElJWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfRFdD
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9NViBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFf
TlYgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1BST01JU0UgaXMgbm90IHNldApDT05GSUdf
U0FUQV9SQ0FSPXkKIyBDT05GSUdfU0FUQV9TSUwgaXMgbm90IHNldAojIENPTkZJR19TQVRB
X1NJUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfU1ZXIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0FUQV9VTEkgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1ZJQSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NBVEFfVklURVNTRSBpcyBub3Qgc2V0CgojCiMgUEFUQSBTRkYgY29udHJvbGxlcnMg
d2l0aCBCTURNQQojCiMgQ09ORklHX1BBVEFfQUxJIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9BTUQgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0FSVE9QIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEFUQV9BVElJWFAgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0FUUDg2N1ggaXMgbm90
IHNldAojIENPTkZJR19QQVRBX0NNRDY0WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQ1lQ
UkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfRUZBUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1BBVEFfSFBUMzY2IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9IUFQzN1ggaXMgbm90IHNl
dAojIENPTkZJR19QQVRBX0hQVDNYMk4gaXMgbm90IHNldAojIENPTkZJR19QQVRBX0hQVDNY
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSU1YIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9JVDgyMTMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0lUODIxWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1BBVEFfSk1JQ1JPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTUFSVkVMTCBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTkVUQ0VMTCBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfTklOSkEzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTlM4NzQxNSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfT0xEUElJWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfT1BUSURN
QSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUERDMjAyN1ggaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX1BEQ19PTEQgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1JBRElTWVMgaXMgbm90
IHNldAojIENPTkZJR19QQVRBX1JEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfU0NIIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFUQV9TRVJWRVJXT1JLUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BBVEFfU0lMNjgwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9TSVMgaXMgbm90IHNldAoj
IENPTkZJR19QQVRBX1RPU0hJQkEgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1RSSUZMRVgg
aXMgbm90IHNldAojIENPTkZJR19QQVRBX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFf
V0lOQk9ORCBpcyBub3Qgc2V0CgojCiMgUElPLW9ubHkgU0ZGIGNvbnRyb2xsZXJzCiMKIyBD
T05GSUdfUEFUQV9DTUQ2NDBfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9NUElJWCBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTlM4NzQxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfT1BUSSBpcyBub3Qgc2V0CkNPTkZJR19QQVRBX1BMQVRGT1JNPXkKQ09ORklHX1BBVEFf
T0ZfUExBVEZPUk09eQojIENPTkZJR19QQVRBX1JaMTAwMCBpcyBub3Qgc2V0CgojCiMgR2Vu
ZXJpYyBmYWxsYmFjayAvIGxlZ2FjeSBkcml2ZXJzCiMKIyBDT05GSUdfUEFUQV9BQ1BJIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVRBX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19QQVRB
X0xFR0FDWSBpcyBub3Qgc2V0CkNPTkZJR19NRD15CkNPTkZJR19CTEtfREVWX01EPW0KIyBD
T05GSUdfTURfTElORUFSIGlzIG5vdCBzZXQKIyBDT05GSUdfTURfUkFJRDAgaXMgbm90IHNl
dAojIENPTkZJR19NRF9SQUlEMSBpcyBub3Qgc2V0CiMgQ09ORklHX01EX1JBSUQxMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01EX1JBSUQ0NTYgaXMgbm90IHNldAojIENPTkZJR19NRF9NVUxU
SVBBVEggaXMgbm90IHNldAojIENPTkZJR19NRF9GQVVMVFkgaXMgbm90IHNldAojIENPTkZJ
R19CQ0FDSEUgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9ETV9CVUlMVElOPXkKQ09ORklH
X0JMS19ERVZfRE09bQojIENPTkZJR19ETV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RN
X1VOU1RSSVBFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0NSWVBUIGlzIG5vdCBzZXQKIyBD
T05GSUdfRE1fU05BUFNIT1QgaXMgbm90IHNldAojIENPTkZJR19ETV9USElOX1BST1ZJU0lP
TklORyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0NBQ0hFIGlzIG5vdCBzZXQKIyBDT05GSUdf
RE1fV1JJVEVDQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0VCUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0RNX0VSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0NMT05FIGlzIG5vdCBzZXQK
Q09ORklHX0RNX01JUlJPUj1tCiMgQ09ORklHX0RNX0xPR19VU0VSU1BBQ0UgaXMgbm90IHNl
dAojIENPTkZJR19ETV9SQUlEIGlzIG5vdCBzZXQKQ09ORklHX0RNX1pFUk89bQojIENPTkZJ
R19ETV9NVUxUSVBBVEggaXMgbm90IHNldAojIENPTkZJR19ETV9ERUxBWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNX0RVU1QgaXMgbm90IHNldAojIENPTkZJR19ETV9VRVZFTlQgaXMgbm90
IHNldAojIENPTkZJR19ETV9GTEFLRVkgaXMgbm90IHNldAojIENPTkZJR19ETV9WRVJJVFkg
aXMgbm90IHNldAojIENPTkZJR19ETV9TV0lUQ0ggaXMgbm90IHNldAojIENPTkZJR19ETV9M
T0dfV1JJVEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fSU5URUdSSVRZIGlzIG5vdCBzZXQK
IyBDT05GSUdfRE1fQVVESVQgaXMgbm90IHNldAojIENPTkZJR19UQVJHRVRfQ09SRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZVU0lPTiBpcyBub3Qgc2V0CgojCiMgSUVFRSAxMzk0IChGaXJl
V2lyZSkgc3VwcG9ydAojCiMgQ09ORklHX0ZJUkVXSVJFIGlzIG5vdCBzZXQKIyBDT05GSUdf
RklSRVdJUkVfTk9TWSBpcyBub3Qgc2V0CiMgZW5kIG9mIElFRUUgMTM5NCAoRmlyZVdpcmUp
IHN1cHBvcnQKCkNPTkZJR19ORVRERVZJQ0VTPXkKQ09ORklHX01JST15CkNPTkZJR19ORVRf
Q09SRT15CiMgQ09ORklHX0JPTkRJTkcgaXMgbm90IHNldAojIENPTkZJR19EVU1NWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1dJUkVHVUFSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0VRVUFMSVpF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9GQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lGQiBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9URUFNIGlzIG5vdCBzZXQKQ09ORklHX01BQ1ZMQU49
bQpDT05GSUdfTUFDVlRBUD1tCiMgQ09ORklHX0lQVkxBTiBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZYTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfR0VORVZFIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkFSRVVEUCBpcyBub3Qgc2V0CiMgQ09ORklHX0dUUCBpcyBub3Qgc2V0CiMgQ09ORklHX0FN
VCBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ1NFQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVENP
TlNPTEUgaXMgbm90IHNldApDT05GSUdfVFVOPXkKQ09ORklHX1RBUD1tCiMgQ09ORklHX1RV
Tl9WTkVUX0NST1NTX0xFIGlzIG5vdCBzZXQKQ09ORklHX1ZFVEg9bQpDT05GSUdfVklSVElP
X05FVD15CiMgQ09ORklHX05MTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJX05FVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FSQ05FVCBpcyBub3Qgc2V0CgojCiMgRGlzdHJpYnV0ZWQgU3dp
dGNoIEFyY2hpdGVjdHVyZSBkcml2ZXJzCiMKQ09ORklHX0I1Mz1tCiMgQ09ORklHX0I1M19T
UElfRFJJVkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQjUzX01ESU9fRFJJVkVSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQjUzX01NQVBfRFJJVkVSIGlzIG5vdCBzZXQKQ09ORklHX0I1M19TUkFC
X0RSSVZFUj1tCiMgQ09ORklHX0I1M19TRVJERVMgaXMgbm90IHNldApDT05GSUdfTkVUX0RT
QV9CQ01fU0YyPW0KIyBDT05GSUdfTkVUX0RTQV9MT09QIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0RTQV9ISVJTQ0hNQU5OX0hFTExDUkVFSyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9E
U0FfTEFOVElRX0dTV0lQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQV9NVDc1MzAgaXMg
bm90IHNldAojIENPTkZJR19ORVRfRFNBX01WODhFNjA2MCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9EU0FfTUlDUk9DSElQX0tTWl9DT01NT04gaXMgbm90IHNldAojIENPTkZJR19ORVRf
RFNBX01WODhFNlhYWCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfRFNBX01TQ0NfRkVMSVg9bQoj
IENPTkZJR19ORVRfRFNBX01TQ0NfU0VWSUxMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9E
U0FfQVI5MzMxIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQV9RQ0E4SyBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9EU0FfU0pBMTEwNSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9EU0Ff
WFJTNzAwWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19ORVRfRFNBX1hSUzcwMFhfTURJTyBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9EU0FfUkVBTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9EU0FfU01TQ19MQU45MzAzX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9EU0Ff
U01TQ19MQU45MzAzX01ESU8gaXMgbm90IHNldAojIENPTkZJR19ORVRfRFNBX1ZJVEVTU0Vf
VlNDNzNYWF9TUEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfRFNBX1ZJVEVTU0VfVlNDNzNY
WF9QTEFURk9STSBpcyBub3Qgc2V0CiMgZW5kIG9mIERpc3RyaWJ1dGVkIFN3aXRjaCBBcmNo
aXRlY3R1cmUgZHJpdmVycwoKQ09ORklHX0VUSEVSTkVUPXkKQ09ORklHX01ESU89bQpDT05G
SUdfTkVUX1ZFTkRPUl8zQ09NPXkKIyBDT05GSUdfVk9SVEVYIGlzIG5vdCBzZXQKIyBDT05G
SUdfVFlQSE9PTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FDVElPTlM9eQojIENP
TkZJR19PV0xfRU1BQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FEQVBURUM9eQoj
IENPTkZJR19BREFQVEVDX1NUQVJGSVJFIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1Jf
QUdFUkU9eQojIENPTkZJR19FVDEzMVggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9B
TEFDUklURUNIPXkKIyBDT05GSUdfU0xJQ09TUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVO
RE9SX0FMTFdJTk5FUj15CiMgQ09ORklHX1NVTjRJX0VNQUMgaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9BTFRFT049eQojIENPTkZJR19BQ0VOSUMgaXMgbm90IHNldAojIENPTkZJ
R19BTFRFUkFfVFNFIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQU1BWk9OPXkKIyBD
T05GSUdfRU5BX0VUSEVSTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQU1EPXkK
IyBDT05GSUdfQU1EODExMV9FVEggaXMgbm90IHNldAojIENPTkZJR19QQ05FVDMyIGlzIG5v
dCBzZXQKQ09ORklHX0FNRF9YR0JFPXkKQ09ORklHX05FVF9YR0VORT15CiMgQ09ORklHX05F
VF9YR0VORV9WMiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FRVUFOVElBPXkKIyBD
T05GSUdfQVFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQVJDPXkKIyBDT05G
SUdfRU1BQ19ST0NLQ0hJUCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FTSVg9eQoj
IENPTkZJR19TUElfQVg4ODc5NkMgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BVEhF
Uk9TPXkKIyBDT05GSUdfQVRMMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTDEgaXMgbm90IHNl
dAojIENPTkZJR19BVEwxRSBpcyBub3Qgc2V0CkNPTkZJR19BVEwxQz1tCiMgQ09ORklHX0FM
WCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0JST0FEQ09NPXkKIyBDT05GSUdfQjQ0
IGlzIG5vdCBzZXQKQ09ORklHX0JDTTQ5MDhfRU5FVD15CkNPTkZJR19CQ01HRU5FVD1tCiMg
Q09ORklHX0JOWDIgaXMgbm90IHNldAojIENPTkZJR19DTklDIGlzIG5vdCBzZXQKIyBDT05G
SUdfVElHT04zIGlzIG5vdCBzZXQKQ09ORklHX0JOWDJYPW0KQ09ORklHX0JOWDJYX1NSSU9W
PXkKQ09ORklHX0JHTUFDPXkKQ09ORklHX0JHTUFDX1BMQVRGT1JNPXkKQ09ORklHX1NZU1RF
TVBPUlQ9bQojIENPTkZJR19CTlhUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0FE
RU5DRT15CkNPTkZJR19NQUNCPXkKQ09ORklHX01BQ0JfVVNFX0hXU1RBTVA9eQojIENPTkZJ
R19NQUNCX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0NBVklVTT15CkNPTkZJ
R19USFVOREVSX05JQ19QRj15CiMgQ09ORklHX1RIVU5ERVJfTklDX1ZGIGlzIG5vdCBzZXQK
Q09ORklHX1RIVU5ERVJfTklDX0JHWD15CkNPTkZJR19USFVOREVSX05JQ19SR1g9eQojIENP
TkZJR19DQVZJVU1fUFRQIGlzIG5vdCBzZXQKIyBDT05GSUdfTElRVUlESU8gaXMgbm90IHNl
dAojIENPTkZJR19MSVFVSURJT19WRiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0NI
RUxTSU89eQojIENPTkZJR19DSEVMU0lPX1QxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hFTFNJ
T19UMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIRUxTSU9fVDQgaXMgbm90IHNldAojIENPTkZJ
R19DSEVMU0lPX1Q0VkYgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DSVNDTz15CiMg
Q09ORklHX0VOSUMgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DT1JUSU5BPXkKIyBD
T05GSUdfR0VNSU5JX0VUSEVSTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfREFW
SUNPTT15CiMgQ09ORklHX0RNOTA1MSBpcyBub3Qgc2V0CiMgQ09ORklHX0RORVQgaXMgbm90
IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ERUM9eQojIENPTkZJR19ORVRfVFVMSVAgaXMgbm90
IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ETElOSz15CiMgQ09ORklHX0RMMksgaXMgbm90IHNl
dAojIENPTkZJR19TVU5EQU5DRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0VNVUxF
WD15CiMgQ09ORklHX0JFMk5FVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0VOR0xF
REVSPXkKIyBDT05GSUdfVFNORVAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9FWkNI
SVA9eQojIENPTkZJR19FWkNISVBfTlBTX01BTkFHRU1FTlRfRU5FVCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfVkVORE9SX0ZSRUVTQ0FMRT15CkNPTkZJR19GRUM9eQpDT05GSUdfRlNMX0ZN
QU49eQpDT05GSUdfRFBBQV9FUlJBVFVNX0EwNTAzODU9eQojIENPTkZJR19GU0xfUFFfTURJ
TyBpcyBub3Qgc2V0CkNPTkZJR19GU0xfWEdNQUNfTURJTz15CiMgQ09ORklHX0dJQU5GQVIg
aXMgbm90IHNldApDT05GSUdfRlNMX0RQQUFfRVRIPXkKQ09ORklHX0ZTTF9EUEFBMl9FVEg9
eQpDT05GSUdfRlNMX0RQQUEyX1BUUF9DTE9DSz15CiMgQ09ORklHX0ZTTF9EUEFBMl9TV0lU
Q0ggaXMgbm90IHNldApDT05GSUdfRlNMX0VORVRDPXkKQ09ORklHX0ZTTF9FTkVUQ19WRj15
CkNPTkZJR19GU0xfRU5FVENfSUVSQj15CkNPTkZJR19GU0xfRU5FVENfTURJTz15CkNPTkZJ
R19GU0xfRU5FVENfUFRQX0NMT0NLPXkKQ09ORklHX0ZTTF9FTkVUQ19RT1M9eQpDT05GSUdf
TkVUX1ZFTkRPUl9GVU5HSUJMRT15CiMgQ09ORklHX0ZVTl9FVEggaXMgbm90IHNldApDT05G
SUdfTkVUX1ZFTkRPUl9HT09HTEU9eQojIENPTkZJR19HVkUgaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9ISVNJTElDT049eQpDT05GSUdfSElYNUhEMl9HTUFDPXkKIyBDT05GSUdf
SElTSV9GRU1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJUDA0X0VUSCBpcyBub3Qgc2V0CkNP
TkZJR19ITlNfTURJTz15CkNPTkZJR19ITlM9eQpDT05GSUdfSE5TX0RTQUY9eQpDT05GSUdf
SE5TX0VORVQ9eQpDT05GSUdfSE5TMz15CkNPTkZJR19ITlMzX0hDTEdFPXkKIyBDT05GSUdf
SE5TM19IQ0xHRVZGIGlzIG5vdCBzZXQKQ09ORklHX0hOUzNfRU5FVD15CkNPTkZJR19ORVRf
VkVORE9SX0hVQVdFST15CiMgQ09ORklHX0hJTklDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfSTgyNVhYPXkKQ09ORklHX05FVF9WRU5ET1JfSU5URUw9eQojIENPTkZJR19FMTAw
IGlzIG5vdCBzZXQKQ09ORklHX0UxMDAwPXkKQ09ORklHX0UxMDAwRT15CkNPTkZJR19JR0I9
eQpDT05GSUdfSUdCX0hXTU9OPXkKQ09ORklHX0lHQlZGPXkKIyBDT05GSUdfSVhHQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lYR0JFIGlzIG5vdCBzZXQKIyBDT05GSUdfSVhHQkVWRiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0k0MEUgaXMgbm90IHNldAojIENPTkZJR19JNDBFVkYgaXMgbm90
IHNldAojIENPTkZJR19JQ0UgaXMgbm90IHNldAojIENPTkZJR19GTTEwSyBpcyBub3Qgc2V0
CiMgQ09ORklHX0lHQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1dBTkdYVU49eQoj
IENPTkZJR19OR0JFIGlzIG5vdCBzZXQKIyBDT05GSUdfVFhHQkUgaXMgbm90IHNldAojIENP
TkZJR19KTUUgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BREk9eQojIENPTkZJR19B
RElOMTExMCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0xJVEVYPXkKIyBDT05GSUdf
TElURVhfTElURUVUSCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01BUlZFTEw9eQpD
T05GSUdfTVZNRElPPXkKQ09ORklHX01WTkVUQT15CkNPTkZJR19NVlBQMj15CiMgQ09ORklH
X01WUFAyX1BUUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BYQTE2OF9FVEggaXMgbm90IHNldAoj
IENPTkZJR19TS0dFIGlzIG5vdCBzZXQKQ09ORklHX1NLWTI9eQojIENPTkZJR19TS1kyX0RF
QlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfT0NURU9OVFgyX0FGIGlzIG5vdCBzZXQKIyBDT05G
SUdfT0NURU9OVFgyX1BGIGlzIG5vdCBzZXQKIyBDT05GSUdfT0NURU9OX0VQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUFJFU1RFUkEgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01F
RElBVEVLIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTUVMTEFOT1g9eQpDT05GSUdf
TUxYNF9FTj1tCkNPTkZJR19NTFg0X0NPUkU9bQpDT05GSUdfTUxYNF9ERUJVRz15CkNPTkZJ
R19NTFg0X0NPUkVfR0VOMj15CkNPTkZJR19NTFg1X0NPUkU9bQojIENPTkZJR19NTFg1X0ZQ
R0EgaXMgbm90IHNldApDT05GSUdfTUxYNV9DT1JFX0VOPXkKQ09ORklHX01MWDVfRU5fQVJG
Uz15CkNPTkZJR19NTFg1X0VOX1JYTkZDPXkKQ09ORklHX01MWDVfTVBGUz15CkNPTkZJR19N
TFg1X0VTV0lUQ0g9eQpDT05GSUdfTUxYNV9CUklER0U9eQpDT05GSUdfTUxYNV9DTFNfQUNU
PXkKQ09ORklHX01MWDVfVENfU0FNUExFPXkKIyBDT05GSUdfTUxYNV9DT1JFX0lQT0lCIGlz
IG5vdCBzZXQKQ09ORklHX01MWDVfU1dfU1RFRVJJTkc9eQojIENPTkZJR19NTFg1X1NGIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUxYU1dfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01MWEZX
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYQkZfR0lHRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
VkVORE9SX01JQ1JFTD15CiMgQ09ORklHX0tTODg0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0tT
ODg1MSBpcyBub3Qgc2V0CiMgQ09ORklHX0tTODg1MV9NTEwgaXMgbm90IHNldAojIENPTkZJ
R19LU1o4ODRYX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01JQ1JPQ0hJUD15
CiMgQ09ORklHX0VOQzI4SjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfRU5DWDI0SjYwMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xBTjc0M1ggaXMgbm90IHNldAojIENPTkZJR19MQU45NjZYX1NX
SVRDSCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01JQ1JPU0VNST15CkNPTkZJR19N
U0NDX09DRUxPVF9TV0lUQ0hfTElCPW0KIyBDT05GSUdfTVNDQ19PQ0VMT1RfU1dJVENIIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTUlDUk9TT0ZUPXkKQ09ORklHX05FVF9WRU5E
T1JfTVlSST15CiMgQ09ORklHX01ZUkkxMEdFIGlzIG5vdCBzZXQKIyBDT05GSUdfRkVBTE5Y
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTkk9eQojIENPTkZJR19OSV9YR0VfTUFO
QUdFTUVOVF9FTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTkFUU0VNST15CiMg
Q09ORklHX05BVFNFTUkgaXMgbm90IHNldAojIENPTkZJR19OUzgzODIwIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfTkVURVJJT049eQojIENPTkZJR19TMklPIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfTkVUUk9OT01FPXkKIyBDT05GSUdfTkZQIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfODM5MD15CiMgQ09ORklHX05FMktfUENJIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfTlZJRElBPXkKIyBDT05GSUdfRk9SQ0VERVRIIGlzIG5vdCBz
ZXQKQ09ORklHX05FVF9WRU5ET1JfT0tJPXkKIyBDT05GSUdfRVRIT0MgaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9QQUNLRVRfRU5HSU5FUz15CiMgQ09ORklHX0hBTUFDSEkgaXMg
bm90IHNldAojIENPTkZJR19ZRUxMT1dGSU4gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9QRU5TQU5ETz15CiMgQ09ORklHX0lPTklDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfUUxPR0lDPXkKIyBDT05GSUdfUUxBM1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1FMQ05J
QyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVFhFTl9OSUMgaXMgbm90IHNldAojIENPTkZJR19R
RUQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9CUk9DQURFPXkKIyBDT05GSUdfQk5B
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUVVBTENPTU09eQojIENPTkZJR19RQ0E3
MDAwX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1FDQTcwMDBfVUFSVCBpcyBub3Qgc2V0CkNP
TkZJR19RQ09NX0VNQUM9bQpDT05GSUdfUk1ORVQ9bQpDT05GSUdfTkVUX1ZFTkRPUl9SREM9
eQojIENPTkZJR19SNjA0MCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JFQUxURUs9
eQojIENPTkZJR184MTM5Q1AgaXMgbm90IHNldAojIENPTkZJR184MTM5VE9PIGlzIG5vdCBz
ZXQKQ09ORklHX1I4MTY5PW0KQ09ORklHX05FVF9WRU5ET1JfUkVORVNBUz15CkNPTkZJR19T
SF9FVEg9eQpDT05GSUdfUkFWQj15CkNPTkZJR19ORVRfVkVORE9SX1JPQ0tFUj15CiMgQ09O
RklHX1JPQ0tFUiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NBTVNVTkc9eQojIENP
TkZJR19TWEdCRV9FVEggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TRUVRPXkKQ09O
RklHX05FVF9WRU5ET1JfU0lMQU49eQojIENPTkZJR19TQzkyMDMxIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfU0lTPXkKIyBDT05GSUdfU0lTOTAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0lTMTkwIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU09MQVJGTEFSRT15CiMg
Q09ORklHX1NGQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NGQ19GQUxDT04gaXMgbm90IHNldAoj
IENPTkZJR19TRkNfU0lFTkEgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TTVNDPXkK
Q09ORklHX1NNQzkxWD15CiMgQ09ORklHX0VQSUMxMDAgaXMgbm90IHNldApDT05GSUdfU01T
QzkxMVg9eQojIENPTkZJR19TTVNDOTQyMCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9S
X1NPQ0lPTkVYVD15CkNPTkZJR19TTklfQVZFPXkKQ09ORklHX1NOSV9ORVRTRUM9eQpDT05G
SUdfTkVUX1ZFTkRPUl9TVE1JQ1JPPXkKQ09ORklHX1NUTU1BQ19FVEg9bQojIENPTkZJR19T
VE1NQUNfU0VMRlRFU1RTIGlzIG5vdCBzZXQKQ09ORklHX1NUTU1BQ19QTEFURk9STT1tCiMg
Q09ORklHX0RXTUFDX0RXQ19RT1NfRVRIIGlzIG5vdCBzZXQKQ09ORklHX0RXTUFDX0dFTkVS
SUM9bQpDT05GSUdfRFdNQUNfSVBRODA2WD1tCiMgQ09ORklHX0RXTUFDX01FRElBVEVLIGlz
IG5vdCBzZXQKQ09ORklHX0RXTUFDX01FU09OPW0KQ09ORklHX0RXTUFDX1FDT01fRVRIUU9T
PW0KQ09ORklHX0RXTUFDX1JPQ0tDSElQPW0KQ09ORklHX0RXTUFDX1NPQ0ZQR0E9bQpDT05G
SUdfRFdNQUNfU1VOWEk9bQpDT05GSUdfRFdNQUNfU1VOOEk9bQpDT05GSUdfRFdNQUNfSU1Y
OD1tCiMgQ09ORklHX0RXTUFDX0lOVEVMX1BMQVQgaXMgbm90IHNldApDT05GSUdfRFdNQUNf
VklTQ09OVEk9bQojIENPTkZJR19EV01BQ19MT09OR1NPTiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NUTU1BQ19QQ0kgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TVU49eQojIENPTkZJ
R19IQVBQWU1FQUwgaXMgbm90IHNldAojIENPTkZJR19TVU5HRU0gaXMgbm90IHNldAojIENP
TkZJR19DQVNTSU5JIGlzIG5vdCBzZXQKIyBDT05GSUdfTklVIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfU1lOT1BTWVM9eQojIENPTkZJR19EV0NfWExHTUFDIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfVEVIVVRJPXkKIyBDT05GSUdfVEVIVVRJIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfVEk9eQpDT05GSUdfVElfREFWSU5DSV9NRElPPXkKIyBDT05G
SUdfVElfQ1BTV19QSFlfU0VMIGlzIG5vdCBzZXQKQ09ORklHX1RJX0szX0FNNjVfQ1BTV19O
VVNTPXkKIyBDT05GSUdfVElfSzNfQU02NV9DUFNXX1NXSVRDSERFViBpcyBub3Qgc2V0CiMg
Q09ORklHX1RJX0szX0FNNjVfQ1BUUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RMQU4gaXMgbm90
IHNldApDT05GSUdfTkVUX1ZFTkRPUl9WRVJURVhDT009eQojIENPTkZJR19NU0UxMDJYIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfVklBPXkKIyBDT05GSUdfVklBX1JISU5FIGlz
IG5vdCBzZXQKIyBDT05GSUdfVklBX1ZFTE9DSVRZIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfV0laTkVUPXkKIyBDT05GSUdfV0laTkVUX1c1MTAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfV0laTkVUX1c1MzAwIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfWElMSU5YPXkK
IyBDT05GSUdfWElMSU5YX0VNQUNMSVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX0FY
SV9FTUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX0xMX1RFTUFDIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkRESSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJUFBJIGlzIG5vdCBzZXQKQ09O
RklHX1FDT01fSVBBPW0KIyBDT05GSUdfTkVUX1NCMTAwMCBpcyBub3Qgc2V0CkNPTkZJR19Q
SFlMSU5LPXkKQ09ORklHX1BIWUxJQj15CkNPTkZJR19TV1BIWT15CiMgQ09ORklHX0xFRF9U
UklHR0VSX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19GSVhFRF9QSFk9eQojIENPTkZJR19TRlAg
aXMgbm90IHNldAoKIwojIE1JSSBQSFkgZGV2aWNlIGRyaXZlcnMKIwojIENPTkZJR19BTURf
UEhZIGlzIG5vdCBzZXQKQ09ORklHX01FU09OX0dYTF9QSFk9bQojIENPTkZJR19BRElOX1BI
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0FESU4xMTAwX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19B
UVVBTlRJQV9QSFk9eQpDT05GSUdfQVg4ODc5NkJfUEhZPW0KQ09ORklHX0JST0FEQ09NX1BI
WT1tCkNPTkZJR19CQ001NDE0MF9QSFk9bQpDT05GSUdfQkNNN1hYWF9QSFk9bQojIENPTkZJ
R19CQ004NDg4MV9QSFkgaXMgbm90IHNldAojIENPTkZJR19CQ004N1hYX1BIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX0JDTV9DWUdOVVNfUEhZIGlzIG5vdCBzZXQKQ09ORklHX0JDTV9ORVRf
UEhZTElCPW0KIyBDT05GSUdfQ0lDQURBX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPUlRJ
TkFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfREFWSUNPTV9QSFkgaXMgbm90IHNldAojIENP
TkZJR19JQ1BMVVNfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTFhUX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOVEVMX1hXQVlfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTFNJX0VUMTAx
MUNfUEhZIGlzIG5vdCBzZXQKQ09ORklHX01BUlZFTExfUEhZPW0KQ09ORklHX01BUlZFTExf
MTBHX1BIWT1tCiMgQ09ORklHX01BUlZFTExfODhYMjIyMl9QSFkgaXMgbm90IHNldAojIENP
TkZJR19NQVhMSU5FQVJfR1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBVEVLX0dFX1BI
WSBpcyBub3Qgc2V0CkNPTkZJR19NSUNSRUxfUEhZPXkKQ09ORklHX01JQ1JPQ0hJUF9QSFk9
bQojIENPTkZJR19NSUNST0NISVBfVDFfUEhZIGlzIG5vdCBzZXQKQ09ORklHX01JQ1JPU0VN
SV9QSFk9eQojIENPTkZJR19NT1RPUkNPTU1fUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTkFU
SU9OQUxfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTlhQX0M0NV9USkExMVhYX1BIWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05YUF9USkExMVhYX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19BVDgw
M1hfUEhZPXkKIyBDT05GSUdfUVNFTUlfUEhZIGlzIG5vdCBzZXQKQ09ORklHX1JFQUxURUtf
UEhZPXkKIyBDT05GSUdfUkVORVNBU19QSFkgaXMgbm90IHNldApDT05GSUdfUk9DS0NISVBf
UEhZPXkKQ09ORklHX1NNU0NfUEhZPW0KIyBDT05GSUdfU1RFMTBYUCBpcyBub3Qgc2V0CiMg
Q09ORklHX1RFUkFORVRJQ1NfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfRFA4MzgyMl9QSFkg
aXMgbm90IHNldAojIENPTkZJR19EUDgzVEM4MTFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFA4Mzg0OF9QSFkgaXMgbm90IHNldApDT05GSUdfRFA4Mzg2N19QSFk9eQojIENPTkZJR19E
UDgzODY5X1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RQODNURDUxMF9QSFkgaXMgbm90IHNl
dApDT05GSUdfVklURVNTRV9QSFk9eQojIENPTkZJR19YSUxJTlhfR01JSTJSR01JSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01JQ1JFTF9LUzg5OTVNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BT
RV9DT05UUk9MTEVSIGlzIG5vdCBzZXQKQ09ORklHX0NBTl9ERVY9bQojIENPTkZJR19DQU5f
VkNBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9WWENBTiBpcyBub3Qgc2V0CkNPTkZJR19D
QU5fTkVUTElOSz15CkNPTkZJR19DQU5fQ0FMQ19CSVRUSU1JTkc9eQpDT05GSUdfQ0FOX1JY
X09GRkxPQUQ9eQojIENPTkZJR19DQU5fQ0FOMzI3IGlzIG5vdCBzZXQKQ09ORklHX0NBTl9G
TEVYQ0FOPW0KIyBDT05GSUdfQ0FOX0dSQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0tW
QVNFUl9QQ0lFRkQgaXMgbm90IHNldAojIENPTkZJR19DQU5fU0xDQU4gaXMgbm90IHNldAoj
IENPTkZJR19DQU5fWElMSU5YQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0NfQ0FOIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0FOX0NDNzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0NU
VUNBTkZEX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9DVFVDQU5GRF9QTEFURk9STSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NBTl9JRklfQ0FORkQgaXMgbm90IHNldAojIENPTkZJR19D
QU5fTV9DQU4gaXMgbm90IHNldAojIENPTkZJR19DQU5fUEVBS19QQ0lFRkQgaXMgbm90IHNl
dApDT05GSUdfQ0FOX1JDQVI9bQpDT05GSUdfQ0FOX1JDQVJfQ0FORkQ9bQojIENPTkZJR19D
QU5fU0pBMTAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9TT0ZUSU5HIGlzIG5vdCBzZXQK
CiMKIyBDQU4gU1BJIGludGVyZmFjZXMKIwojIENPTkZJR19DQU5fSEkzMTFYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ0FOX01DUDI1MVggaXMgbm90IHNldApDT05GSUdfQ0FOX01DUDI1MVhG
RD1tCiMgQ09ORklHX0NBTl9NQ1AyNTFYRkRfU0FOSVRZIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
Q0FOIFNQSSBpbnRlcmZhY2VzCgojCiMgQ0FOIFVTQiBpbnRlcmZhY2VzCiMKIyBDT05GSUdf
Q0FOXzhERVZfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0VNU19VU0IgaXMgbm90IHNl
dAojIENPTkZJR19DQU5fRVNEX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9FVEFTX0VT
NThYIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0dTX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklH
X0NBTl9LVkFTRVJfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX01DQkFfVVNCIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ0FOX1BFQUtfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX1VD
QU4gaXMgbm90IHNldAojIGVuZCBvZiBDQU4gVVNCIGludGVyZmFjZXMKCiMgQ09ORklHX0NB
Tl9ERUJVR19ERVZJQ0VTIGlzIG5vdCBzZXQKQ09ORklHX01ESU9fREVWSUNFPXkKQ09ORklH
X01ESU9fQlVTPXkKQ09ORklHX0ZXTk9ERV9NRElPPXkKQ09ORklHX09GX01ESU89eQpDT05G
SUdfQUNQSV9NRElPPXkKQ09ORklHX01ESU9fREVWUkVTPXkKIyBDT05GSUdfTURJT19TVU40
SSBpcyBub3Qgc2V0CkNPTkZJR19NRElPX1hHRU5FPXkKQ09ORklHX01ESU9fQklUQkFORz15
CkNPTkZJR19NRElPX0JDTV9JUFJPQz15CkNPTkZJR19NRElPX0JDTV9VTklNQUM9bQpDT05G
SUdfTURJT19DQVZJVU09eQojIENPTkZJR19NRElPX0dQSU8gaXMgbm90IHNldAojIENPTkZJ
R19NRElPX0hJU0lfRkVNQUMgaXMgbm90IHNldAojIENPTkZJR19NRElPX01WVVNCIGlzIG5v
dCBzZXQKIyBDT05GSUdfTURJT19NU0NDX01JSU0gaXMgbm90IHNldAojIENPTkZJR19NRElP
X09DVEVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fSVBRNDAxOSBpcyBub3Qgc2V0CiMg
Q09ORklHX01ESU9fSVBRODA2NCBpcyBub3Qgc2V0CkNPTkZJR19NRElPX1RIVU5ERVI9eQoK
IwojIE1ESU8gTXVsdGlwbGV4ZXJzCiMKQ09ORklHX01ESU9fQlVTX01VWD15CkNPTkZJR19N
RElPX0JVU19NVVhfTUVTT05fRzEyQT1tCkNPTkZJR19NRElPX0JVU19NVVhfQkNNX0lQUk9D
PXkKIyBDT05GSUdfTURJT19CVVNfTVVYX0dQSU8gaXMgbm90IHNldApDT05GSUdfTURJT19C
VVNfTVVYX01VTFRJUExFWEVSPXkKQ09ORklHX01ESU9fQlVTX01VWF9NTUlPUkVHPXkKCiMK
IyBQQ1MgZGV2aWNlIGRyaXZlcnMKIwpDT05GSUdfUENTX1hQQ1M9bQpDT05GSUdfUENTX0xZ
Tlg9eQojIGVuZCBvZiBQQ1MgZGV2aWNlIGRyaXZlcnMKCiMgQ09ORklHX1BQUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NMSVAgaXMgbm90IHNldApDT05GSUdfVVNCX05FVF9EUklWRVJTPXkK
IyBDT05GSUdfVVNCX0NBVEMgaXMgbm90IHNldAojIENPTkZJR19VU0JfS0FXRVRIIGlzIG5v
dCBzZXQKQ09ORklHX1VTQl9QRUdBU1VTPW0KQ09ORklHX1VTQl9SVEw4MTUwPW0KQ09ORklH
X1VTQl9SVEw4MTUyPW0KQ09ORklHX1VTQl9MQU43OFhYPW0KQ09ORklHX1VTQl9VU0JORVQ9
bQpDT05GSUdfVVNCX05FVF9BWDg4MTdYPW0KQ09ORklHX1VTQl9ORVRfQVg4ODE3OV8xNzhB
PW0KQ09ORklHX1VTQl9ORVRfQ0RDRVRIRVI9bQojIENPTkZJR19VU0JfTkVUX0NEQ19FRU0g
aXMgbm90IHNldApDT05GSUdfVVNCX05FVF9DRENfTkNNPW0KIyBDT05GSUdfVVNCX05FVF9I
VUFXRUlfQ0RDX05DTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfQ0RDX01CSU0gaXMg
bm90IHNldApDT05GSUdfVVNCX05FVF9ETTk2MDE9bQojIENPTkZJR19VU0JfTkVUX1NSOTcw
MCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX1NSOTgwMD1tCkNPTkZJR19VU0JfTkVUX1NN
U0M3NVhYPW0KQ09ORklHX1VTQl9ORVRfU01TQzk1WFg9bQojIENPTkZJR19VU0JfTkVUX0dM
NjIwQSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX05FVDEwODA9bQpDT05GSUdfVVNCX05F
VF9QTFVTQj1tCkNPTkZJR19VU0JfTkVUX01DUzc4MzA9bQojIENPTkZJR19VU0JfTkVUX1JO
RElTX0hPU1QgaXMgbm90IHNldApDT05GSUdfVVNCX05FVF9DRENfU1VCU0VUX0VOQUJMRT1t
CkNPTkZJR19VU0JfTkVUX0NEQ19TVUJTRVQ9bQojIENPTkZJR19VU0JfQUxJX001NjMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0FOMjcyMCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQkVM
S0lOPXkKQ09ORklHX1VTQl9BUk1MSU5VWD15CiMgQ09ORklHX1VTQl9FUFNPTjI4ODggaXMg
bm90IHNldAojIENPTkZJR19VU0JfS0MyMTkwIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9ORVRf
WkFVUlVTPW0KIyBDT05GSUdfVVNCX05FVF9DWDgyMzEwX0VUSCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9ORVRfS0FMTUlBIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05FVF9RTUlfV1dB
TiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IU08gaXMgbm90IHNldAojIENPTkZJR19VU0Jf
TkVUX0lOVDUxWDEgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVBIRVRIIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NJRVJSQV9ORVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfVkw2MDAg
aXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX0NIOTIwMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9ORVRfQVFDMTExIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9SVEw4MTUzX0VDTT1tCkNP
TkZJR19XTEFOPXkKQ09ORklHX1dMQU5fVkVORE9SX0FETVRFSz15CiMgQ09ORklHX0FETTgy
MTEgaXMgbm90IHNldApDT05GSUdfQVRIX0NPTU1PTj1tCkNPTkZJR19XTEFOX1ZFTkRPUl9B
VEg9eQojIENPTkZJR19BVEhfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19BVEg1SyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FUSDVLX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDlLIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVRIOUtfSFRDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FSTDkx
NzAgaXMgbm90IHNldAojIENPTkZJR19BVEg2S0wgaXMgbm90IHNldAojIENPTkZJR19BUjU1
MjMgaXMgbm90IHNldAojIENPTkZJR19XSUw2MjEwIGlzIG5vdCBzZXQKQ09ORklHX0FUSDEw
Sz1tCkNPTkZJR19BVEgxMEtfQ0U9eQpDT05GSUdfQVRIMTBLX1BDST1tCiMgQ09ORklHX0FU
SDEwS19BSEIgaXMgbm90IHNldAojIENPTkZJR19BVEgxMEtfU0RJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX0FUSDEwS19VU0IgaXMgbm90IHNldApDT05GSUdfQVRIMTBLX1NOT0M9bQojIENP
TkZJR19BVEgxMEtfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19BVEgxMEtfREVCVUdGUyBp
cyBub3Qgc2V0CkNPTkZJR19XQ04zNlhYPW0KIyBDT05GSUdfV0NOMzZYWF9ERUJVR0ZTIGlz
IG5vdCBzZXQKQ09ORklHX0FUSDExSz1tCkNPTkZJR19BVEgxMUtfQUhCPW0KQ09ORklHX0FU
SDExS19QQ0k9bQojIENPTkZJR19BVEgxMUtfREVCVUcgaXMgbm90IHNldApDT05GSUdfV0xB
Tl9WRU5ET1JfQVRNRUw9eQojIENPTkZJR19BVE1FTCBpcyBub3Qgc2V0CiMgQ09ORklHX0FU
NzZDNTBYX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9CUk9BRENPTT15CiMg
Q09ORklHX0I0MyBpcyBub3Qgc2V0CiMgQ09ORklHX0I0M0xFR0FDWSBpcyBub3Qgc2V0CkNP
TkZJR19CUkNNVVRJTD1tCiMgQ09ORklHX0JSQ01TTUFDIGlzIG5vdCBzZXQKQ09ORklHX0JS
Q01GTUFDPW0KQ09ORklHX0JSQ01GTUFDX1BST1RPX0JDREM9eQpDT05GSUdfQlJDTUZNQUNf
U0RJTz15CiMgQ09ORklHX0JSQ01GTUFDX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0JSQ01G
TUFDX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19CUkNNX1RSQUNJTkcgaXMgbm90IHNldAoj
IENPTkZJR19CUkNNREJHIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX0NJU0NPPXkK
Q09ORklHX1dMQU5fVkVORE9SX0lOVEVMPXkKIyBDT05GSUdfSVBXMjEwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lQVzIyMDAgaXMgbm90IHNldAojIENPTkZJR19JV0w0OTY1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfSVdMMzk0NSBpcyBub3Qgc2V0CiMgQ09ORklHX0lXTFdJRkkgaXMgbm90
IHNldApDT05GSUdfV0xBTl9WRU5ET1JfSU5URVJTSUw9eQojIENPTkZJR19IT1NUQVAgaXMg
bm90IHNldAojIENPTkZJR19IRVJNRVMgaXMgbm90IHNldAojIENPTkZJR19QNTRfQ09NTU9O
IGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX01BUlZFTEw9eQojIENPTkZJR19MSUJF
UlRBUyBpcyBub3Qgc2V0CiMgQ09ORklHX0xJQkVSVEFTX1RISU5GSVJNIGlzIG5vdCBzZXQK
Q09ORklHX01XSUZJRVg9bQpDT05GSUdfTVdJRklFWF9TRElPPW0KQ09ORklHX01XSUZJRVhf
UENJRT1tCiMgQ09ORklHX01XSUZJRVhfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfTVdMOEsg
aXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfTUVESUFURUs9eQojIENPTkZJR19NVDc2
MDFVIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3NngwVSBpcyBub3Qgc2V0CiMgQ09ORklHX01U
NzZ4MEUgaXMgbm90IHNldAojIENPTkZJR19NVDc2eDJFIGlzIG5vdCBzZXQKIyBDT05GSUdf
TVQ3NngyVSBpcyBub3Qgc2V0CiMgQ09ORklHX01UNzYwM0UgaXMgbm90IHNldAojIENPTkZJ
R19NVDc2MTVFIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3NjYzVSBpcyBub3Qgc2V0CiMgQ09O
RklHX01UNzY2M1MgaXMgbm90IHNldAojIENPTkZJR19NVDc5MTVFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVQ3OTIxRSBpcyBub3Qgc2V0CiMgQ09ORklHX01UNzkyMVMgaXMgbm90IHNldAoj
IENPTkZJR19NVDc5MjFVIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX01JQ1JPQ0hJ
UD15CiMgQ09ORklHX1dJTEMxMDAwX1NESU8gaXMgbm90IHNldAojIENPTkZJR19XSUxDMTAw
MF9TUEkgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfUFVSRUxJRkk9eQojIENPTkZJ
R19QTEZYTEMgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfUkFMSU5LPXkKIyBDT05G
SUdfUlQyWDAwIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1JFQUxURUs9eQojIENP
TkZJR19SVEw4MTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODE4NyBpcyBub3Qgc2V0CkNP
TkZJR19SVExfQ0FSRFM9bQojIENPTkZJR19SVEw4MTkyQ0UgaXMgbm90IHNldAojIENPTkZJ
R19SVEw4MTkyU0UgaXMgbm90IHNldAojIENPTkZJR19SVEw4MTkyREUgaXMgbm90IHNldAoj
IENPTkZJR19SVEw4NzIzQUUgaXMgbm90IHNldAojIENPTkZJR19SVEw4NzIzQkUgaXMgbm90
IHNldAojIENPTkZJR19SVEw4MTg4RUUgaXMgbm90IHNldAojIENPTkZJR19SVEw4MTkyRUUg
aXMgbm90IHNldAojIENPTkZJR19SVEw4ODIxQUUgaXMgbm90IHNldAojIENPTkZJR19SVEw4
MTkyQ1UgaXMgbm90IHNldAojIENPTkZJR19SVEw4WFhYVSBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUVzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRXODkgaXMgbm90IHNldApDT05GSUdfV0xB
Tl9WRU5ET1JfUlNJPXkKIyBDT05GSUdfUlNJXzkxWCBpcyBub3Qgc2V0CkNPTkZJR19XTEFO
X1ZFTkRPUl9TSUxBQlM9eQojIENPTkZJR19XRlggaXMgbm90IHNldApDT05GSUdfV0xBTl9W
RU5ET1JfU1Q9eQojIENPTkZJR19DVzEyMDAgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5E
T1JfVEk9eQojIENPTkZJR19XTDEyNTEgaXMgbm90IHNldAojIENPTkZJR19XTDEyWFggaXMg
bm90IHNldApDT05GSUdfV0wxOFhYPW0KQ09ORklHX1dMQ09SRT1tCiMgQ09ORklHX1dMQ09S
RV9TUEkgaXMgbm90IHNldApDT05GSUdfV0xDT1JFX1NESU89bQpDT05GSUdfV0lMSU5LX1BM
QVRGT1JNX0RBVEE9eQpDT05GSUdfV0xBTl9WRU5ET1JfWllEQVM9eQojIENPTkZJR19VU0Jf
WkQxMjAxIGlzIG5vdCBzZXQKIyBDT05GSUdfWkQxMjExUlcgaXMgbm90IHNldApDT05GSUdf
V0xBTl9WRU5ET1JfUVVBTlRFTk5BPXkKIyBDT05GSUdfUVRORk1BQ19QQ0lFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUFDODAyMTFfSFdTSU0gaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVU
X1JORElTX1dMQU4gaXMgbm90IHNldAojIENPTkZJR19WSVJUX1dJRkkgaXMgbm90IHNldAoj
IENPTkZJR19XQU4gaXMgbm90IHNldAoKIwojIFdpcmVsZXNzIFdBTgojCiMgQ09ORklHX1dX
QU4gaXMgbm90IHNldAojIGVuZCBvZiBXaXJlbGVzcyBXQU4KCkNPTkZJR19YRU5fTkVUREVW
X0ZST05URU5EPXkKIyBDT05GSUdfWEVOX05FVERFVl9CQUNLRU5EIGlzIG5vdCBzZXQKIyBD
T05GSUdfVk1YTkVUMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVSklUU1VfRVMgaXMgbm90IHNl
dAojIENPTkZJR19ORVRERVZTSU0gaXMgbm90IHNldApDT05GSUdfTkVUX0ZBSUxPVkVSPXkK
IyBDT05GSUdfSVNETiBpcyBub3Qgc2V0CgojCiMgSW5wdXQgZGV2aWNlIHN1cHBvcnQKIwpD
T05GSUdfSU5QVVQ9eQpDT05GSUdfSU5QVVRfTEVEUz15CkNPTkZJR19JTlBVVF9GRl9NRU1M
RVNTPXkKIyBDT05GSUdfSU5QVVRfU1BBUlNFS01BUCBpcyBub3Qgc2V0CkNPTkZJR19JTlBV
VF9NQVRSSVhLTUFQPXkKQ09ORklHX0lOUFVUX1ZJVkFMRElGTUFQPXkKCiMKIyBVc2VybGFu
ZCBpbnRlcmZhY2VzCiMKIyBDT05GSUdfSU5QVVRfTU9VU0VERVYgaXMgbm90IHNldAojIENP
TkZJR19JTlBVVF9KT1lERVYgaXMgbm90IHNldApDT05GSUdfSU5QVVRfRVZERVY9eQojIENP
TkZJR19JTlBVVF9FVkJVRyBpcyBub3Qgc2V0CgojCiMgSW5wdXQgRGV2aWNlIERyaXZlcnMK
IwpDT05GSUdfSU5QVVRfS0VZQk9BUkQ9eQpDT05GSUdfS0VZQk9BUkRfQURDPW0KIyBDT05G
SUdfS0VZQk9BUkRfQURQNTU4OCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0FEUDU1
ODkgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfQVRLQkQ9eQojIENPTkZJR19LRVlCT0FS
RF9RVDEwNTAgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9RVDEwNzAgaXMgbm90IHNl
dAojIENPTkZJR19LRVlCT0FSRF9RVDIxNjAgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9ETElOS19ESVI2ODUgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MS0tCRCBpcyBu
b3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9HUElPPXkKIyBDT05GSUdfS0VZQk9BUkRfR1BJT19Q
T0xMRUQgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9UQ0E2NDE2IGlzIG5vdCBzZXQK
IyBDT05GSUdfS0VZQk9BUkRfVENBODQxOCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X01BVFJJWCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xNODMyMyBpcyBub3Qgc2V0
CiMgQ09ORklHX0tFWUJPQVJEX0xNODMzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X01BWDczNTkgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9NQ1MgaXMgbm90IHNldAoj
IENPTkZJR19LRVlCT0FSRF9NUFIxMjEgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfU05W
U19QV1JLRVk9bQojIENPTkZJR19LRVlCT0FSRF9JTVggaXMgbm90IHNldApDT05GSUdfS0VZ
Qk9BUkRfSU1YX1NDX0tFWT1tCiMgQ09ORklHX0tFWUJPQVJEX05FV1RPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0tFWUJPQVJEX1RFR1JBIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRf
T1BFTkNPUkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfUElORVBIT05FIGlzIG5v
dCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX1NUT1dBV0FZIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU1VOS0JEIGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU1VONElfTFJBREMgaXMgbm90IHNldAojIENP
TkZJR19LRVlCT0FSRF9PTUFQNCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1RNMl9U
T1VDSEtFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1hUS0JEIGlzIG5vdCBzZXQK
Q09ORklHX0tFWUJPQVJEX0NST1NfRUM9eQojIENPTkZJR19LRVlCT0FSRF9DQVAxMVhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQkNNIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfTVQ2Nzc5IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTVRLX1BNSUMgaXMg
bm90IHNldAojIENPTkZJR19LRVlCT0FSRF9DWVBSRVNTX1NGIGlzIG5vdCBzZXQKQ09ORklH
X0lOUFVUX01PVVNFPXkKQ09ORklHX01PVVNFX1BTMj15CkNPTkZJR19NT1VTRV9QUzJfQUxQ
Uz15CkNPTkZJR19NT1VTRV9QUzJfQllEPXkKQ09ORklHX01PVVNFX1BTMl9MT0dJUFMyUFA9
eQpDT05GSUdfTU9VU0VfUFMyX1NZTkFQVElDUz15CkNPTkZJR19NT1VTRV9QUzJfU1lOQVBU
SUNTX1NNQlVTPXkKQ09ORklHX01PVVNFX1BTMl9DWVBSRVNTPXkKQ09ORklHX01PVVNFX1BT
Ml9UUkFDS1BPSU5UPXkKIyBDT05GSUdfTU9VU0VfUFMyX0VMQU5URUNIIGlzIG5vdCBzZXQK
IyBDT05GSUdfTU9VU0VfUFMyX1NFTlRFTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0Vf
UFMyX1RPVUNIS0lUIGlzIG5vdCBzZXQKQ09ORklHX01PVVNFX1BTMl9GT0NBTFRFQ0g9eQpD
T05GSUdfTU9VU0VfUFMyX1NNQlVTPXkKIyBDT05GSUdfTU9VU0VfU0VSSUFMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTU9VU0VfQVBQTEVUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNF
X0JDTTU5NzQgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9DWUFQQSBpcyBub3Qgc2V0CiMg
Q09ORklHX01PVVNFX0VMQU5fSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfVlNYWFhB
QSBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19N
T1VTRV9TWU5BUFRJQ1NfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfU1lOQVBUSUNT
X1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0pPWVNUSUNLIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5QVVRfVEFCTEVUIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVO
PXkKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQURTNzg0NiBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX0FENzg3NyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0FENzg3
OSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0FEQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX0FSMTAyMV9JMkMgaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JF
RU5fQVRNRUxfTVhUPW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQVRNRUxfTVhUX1QzNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0FVT19QSVhDSVIgaXMgbm90IHNldAojIENP
TkZJR19UT1VDSFNDUkVFTl9CVTIxMDEzIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fQlUyMTAyOSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NISVBPTkVfSUNO
ODMxOCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NISVBPTkVfSUNOODUwNSBp
cyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NZOENUTUExNDAgaXMgbm90IHNldAoj
IENPTkZJR19UT1VDSFNDUkVFTl9DWThDVE1HMTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9V
Q0hTQ1JFRU5fQ1lUVFNQX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9D
WVRUU1A0X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9EWU5BUFJPIGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSEFNUFNISVJFIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fRUVUSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVO
X0VHQUxBWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VHQUxBWF9TRVJJQUwg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FWEMzMDAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fRlVKSVRTVSBpcyBub3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVF
Tl9HT09ESVg9bQojIENPTkZJR19UT1VDSFNDUkVFTl9ISURFRVAgaXMgbm90IHNldAojIENP
TkZJR19UT1VDSFNDUkVFTl9IWUNPTl9IWTQ2WFggaXMgbm90IHNldAojIENPTkZJR19UT1VD
SFNDUkVFTl9JTEkyMTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSUxJVEVL
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSVBST0MgaXMgbm90IHNldAojIENP
TkZJR19UT1VDSFNDUkVFTl9TNlNZNzYxIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fR1VOWkUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FS1RGMjEyNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VMQU4gaXMgbm90IHNldAojIENPTkZJR19U
T1VDSFNDUkVFTl9FTE8gaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9XQUNPTV9X
ODAwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1dBQ09NX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX01BWDExODAxIGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fTUNTNTAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX01N
UzExNCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX01FTEZBU19NSVA0IGlzIG5v
dCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTVNHMjYzOCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RPVUNIU0NSRUVOX01UT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lN
QUdJUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lNWDZVTF9UU0MgaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9JTkVYSU8gaXMgbm90IHNldAojIENPTkZJR19U
T1VDSFNDUkVFTl9NSzcxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1BFTk1P
VU5UIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX0VEVF9GVDVYMDY9bQojIENPTkZJ
R19UT1VDSFNDUkVFTl9SQVNQQkVSUllQSV9GVyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX1RPVUNIUklHSFQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UT1VD
SFdJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1BJWENJUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1RPVUNIU0NSRUVOX1dEVDg3WFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fVVNCX0NPTVBPU0lURSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NS
RUVOX1RPVUNISVQyMTMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UU0NfU0VS
SU8gaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UU0MyMDA0IGlzIG5vdCBzZXQK
IyBDT05GSUdfVE9VQ0hTQ1JFRU5fVFNDMjAwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX1RTQzIwMDcgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9STV9UUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NJTEVBRCBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX1NJU19JMkMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVF
Tl9TVDEyMzIgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9TVE1GVFMgaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9TVU40SSBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX1NVUjQwIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fU1VSRkFD
RTNfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fU1g4NjU0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVFBTNjUwN1ggaXMgbm90IHNldAojIENPTkZJR19U
T1VDSFNDUkVFTl9aRVQ2MjIzIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fWkZP
UkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ09MSUJSSV9WRjUwIGlzIG5v
dCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fUk9ITV9CVTIxMDIzIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fSVFTNVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fWklOSVRJWCBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9NSVNDPXkKIyBDT05GSUdfSU5Q
VVRfQUQ3MTRYIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQVRNRUxfQ0FQVE9VQ0ggaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9CTUExNTAgaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9FM1gwX0JVVFRPTiBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9QTTg5NDFfUFdSS0VZPXkK
Q09ORklHX0lOUFVUX1BNOFhYWF9WSUJSQVRPUj1tCiMgQ09ORklHX0lOUFVUX01NQTg0NTAg
aXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElPX0JFRVBFUiBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOUFVUX0dQSU9fREVDT0RFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0dQSU9f
VklCUkEgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9BVElfUkVNT1RFMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOUFVUX0tFWVNQQU5fUkVNT1RFIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5Q
VVRfS1hUSjkgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9QT1dFUk1BVEUgaXMgbm90IHNl
dAojIENPTkZJR19JTlBVVF9ZRUFMSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQ00x
MDkgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9SRUdVTEFUT1JfSEFQVElDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5QVVRfQVhQMjBYX1BFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X1VJTlBVVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BDRjg1NzQgaXMgbm90IHNldApD
T05GSUdfSU5QVVRfUFdNX0JFRVBFUj1tCkNPTkZJR19JTlBVVF9QV01fVklCUkE9bQojIENP
TkZJR19JTlBVVF9SSzgwNV9QV1JLRVkgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElP
X1JPVEFSWV9FTkNPREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfREE3MjgwX0hBUFRJ
Q1MgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9BRFhMMzRYIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfSUJNX1BBTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSU1TX1BDVSBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0lRUzI2OUEgaXMgbm90IHNldAojIENPTkZJR19J
TlBVVF9JUVM2MjZBIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSVFTNzIyMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOUFVUX0NNQTMwMDAgaXMgbm90IHNldApDT05GSUdfSU5QVVRfWEVO
X0tCRERFVl9GUk9OVEVORD15CiMgQ09ORklHX0lOUFVUX1NPQ19CVVRUT05fQVJSQVkgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9EUlYyNjBYX0hBUFRJQ1MgaXMgbm90IHNldAojIENP
TkZJR19JTlBVVF9EUlYyNjY1X0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9E
UlYyNjY3X0hBUFRJQ1MgaXMgbm90IHNldApDT05GSUdfSU5QVVRfSElTSV9QT1dFUktFWT15
CiMgQ09ORklHX1JNSTRfQ09SRSBpcyBub3Qgc2V0CgojCiMgSGFyZHdhcmUgSS9PIHBvcnRz
CiMKQ09ORklHX1NFUklPPXkKIyBDT05GSUdfU0VSSU9fU0VSUE9SVCBpcyBub3Qgc2V0CkNP
TkZJR19TRVJJT19BTUJBS01JPXkKIyBDT05GSUdfU0VSSU9fUENJUFMyIGlzIG5vdCBzZXQK
Q09ORklHX1NFUklPX0xJQlBTMj15CiMgQ09ORklHX1NFUklPX1JBVyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFUklPX0FMVEVSQV9QUzIgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19QUzJN
VUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fQVJDX1BTMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklPX0FQQlBTMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX1NVTjRJX1BTMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX0dQSU9fUFMyIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNFUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfR0FNRVBPUlQgaXMgbm90IHNldAojIGVuZCBv
ZiBIYXJkd2FyZSBJL08gcG9ydHMKIyBlbmQgb2YgSW5wdXQgZGV2aWNlIHN1cHBvcnQKCiMK
IyBDaGFyYWN0ZXIgZGV2aWNlcwojCkNPTkZJR19UVFk9eQpDT05GSUdfVlQ9eQpDT05GSUdf
Q09OU09MRV9UUkFOU0xBVElPTlM9eQpDT05GSUdfVlRfQ09OU09MRT15CkNPTkZJR19WVF9D
T05TT0xFX1NMRUVQPXkKQ09ORklHX0hXX0NPTlNPTEU9eQpDT05GSUdfVlRfSFdfQ09OU09M
RV9CSU5ESU5HPXkKQ09ORklHX1VOSVg5OF9QVFlTPXkKQ09ORklHX0xFR0FDWV9QVFlTPXkK
Q09ORklHX0xFR0FDWV9QVFlfQ09VTlQ9MTYKQ09ORklHX0xESVNDX0FVVE9MT0FEPXkKCiMK
IyBTZXJpYWwgZHJpdmVycwojCkNPTkZJR19TRVJJQUxfRUFSTFlDT049eQpDT05GSUdfU0VS
SUFMXzgyNTA9eQpDT05GSUdfU0VSSUFMXzgyNTBfREVQUkVDQVRFRF9PUFRJT05TPXkKQ09O
RklHX1NFUklBTF84MjUwX1BOUD15CkNPTkZJR19TRVJJQUxfODI1MF8xNjU1MEFfVkFSSUFO
VFM9eQojIENPTkZJR19TRVJJQUxfODI1MF9GSU5URUsgaXMgbm90IHNldApDT05GSUdfU0VS
SUFMXzgyNTBfQ09OU09MRT15CkNPTkZJR19TRVJJQUxfODI1MF9ETUE9eQpDT05GSUdfU0VS
SUFMXzgyNTBfUENJPXkKQ09ORklHX1NFUklBTF84MjUwX0VYQVI9eQpDT05GSUdfU0VSSUFM
XzgyNTBfTlJfVUFSVFM9NApDT05GSUdfU0VSSUFMXzgyNTBfUlVOVElNRV9VQVJUUz00CkNP
TkZJR19TRVJJQUxfODI1MF9FWFRFTkRFRD15CiMgQ09ORklHX1NFUklBTF84MjUwX01BTllf
UE9SVFMgaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgyNTBfU0hBUkVfSVJRPXkKIyBDT05G
SUdfU0VSSUFMXzgyNTBfREVURUNUX0lSUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84
MjUwX1JTQSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9EV0xJQj15CkNPTkZJR19T
RVJJQUxfODI1MF9CQ00yODM1QVVYPXkKQ09ORklHX1NFUklBTF84MjUwX0ZTTD15CkNPTkZJ
R19TRVJJQUxfODI1MF9EVz15CkNPTkZJR19TRVJJQUxfODI1MF9FTT15CiMgQ09ORklHX1NF
UklBTF84MjUwX1JUMjg4WCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9PTUFQPXkK
Q09ORklHX1NFUklBTF84MjUwX09NQVBfVFRZT19GSVhVUD15CkNPTkZJR19TRVJJQUxfODI1
MF9NVDY1Nzc9eQpDT05GSUdfU0VSSUFMXzgyNTBfVU5JUEhJRVI9eQpDT05GSUdfU0VSSUFM
XzgyNTBfUEVSSUNPTT15CkNPTkZJR19TRVJJQUxfODI1MF9URUdSQT15CkNPTkZJR19TRVJJ
QUxfODI1MF9CQ003MjcxPXkKQ09ORklHX1NFUklBTF9PRl9QTEFURk9STT15CgojCiMgTm9u
LTgyNTAgc2VyaWFsIHBvcnQgc3VwcG9ydAojCiMgQ09ORklHX1NFUklBTF9BTUJBX1BMMDEw
IGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9BTUJBX1BMMDExPXkKQ09ORklHX1NFUklBTF9B
TUJBX1BMMDExX0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfRUFSTFlDT05fQVJNX1NFTUlI
T1NUIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9NRVNPTj15CkNPTkZJR19TRVJJQUxfTUVT
T05fQ09OU09MRT15CkNPTkZJR19TRVJJQUxfU0FNU1VORz15CkNPTkZJR19TRVJJQUxfU0FN
U1VOR19VQVJUU180PXkKQ09ORklHX1NFUklBTF9TQU1TVU5HX1VBUlRTPTQKQ09ORklHX1NF
UklBTF9TQU1TVU5HX0NPTlNPTEU9eQpDT05GSUdfU0VSSUFMX1RFR1JBPXkKQ09ORklHX1NF
UklBTF9URUdSQV9UQ1U9eQpDT05GSUdfU0VSSUFMX1RFR1JBX1RDVV9DT05TT0xFPXkKIyBD
T05GSUdfU0VSSUFMX01BWDMxMDAgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTUFYMzEw
WCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfSU1YPXkKQ09ORklHX1NFUklBTF9JTVhfQ09O
U09MRT15CkNPTkZJR19TRVJJQUxfSU1YX0VBUkxZQ09OPXkKIyBDT05GSUdfU0VSSUFMX1VB
UlRMSVRFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9TSF9TQ0k9eQpDT05GSUdfU0VSSUFM
X1NIX1NDSV9OUl9VQVJUUz0xOApDT05GSUdfU0VSSUFMX1NIX1NDSV9DT05TT0xFPXkKQ09O
RklHX1NFUklBTF9TSF9TQ0lfRUFSTFlDT049eQpDT05GSUdfU0VSSUFMX1NIX1NDSV9ETUE9
eQpDT05GSUdfU0VSSUFMX0NPUkU9eQpDT05GSUdfU0VSSUFMX0NPUkVfQ09OU09MRT15CiMg
Q09ORklHX1NFUklBTF9KU00gaXMgbm90IHNldApDT05GSUdfU0VSSUFMX01TTT15CkNPTkZJ
R19TRVJJQUxfTVNNX0NPTlNPTEU9eQpDT05GSUdfU0VSSUFMX1FDT01fR0VOST15CkNPTkZJ
R19TRVJJQUxfUUNPTV9HRU5JX0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfU0lGSVZFIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NDQ05YUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
UklBTF9TQzE2SVM3WFggaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0JDTTYzWFg9eQojIENP
TkZJR19TRVJJQUxfQkNNNjNYWF9DT05TT0xFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFM
X0FMVEVSQV9KVEFHVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRFUkFfVUFS
VCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfWElMSU5YX1BTX1VBUlQ9eQpDT05GSUdfU0VS
SUFMX1hJTElOWF9QU19VQVJUX0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfQVJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VSSUFMX1JQMiBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfRlNM
X0xQVUFSVD15CkNPTkZJR19TRVJJQUxfRlNMX0xQVUFSVF9DT05TT0xFPXkKQ09ORklHX1NF
UklBTF9GU0xfTElORkxFWFVBUlQ9eQpDT05GSUdfU0VSSUFMX0ZTTF9MSU5GTEVYVUFSVF9D
T05TT0xFPXkKIyBDT05GSUdfU0VSSUFMX0NPTkVYQU5UX0RJR0lDT0xPUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF9TUFJEIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9NVkVCVV9V
QVJUPXkKQ09ORklHX1NFUklBTF9NVkVCVV9DT05TT0xFPXkKQ09ORklHX1NFUklBTF9PV0w9
eQpDT05GSUdfU0VSSUFMX09XTF9DT05TT0xFPXkKIyBlbmQgb2YgU2VyaWFsIGRyaXZlcnMK
CkNPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz15CiMgQ09ORklHX1NFUklBTF9OT05TVEFOREFS
RCBpcyBub3Qgc2V0CiMgQ09ORklHX05fR1NNIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9aT01J
IGlzIG5vdCBzZXQKIyBDT05GSUdfTlVMTF9UVFkgaXMgbm90IHNldApDT05GSUdfSFZDX0RS
SVZFUj15CkNPTkZJR19IVkNfSVJRPXkKQ09ORklHX0hWQ19YRU49eQpDT05GSUdfSFZDX1hF
Tl9GUk9OVEVORD15CiMgQ09ORklHX0hWQ19EQ0MgaXMgbm90IHNldAojIENPTkZJR19SUE1T
R19UVFkgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0RFVl9CVVM9eQpDT05GSUdfU0VSSUFM
X0RFVl9DVFJMX1RUWVBPUlQ9eQpDT05GSUdfVklSVElPX0NPTlNPTEU9eQpDT05GSUdfSVBN
SV9IQU5ETEVSPW0KQ09ORklHX0lQTUlfRE1JX0RFQ09ERT15CkNPTkZJR19JUE1JX1BMQVRf
REFUQT15CiMgQ09ORklHX0lQTUlfUEFOSUNfRVZFTlQgaXMgbm90IHNldApDT05GSUdfSVBN
SV9ERVZJQ0VfSU5URVJGQUNFPW0KQ09ORklHX0lQTUlfU0k9bQojIENPTkZJR19JUE1JX1NT
SUYgaXMgbm90IHNldAojIENPTkZJR19JUE1JX0lQTUIgaXMgbm90IHNldAojIENPTkZJR19J
UE1JX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBNSV9QT1dFUk9GRiBpcyBub3Qg
c2V0CiMgQ09ORklHX05QQ003WFhfS0NTX0lQTUlfQk1DIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVBNQl9ERVZJQ0VfSU5URVJGQUNFIGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTT1tCiMg
Q09ORklHX0hXX1JBTkRPTV9USU1FUklPTUVNIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdfUkFO
RE9NX0JBNDMxIGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTV9CQ00yODM1PW0KQ09ORklH
X0hXX1JBTkRPTV9JUFJPQ19STkcyMDA9bQpDT05GSUdfSFdfUkFORE9NX09NQVA9bQojIENP
TkZJR19IV19SQU5ET01fVklSVElPIGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTV9ISVNJ
PW0KQ09ORklHX0hXX1JBTkRPTV9YR0VORT1tCkNPTkZJR19IV19SQU5ET01fTUVTT049bQpD
T05GSUdfSFdfUkFORE9NX0NBVklVTT1tCkNPTkZJR19IV19SQU5ET01fTVRLPW0KQ09ORklH
X0hXX1JBTkRPTV9FWFlOT1M9bQpDT05GSUdfSFdfUkFORE9NX09QVEVFPW0KQ09ORklHX0hX
X1JBTkRPTV9OUENNPW0KIyBDT05GSUdfSFdfUkFORE9NX0NDVFJORyBpcyBub3Qgc2V0CiMg
Q09ORklHX0hXX1JBTkRPTV9YSVBIRVJBIGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTV9B
Uk1fU01DQ0NfVFJORz1tCkNPTkZJR19IV19SQU5ET01fQ04xMEs9bQojIENPTkZJR19BUFBM
SUNPTSBpcyBub3Qgc2V0CkNPTkZJR19ERVZNRU09eQpDT05GSUdfREVWUE9SVD15CkNPTkZJ
R19UQ0dfVFBNPXkKIyBDT05GSUdfVENHX1RJUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19U
SVNfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfVENHX1RJU19JMkMgaXMgbm90IHNldAojIENP
TkZJR19UQ0dfVElTX1NZTlFVQUNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19USVNfSTJD
X0NSNTAgaXMgbm90IHNldAojIENPTkZJR19UQ0dfVElTX0kyQ19BVE1FTCBpcyBub3Qgc2V0
CkNPTkZJR19UQ0dfVElTX0kyQ19JTkZJTkVPTj15CiMgQ09ORklHX1RDR19USVNfSTJDX05V
Vk9UT04gaXMgbm90IHNldAojIENPTkZJR19UQ0dfQVRNRUwgaXMgbm90IHNldAojIENPTkZJ
R19UQ0dfSU5GSU5FT04gaXMgbm90IHNldAojIENPTkZJR19UQ0dfWEVOIGlzIG5vdCBzZXQK
IyBDT05GSUdfVENHX0NSQiBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19WVFBNX1BST1hZIGlz
IG5vdCBzZXQKIyBDT05GSUdfVENHX0ZUUE1fVEVFIGlzIG5vdCBzZXQKIyBDT05GSUdfVENH
X1RJU19TVDMzWlAyNF9JMkMgaXMgbm90IHNldAojIENPTkZJR19UQ0dfVElTX1NUMzNaUDI0
X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTExZQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdf
WElMTFlVU0IgaXMgbm90IHNldApDT05GSUdfUkFORE9NX1RSVVNUX0NQVT15CkNPTkZJR19S
QU5ET01fVFJVU1RfQk9PVExPQURFUj15CiMgZW5kIG9mIENoYXJhY3RlciBkZXZpY2VzCgoj
CiMgSTJDIHN1cHBvcnQKIwpDT05GSUdfSTJDPXkKQ09ORklHX0FDUElfSTJDX09QUkVHSU9O
PXkKQ09ORklHX0kyQ19CT0FSRElORk89eQpDT05GSUdfSTJDX0NPTVBBVD15CkNPTkZJR19J
MkNfQ0hBUkRFVj15CkNPTkZJR19JMkNfTVVYPXkKCiMKIyBNdWx0aXBsZXhlciBJMkMgQ2hp
cCBzdXBwb3J0CiMKIyBDT05GSUdfSTJDX0FSQl9HUElPX0NIQUxMRU5HRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19NVVhfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVVhfR1BN
VVggaXMgbm90IHNldAojIENPTkZJR19JMkNfTVVYX0xUQzQzMDYgaXMgbm90IHNldAojIENP
TkZJR19JMkNfTVVYX1BDQTk1NDEgaXMgbm90IHNldApDT05GSUdfSTJDX01VWF9QQ0E5NTR4
PXkKIyBDT05GSUdfSTJDX01VWF9QSU5DVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01V
WF9SRUcgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVNVVhfUElOQ1RSTCBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19NVVhfTUxYQ1BMRCBpcyBub3Qgc2V0CiMgZW5kIG9mIE11bHRpcGxl
eGVyIEkyQyBDaGlwIHN1cHBvcnQKCkNPTkZJR19JMkNfSEVMUEVSX0FVVE89eQpDT05GSUdf
STJDX1NNQlVTPXkKQ09ORklHX0kyQ19BTEdPQklUPXkKCiMKIyBJMkMgSGFyZHdhcmUgQnVz
IHN1cHBvcnQKIwoKIwojIFBDIFNNQnVzIGhvc3QgY29udHJvbGxlciBkcml2ZXJzCiMKIyBD
T05GSUdfSTJDX0FMSTE1MzUgaXMgbm90IHNldAojIENPTkZJR19JMkNfQUxJMTU2MyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkxNVgzIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FN
RDc1NiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTUQ4MTExIGlzIG5vdCBzZXQKIyBDT05G
SUdfSTJDX0FNRF9NUDIgaXMgbm90IHNldAojIENPTkZJR19JMkNfSElYNUhEMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19JODAxIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lTQ0ggaXMg
bm90IHNldAojIENPTkZJR19JMkNfUElJWDQgaXMgbm90IHNldAojIENPTkZJR19JMkNfTkZP
UkNFMiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19OVklESUFfR1BVIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX1NJUzU1OTUgaXMgbm90IHNldAojIENPTkZJR19JMkNfU0lTNjMwIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX1NJUzk2WCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WSUEg
aXMgbm90IHNldAojIENPTkZJR19JMkNfVklBUFJPIGlzIG5vdCBzZXQKCiMKIyBBQ1BJIGRy
aXZlcnMKIwojIENPTkZJR19JMkNfU0NNSSBpcyBub3Qgc2V0CgojCiMgSTJDIHN5c3RlbSBi
dXMgZHJpdmVycyAobW9zdGx5IGVtYmVkZGVkIC8gc3lzdGVtLW9uLWNoaXApCiMKIyBDT05G
SUdfSTJDX0FMVEVSQSBpcyBub3Qgc2V0CkNPTkZJR19JMkNfQkNNMjgzNT1tCkNPTkZJR19J
MkNfQkNNX0lQUk9DPXkKQ09ORklHX0kyQ19CUkNNU1RCPXkKQ09ORklHX0kyQ19DQURFTkNF
PW0KIyBDT05GSUdfSTJDX0NCVVNfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19JMkNfREVTSUdO
V0FSRV9DT1JFPXkKIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfU0xBVkUgaXMgbm90IHNldApD
T05GSUdfSTJDX0RFU0lHTldBUkVfUExBVEZPUk09eQojIENPTkZJR19JMkNfREVTSUdOV0FS
RV9QQ0kgaXMgbm90IHNldAojIENPTkZJR19JMkNfRU1FVjIgaXMgbm90IHNldApDT05GSUdf
STJDX0VYWU5PUzU9eQpDT05GSUdfSTJDX0dQSU89bQojIENPTkZJR19JMkNfR1BJT19GQVVM
VF9JTkpFQ1RPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ISVNJIGlzIG5vdCBzZXQKQ09O
RklHX0kyQ19JTVg9eQpDT05GSUdfSTJDX0lNWF9MUEkyQz15CkNPTkZJR19JMkNfTUVTT049
eQpDT05GSUdfSTJDX01UNjVYWD15CkNPTkZJR19JMkNfTVY2NFhYWD15CiMgQ09ORklHX0ky
Q19OT01BRElLIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX05QQ00gaXMgbm90IHNldAojIENP
TkZJR19JMkNfT0NPUkVTIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19PTUFQPXkKQ09ORklHX0ky
Q19PV0w9eQpDT05GSUdfSTJDX0FQUExFPXkKIyBDT05GSUdfSTJDX1BDQV9QTEFURk9STSBp
cyBub3Qgc2V0CkNPTkZJR19JMkNfUFhBPXkKIyBDT05GSUdfSTJDX1BYQV9TTEFWRSBpcyBu
b3Qgc2V0CkNPTkZJR19JMkNfUUNPTV9DQ0k9bQpDT05GSUdfSTJDX1FDT01fR0VOST1tCkNP
TkZJR19JMkNfUVVQPXkKQ09ORklHX0kyQ19SSUlDPXkKQ09ORklHX0kyQ19SSzNYPXkKQ09O
RklHX0kyQ19SWlYyTT1tCkNPTkZJR19JMkNfUzNDMjQxMD15CkNPTkZJR19JMkNfU0hfTU9C
SUxFPXkKIyBDT05GSUdfSTJDX1NJTVRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TUFJE
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NZTlFVQUNFUiBpcyBub3Qgc2V0CkNPTkZJR19J
MkNfVEVHUkE9eQpDT05GSUdfSTJDX1RFR1JBX0JQTVA9eQojIENPTkZJR19JMkNfVU5JUEhJ
RVIgaXMgbm90IHNldApDT05GSUdfSTJDX1VOSVBISUVSX0Y9eQojIENPTkZJR19JMkNfVkVS
U0FUSUxFIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1RIVU5ERVJYIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX1hJTElOWCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19YTFA5WFggaXMgbm90
IHNldApDT05GSUdfSTJDX1JDQVI9eQoKIwojIEV4dGVybmFsIEkyQy9TTUJ1cyBhZGFwdGVy
IGRyaXZlcnMKIwojIENPTkZJR19JMkNfRElPTEFOX1UyQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0kyQ19DUDI2MTUgaXMgbm90IHNldAojIENPTkZJR19JMkNfUENJMVhYWFggaXMgbm90IHNl
dAojIENPTkZJR19JMkNfUk9CT1RGVVpaX09TSUYgaXMgbm90IHNldAojIENPTkZJR19JMkNf
VEFPU19FVk0gaXMgbm90IHNldAojIENPTkZJR19JMkNfVElOWV9VU0IgaXMgbm90IHNldAoK
IwojIE90aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVycwojCkNPTkZJR19JMkNfQ1JPU19FQ19U
VU5ORUw9eQojIENPTkZJR19JMkNfWEdFTkVfU0xJTVBSTyBpcyBub3Qgc2V0CiMgQ09ORklH
X0kyQ19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBvZiBJMkMgSGFyZHdhcmUgQnVzIHN1cHBv
cnQKCiMgQ09ORklHX0kyQ19TVFVCIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19TTEFWRT15CiMg
Q09ORklHX0kyQ19TTEFWRV9FRVBST00gaXMgbm90IHNldAojIENPTkZJR19JMkNfU0xBVkVf
VEVTVFVOSVQgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQ09SRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19ERUJVR19BTEdPIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVH
X0JVUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBzdXBwb3J0CgojIENPTkZJR19JM0MgaXMg
bm90IHNldApDT05GSUdfU1BJPXkKIyBDT05GSUdfU1BJX0RFQlVHIGlzIG5vdCBzZXQKQ09O
RklHX1NQSV9NQVNURVI9eQpDT05GSUdfU1BJX01FTT15CgojCiMgU1BJIE1hc3RlciBDb250
cm9sbGVyIERyaXZlcnMKIwojIENPTkZJR19TUElfQUxURVJBIGlzIG5vdCBzZXQKQ09ORklH
X1NQSV9BUk1BREFfMzcwMD15CiMgQ09ORklHX1NQSV9BWElfU1BJX0VOR0lORSBpcyBub3Qg
c2V0CkNPTkZJR19TUElfQkNNMjgzNT1tCkNPTkZJR19TUElfQkNNMjgzNUFVWD1tCiMgQ09O
RklHX1NQSV9CQ002M1hYX0hTU1BJIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9CQ01fUVNQST15
CiMgQ09ORklHX1NQSV9CSVRCQU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0NBREVOQ0Ug
aXMgbm90IHNldApDT05GSUdfU1BJX0NBREVOQ0VfUVVBRFNQST15CiMgQ09ORklHX1NQSV9D
QURFTkNFX1hTUEkgaXMgbm90IHNldApDT05GSUdfU1BJX0RFU0lHTldBUkU9bQpDT05GSUdf
U1BJX0RXX0RNQT15CiMgQ09ORklHX1NQSV9EV19QQ0kgaXMgbm90IHNldApDT05GSUdfU1BJ
X0RXX01NSU89bQpDT05GSUdfU1BJX0ZTTF9MUFNQST15CkNPTkZJR19TUElfRlNMX1FVQURT
UEk9eQojIENPTkZJR19TUElfSElTSV9LVU5QRU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJ
X0hJU0lfU0ZDX1YzWFggaXMgbm90IHNldApDT05GSUdfU1BJX05YUF9GTEVYU1BJPXkKIyBD
T05GSUdfU1BJX0dQSU8gaXMgbm90IHNldApDT05GSUdfU1BJX0lNWD1tCiMgQ09ORklHX1NQ
SV9GU0xfU1BJIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9GU0xfRFNQST15CkNPTkZJR19TUElf
TUVTT05fU1BJQ0M9bQpDT05GSUdfU1BJX01FU09OX1NQSUZDPW0KIyBDT05GSUdfU1BJX01J
Q1JPQ0hJUF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX01JQ1JPQ0hJUF9DT1JFX1FT
UEkgaXMgbm90IHNldAojIENPTkZJR19TUElfTVQ2NVhYIGlzIG5vdCBzZXQKIyBDT05GSUdf
U1BJX01US19OT1IgaXMgbm90IHNldAojIENPTkZJR19TUElfTlBDTV9GSVUgaXMgbm90IHNl
dAojIENPTkZJR19TUElfTlBDTV9QU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX09DX1RJ
TlkgaXMgbm90IHNldAojIENPTkZJR19TUElfT01BUDI0WFggaXMgbm90IHNldApDT05GSUdf
U1BJX09SSU9OPXkKQ09ORklHX1NQSV9QTDAyMj15CiMgQ09ORklHX1NQSV9QWEEyWFggaXMg
bm90IHNldApDT05GSUdfU1BJX1JPQ0tDSElQPXkKIyBDT05GSUdfU1BJX1JPQ0tDSElQX1NG
QyBpcyBub3Qgc2V0CkNPTkZJR19TUElfUlBDSUY9bQpDT05GSUdfU1BJX1JTUEk9bQpDT05G
SUdfU1BJX1FDT01fUVNQST1tCkNPTkZJR19TUElfUVVQPXkKQ09ORklHX1NQSV9RQ09NX0dF
Tkk9bQpDT05GSUdfU1BJX1MzQzY0WFg9eQojIENPTkZJR19TUElfU0MxOElTNjAyIGlzIG5v
dCBzZXQKQ09ORklHX1NQSV9TSF9NU0lPRj1tCiMgQ09ORklHX1NQSV9TSF9IU1BJIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1BJX1NJRklWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9TUFJE
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1NQUkRfQURJIGlzIG5vdCBzZXQKIyBDT05GSUdf
U1BJX1NVTjRJIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9TVU42ST15CiMgQ09ORklHX1NQSV9T
WU5RVUFDRVIgaXMgbm90IHNldAojIENPTkZJR19TUElfTVhJQyBpcyBub3Qgc2V0CkNPTkZJ
R19TUElfVEVHUkEyMTBfUVVBRD1tCkNPTkZJR19TUElfVEVHUkExMTQ9bQojIENPTkZJR19T
UElfVEVHUkEyMF9TRkxBU0ggaXMgbm90IHNldAojIENPTkZJR19TUElfVEVHUkEyMF9TTElO
SyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9USFVOREVSWCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NQSV9VTklQSElFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9YQ09NTSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NQSV9YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19TUElfWExQIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1BJX1pZTlFNUF9HUVNQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQ
SV9BTUQgaXMgbm90IHNldAoKIwojIFNQSSBNdWx0aXBsZXhlciBzdXBwb3J0CiMKIyBDT05G
SUdfU1BJX01VWCBpcyBub3Qgc2V0CgojCiMgU1BJIFByb3RvY29sIE1hc3RlcnMKIwpDT05G
SUdfU1BJX1NQSURFVj1tCiMgQ09ORklHX1NQSV9MT09QQkFDS19URVNUIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1BJX1RMRTYyWDAgaXMgbm90IHNldAojIENPTkZJR19TUElfU0xBVkUgaXMg
bm90IHNldApDT05GSUdfU1BJX0RZTkFNSUM9eQpDT05GSUdfU1BNST15CiMgQ09ORklHX1NQ
TUlfSElTSTM2NzAgaXMgbm90IHNldApDT05GSUdfU1BNSV9NU01fUE1JQ19BUkI9eQojIENP
TkZJR19TUE1JX01US19QTUlGIGlzIG5vdCBzZXQKIyBDT05GSUdfSFNJIGlzIG5vdCBzZXQK
Q09ORklHX1BQUz15CiMgQ09ORklHX1BQU19ERUJVRyBpcyBub3Qgc2V0CgojCiMgUFBTIGNs
aWVudHMgc3VwcG9ydAojCiMgQ09ORklHX1BQU19DTElFTlRfS1RJTUVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfUFBTX0NMSUVOVF9MRElTQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BQU19DTElF
TlRfR1BJTyBpcyBub3Qgc2V0CgojCiMgUFBTIGdlbmVyYXRvcnMgc3VwcG9ydAojCgojCiMg
UFRQIGNsb2NrIHN1cHBvcnQKIwpDT05GSUdfUFRQXzE1ODhfQ0xPQ0s9eQpDT05GSUdfUFRQ
XzE1ODhfQ0xPQ0tfT1BUSU9OQUw9eQpDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfRFRFPXkKQ09O
RklHX1BUUF8xNTg4X0NMT0NLX1FPUklRPXkKCiMKIyBFbmFibGUgUEhZTElCIGFuZCBORVRX
T1JLX1BIWV9USU1FU1RBTVBJTkcgdG8gc2VlIHRoZSBhZGRpdGlvbmFsIGNsb2Nrcy4KIwpD
T05GSUdfUFRQXzE1ODhfQ0xPQ0tfS1ZNPXkKIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfSURU
ODJQMzMgaXMgbm90IHNldAojIENPTkZJR19QVFBfMTU4OF9DTE9DS19JRFRDTSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BUUF8xNTg4X0NMT0NLX09DUCBpcyBub3Qgc2V0CiMgZW5kIG9mIFBU
UCBjbG9jayBzdXBwb3J0CgpDT05GSUdfUElOQ1RSTD15CkNPTkZJR19HRU5FUklDX1BJTkNU
UkxfR1JPVVBTPXkKQ09ORklHX1BJTk1VWD15CkNPTkZJR19HRU5FUklDX1BJTk1VWF9GVU5D
VElPTlM9eQpDT05GSUdfUElOQ09ORj15CkNPTkZJR19HRU5FUklDX1BJTkNPTkY9eQojIENP
TkZJR19ERUJVR19QSU5DVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9BTUQgaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX0FQUExFX0dQSU8gaXMgbm90IHNldAojIENPTkZJ
R19QSU5DVFJMX0FYUDIwOSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQ1k4Qzk1WDAg
aXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0tFRU1CQVkgaXMgbm90IHNldApDT05GSUdf
UElOQ1RSTF9NQVg3NzYyMD15CiMgQ09ORklHX1BJTkNUUkxfTUNQMjNTMDggaXMgbm90IHNl
dAojIENPTkZJR19QSU5DVFJMX01JQ1JPQ0hJUF9TR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BJTkNUUkxfT0NFTE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9SSzgwNSBpcyBu
b3Qgc2V0CkNPTkZJR19QSU5DVFJMX1JPQ0tDSElQPXkKQ09ORklHX1BJTkNUUkxfU0lOR0xF
PXkKIyBDT05GSUdfUElOQ1RSTF9TVE1GWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxf
U1gxNTBYIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfWllOUU1QPXkKQ09ORklHX1BJTkNU
UkxfT1dMPXkKQ09ORklHX1BJTkNUUkxfUzcwMD15CkNPTkZJR19QSU5DVFJMX1M5MDA9eQpD
T05GSUdfUElOQ1RSTF9CQ00yODM1PXkKQ09ORklHX1BJTkNUUkxfQkNNNDkwOD15CkNPTkZJ
R19QSU5DVFJMX0lQUk9DX0dQSU89eQpDT05GSUdfUElOQ1RSTF9OUzJfTVVYPXkKIyBDT05G
SUdfUElOQ1RSTF9BUzM3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQkVSTElOX0JH
NENUIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfSU1YPXkKQ09ORklHX1BJTkNUUkxfSU1Y
X1NDVT15CkNPTkZJR19QSU5DVFJMX0lNWDhNTT15CkNPTkZJR19QSU5DVFJMX0lNWDhNTj15
CkNPTkZJR19QSU5DVFJMX0lNWDhNUD15CkNPTkZJR19QSU5DVFJMX0lNWDhNUT15CkNPTkZJ
R19QSU5DVFJMX0lNWDhRTT15CkNPTkZJR19QSU5DVFJMX0lNWDhRWFA9eQpDT05GSUdfUElO
Q1RSTF9JTVg4RFhMPXkKQ09ORklHX1BJTkNUUkxfSU1YOFVMUD15CiMgQ09ORklHX1BJTkNU
UkxfSU1YUlQxMDUwIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfSU1YOTM9eQojIENPTkZJ
R19QSU5DVFJMX0lNWFJUMTE3MCBpcyBub3Qgc2V0CgojCiMgTWVkaWFUZWsgcGluY3RybCBk
cml2ZXJzCiMKQ09ORklHX0VJTlRfTVRLPXkKQ09ORklHX1BJTkNUUkxfTVRLPXkKQ09ORklH
X1BJTkNUUkxfTVRLX1YyPXkKQ09ORklHX1BJTkNUUkxfTVRLX01PT1JFPXkKQ09ORklHX1BJ
TkNUUkxfTVRLX1BBUklTPXkKQ09ORklHX1BJTkNUUkxfTVQyNzEyPXkKQ09ORklHX1BJTkNU
UkxfTVQ2NzY1PXkKQ09ORklHX1BJTkNUUkxfTVQ2Nzc5PXkKQ09ORklHX1BJTkNUUkxfTVQ2
Nzk1PXkKQ09ORklHX1BJTkNUUkxfTVQ2Nzk3PXkKQ09ORklHX1BJTkNUUkxfTVQ3NjIyPXkK
Q09ORklHX1BJTkNUUkxfTVQ3OTg2PXkKQ09ORklHX1BJTkNUUkxfTVQ4MTY3PXkKQ09ORklH
X1BJTkNUUkxfTVQ4MTczPXkKQ09ORklHX1BJTkNUUkxfTVQ4MTgzPXkKQ09ORklHX1BJTkNU
UkxfTVQ4MTg2PXkKQ09ORklHX1BJTkNUUkxfTVQ4MTg4PXkKQ09ORklHX1BJTkNUUkxfTVQ4
MTkyPXkKQ09ORklHX1BJTkNUUkxfTVQ4MTk1PXkKQ09ORklHX1BJTkNUUkxfTVQ4MzY1PXkK
Q09ORklHX1BJTkNUUkxfTVQ4NTE2PXkKQ09ORklHX1BJTkNUUkxfTVQ2Mzk3PXkKIyBlbmQg
b2YgTWVkaWFUZWsgcGluY3RybCBkcml2ZXJzCgpDT05GSUdfUElOQ1RSTF9NRVNPTj15CkNP
TkZJR19QSU5DVFJMX01FU09OX0dYQkI9eQpDT05GSUdfUElOQ1RSTF9NRVNPTl9HWEw9eQpD
T05GSUdfUElOQ1RSTF9NRVNPTjhfUE1YPXkKQ09ORklHX1BJTkNUUkxfTUVTT05fQVhHPXkK
Q09ORklHX1BJTkNUUkxfTUVTT05fQVhHX1BNWD15CkNPTkZJR19QSU5DVFJMX01FU09OX0cx
MkE9eQpDT05GSUdfUElOQ1RSTF9NRVNPTl9BMT15CkNPTkZJR19QSU5DVFJMX01FU09OX1M0
PXkKQ09ORklHX1BJTkNUUkxfTVZFQlU9eQpDT05GSUdfUElOQ1RSTF9BUk1BREFfQVA4MDY9
eQpDT05GSUdfUElOQ1RSTF9BUk1BREFfQ1AxMTA9eQpDT05GSUdfUElOQ1RSTF9BQzU9eQpD
T05GSUdfUElOQ1RSTF9BUk1BREFfMzdYWD15CkNPTkZJR19QSU5DVFJMX01TTT15CkNPTkZJ
R19QSU5DVFJMX0lQUTgwNzQ9eQpDT05GSUdfUElOQ1RSTF9JUFE2MDE4PXkKIyBDT05GSUdf
UElOQ1RSTF9NRE05NjA3IGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfTVNNODkxNj15CiMg
Q09ORklHX1BJTkNUUkxfTVNNODk1MyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVNN
ODk3NiBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX01TTTg5OTQ9eQpDT05GSUdfUElOQ1RS
TF9NU004OTk2PXkKQ09ORklHX1BJTkNUUkxfTVNNODk5OD15CiMgQ09ORklHX1BJTkNUUkxf
UUNNMjI5MCBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX1FDUzQwND15CkNPTkZJR19QSU5D
VFJMX1FERjJYWFg9eQpDT05GSUdfUElOQ1RSTF9RQ09NX1NQTUlfUE1JQz15CiMgQ09ORklH
X1BJTkNUUkxfUUNPTV9TU0JJX1BNSUMgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9TQzcx
ODA9eQpDT05GSUdfUElOQ1RSTF9TQzcyODA9eQojIENPTkZJR19QSU5DVFJMX1NDNzI4MF9M
UEFTU19MUEkgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9TQzgxODBYPXkKQ09ORklHX1BJ
TkNUUkxfU0M4MjgwWFA9eQojIENPTkZJR19QSU5DVFJMX1NETTY2MCBpcyBub3Qgc2V0CkNP
TkZJR19QSU5DVFJMX1NETTg0NT15CiMgQ09ORklHX1BJTkNUUkxfU002MTE1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9TTTYxMjUgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJM
X1NNNjM1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU002Mzc1IGlzIG5vdCBzZXQK
Q09ORklHX1BJTkNUUkxfU004MTUwPXkKQ09ORklHX1BJTkNUUkxfU004MjUwPXkKIyBDT05G
SUdfUElOQ1RSTF9TTTgyNTBfTFBBU1NfTFBJIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxf
U004MzUwPXkKQ09ORklHX1BJTkNUUkxfU004NDUwPXkKIyBDT05GSUdfUElOQ1RSTF9TTTg0
NTBfTFBBU1NfTFBJIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TQzgyODBYUF9MUEFT
U19MUEkgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9MUEFTU19MUEk9bQoKIwojIFJlbmVz
YXMgcGluY3RybCBkcml2ZXJzCiMKQ09ORklHX1BJTkNUUkxfUkVORVNBUz15CkNPTkZJR19Q
SU5DVFJMX1NIX1BGQz15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk5NT15CkNPTkZJR19Q
SU5DVFJMX1BGQ19SOEE3Nzk5MD15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk1MD15CkNP
TkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk1MT15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2
NT15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2MD15CkNPTkZJR19QSU5DVFJMX1BGQ19S
OEE3Nzk2MT15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzlGMD15CkNPTkZJR19QSU5DVFJM
X1BGQ19SOEE3Nzk4MD15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk3MD15CkNPTkZJR19Q
SU5DVFJMX1BGQ19SOEE3NzlBMD15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzlHMD15CkNP
TkZJR19QSU5DVFJMX1JaRzJMPXkKQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NEMwPXkKQ09O
RklHX1BJTkNUUkxfUEZDX1I4QTc3NEUxPXkKQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NEEx
PXkKQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NEIxPXkKQ09ORklHX1BJTkNUUkxfUlpWMk09
eQojIGVuZCBvZiBSZW5lc2FzIHBpbmN0cmwgZHJpdmVycwoKQ09ORklHX1BJTkNUUkxfU0FN
U1VORz15CkNPTkZJR19QSU5DVFJMX0VYWU5PUz15CkNPTkZJR19QSU5DVFJMX0VYWU5PU19B
Uk02ND15CiMgQ09ORklHX1BJTkNUUkxfU1BSRF9TQzk4NjAgaXMgbm90IHNldApDT05GSUdf
UElOQ1RSTF9TVU5YST15CiMgQ09ORklHX1BJTkNUUkxfU1VONElfQTEwIGlzIG5vdCBzZXQK
IyBDT05GSUdfUElOQ1RSTF9TVU41SSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1VO
NklfQTMxIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TVU42SV9BMzFfUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1BJTkNUUkxfU1VOOElfQTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9TVU44SV9BMzMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NVTjhJX0E4M1Qg
aXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NVTjhJX0E4M1RfUiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BJTkNUUkxfU1VOOElfQTIzX1IgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJM
X1NVTjhJX0gzIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfU1VOOElfSDNfUj15CiMgQ09O
RklHX1BJTkNUUkxfU1VOOElfVjNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TVU45
SV9BODAgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NVTjlJX0E4MF9SIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9TVU4yMElfRDEgaXMgbm90IHNldApDT05GSUdfUElOQ1RS
TF9TVU41MElfQTY0PXkKQ09ORklHX1BJTkNUUkxfU1VONTBJX0E2NF9SPXkKQ09ORklHX1BJ
TkNUUkxfU1VONTBJX0ExMDA9eQpDT05GSUdfUElOQ1RSTF9TVU41MElfQTEwMF9SPXkKQ09O
RklHX1BJTkNUUkxfU1VONTBJX0g1PXkKQ09ORklHX1BJTkNUUkxfU1VONTBJX0g2PXkKQ09O
RklHX1BJTkNUUkxfU1VONTBJX0g2X1I9eQpDT05GSUdfUElOQ1RSTF9TVU41MElfSDYxNj15
CkNPTkZJR19QSU5DVFJMX1NVTjUwSV9INjE2X1I9eQpDT05GSUdfUElOQ1RSTF9URUdSQT15
CkNPTkZJR19QSU5DVFJMX1RFR1JBMTI0PXkKQ09ORklHX1BJTkNUUkxfVEVHUkEyMTA9eQpD
T05GSUdfUElOQ1RSTF9URUdSQTE5ND15CkNPTkZJR19QSU5DVFJMX1RFR1JBX1hVU0I9eQpD
T05GSUdfUElOQ1RSTF9VTklQSElFUj15CiMgQ09ORklHX1BJTkNUUkxfVU5JUEhJRVJfTEQ0
IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9QUk80IGlzIG5vdCBzZXQK
IyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9TTEQ4IGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9VTklQSElFUl9QUk81IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElF
Ul9QWFMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9MRDZCIGlzIG5v
dCBzZXQKQ09ORklHX1BJTkNUUkxfVU5JUEhJRVJfTEQxMT15CkNPTkZJR19QSU5DVFJMX1VO
SVBISUVSX0xEMjA9eQpDT05GSUdfUElOQ1RSTF9VTklQSElFUl9QWFMzPXkKQ09ORklHX1BJ
TkNUUkxfVU5JUEhJRVJfTlgxPXkKQ09ORklHX1BJTkNUUkxfVklTQ09OVEk9eQpDT05GSUdf
UElOQ1RSTF9UTVBWNzcwMD15CkNPTkZJR19HUElPTElCPXkKQ09ORklHX0dQSU9MSUJfRkFT
VFBBVEhfTElNSVQ9NTEyCkNPTkZJR19PRl9HUElPPXkKQ09ORklHX0dQSU9fQUNQST15CkNP
TkZJR19HUElPTElCX0lSUUNISVA9eQojIENPTkZJR19ERUJVR19HUElPIGlzIG5vdCBzZXQK
Q09ORklHX0dQSU9fQ0RFVj15CkNPTkZJR19HUElPX0NERVZfVjE9eQpDT05GSUdfR1BJT19H
RU5FUklDPXkKQ09ORklHX0dQSU9fUkVHTUFQPW0KCiMKIyBNZW1vcnkgbWFwcGVkIEdQSU8g
ZHJpdmVycwojCiMgQ09ORklHX0dQSU9fNzRYWF9NTUlPIGlzIG5vdCBzZXQKQ09ORklHX0dQ
SU9fQUxURVJBPW0KIyBDT05GSUdfR1BJT19BTURQVCBpcyBub3Qgc2V0CkNPTkZJR19HUElP
X1JBU1BCRVJSWVBJX0VYUD15CkNPTkZJR19HUElPX0JDTV9YR1NfSVBST0M9eQpDT05GSUdf
R1BJT19CUkNNU1RCPXkKIyBDT05GSUdfR1BJT19DQURFTkNFIGlzIG5vdCBzZXQKQ09ORklH
X0dQSU9fREFWSU5DST15CkNPTkZJR19HUElPX0RXQVBCPXkKIyBDT05GSUdfR1BJT19FSUNf
U1BSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRVhBUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fRlRHUElPMDEwIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fR0VORVJJQ19QTEFURk9S
TT15CiMgQ09ORklHX0dQSU9fR1JHUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19ISVNJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19ITFdEIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9f
SU1YX1NDVT15CiMgQ09ORklHX0dQSU9fTE9HSUNWQyBpcyBub3Qgc2V0CkNPTkZJR19HUElP
X01CODZTN1g9eQpDT05GSUdfR1BJT19NUEM4WFhYPXkKQ09ORklHX0dQSU9fTVZFQlU9eQpD
T05GSUdfR1BJT19NWEM9eQpDT05GSUdfR1BJT19QTDA2MT15CkNPTkZJR19HUElPX1JDQVI9
eQpDT05GSUdfR1BJT19ST0NLQ0hJUD15CiMgQ09ORklHX0dQSU9fU0lGSVZFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19TUFJEIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19TWVNDT04g
aXMgbm90IHNldApDT05GSUdfR1BJT19URUdSQT15CkNPTkZJR19HUElPX1RFR1JBMTg2PXkK
IyBDT05GSUdfR1BJT19USFVOREVSWCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1VOSVBISUVS
PXkKQ09ORklHX0dQSU9fVkY2MTA9eQpDT05GSUdfR1BJT19WSVNDT05UST15CkNPTkZJR19H
UElPX1dDRDkzNFg9bQpDT05GSUdfR1BJT19YR0VORT15CkNPTkZJR19HUElPX1hHRU5FX1NC
PXkKIyBDT05GSUdfR1BJT19YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19HUElPX1hMUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fWllOUSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1pZ
TlFNUF9NT0RFUElOPXkKIyBDT05GSUdfR1BJT19BTURfRkNIIGlzIG5vdCBzZXQKIyBlbmQg
b2YgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKCiMKIyBJMkMgR1BJTyBleHBhbmRlcnMK
IwojIENPTkZJR19HUElPX0FETlAgaXMgbm90IHNldAojIENPTkZJR19HUElPX0dXX1BMRCBp
cyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTUFYNzMwMCBpcyBub3Qgc2V0CkNPTkZJR19HUElP
X01BWDczMlg9eQojIENPTkZJR19HUElPX01BWDczMlhfSVJRIGlzIG5vdCBzZXQKQ09ORklH
X0dQSU9fUENBOTUzWD15CkNPTkZJR19HUElPX1BDQTk1M1hfSVJRPXkKIyBDT05GSUdfR1BJ
T19QQ0E5NTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0Y4NTdYIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19UUElDMjgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBHUElPIGV4
cGFuZGVycwoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX0JEOTU3MU1X
Vj1tCkNPTkZJR19HUElPX01BWDc3NjIwPXkKQ09ORklHX0dQSU9fU0wyOENQTEQ9bQojIENP
TkZJR19HUElPX1dNODk5NCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1GRCBHUElPIGV4cGFuZGVy
cwoKIwojIFBDSSBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQlQ4WFggaXMgbm90
IHNldAojIENPTkZJR19HUElPX1BDSV9JRElPXzE2IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19QQ0lFX0lESU9fMjQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JEQzMyMVggaXMgbm90
IHNldAojIGVuZCBvZiBQQ0kgR1BJTyBleHBhbmRlcnMKCiMKIyBTUEkgR1BJTyBleHBhbmRl
cnMKIwojIENPTkZJR19HUElPXzc0WDE2NCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTUFY
MzE5MVggaXMgbm90IHNldAojIENPTkZJR19HUElPX01BWDczMDEgaXMgbm90IHNldAojIENP
TkZJR19HUElPX01DMzM4ODAgaXMgbm90IHNldAojIENPTkZJR19HUElPX1BJU09TUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dQSU9fWFJBMTQwMyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNQSSBH
UElPIGV4cGFuZGVycwoKIwojIFVTQiBHUElPIGV4cGFuZGVycwojCiMgZW5kIG9mIFVTQiBH
UElPIGV4cGFuZGVycwoKIwojIFZpcnR1YWwgR1BJTyBkcml2ZXJzCiMKIyBDT05GSUdfR1BJ
T19BR0dSRUdBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NT0NLVVAgaXMgbm90IHNl
dAojIENPTkZJR19HUElPX1ZJUlRJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fU0lNIGlz
IG5vdCBzZXQKIyBlbmQgb2YgVmlydHVhbCBHUElPIGRyaXZlcnMKCiMgQ09ORklHX1cxIGlz
IG5vdCBzZXQKQ09ORklHX1BPV0VSX1JFU0VUPXkKQ09ORklHX1BPV0VSX1JFU0VUX0JSQ01T
VEI9eQojIENPTkZJR19QT1dFUl9SRVNFVF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9X
RVJfUkVTRVRfR1BJT19SRVNUQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRf
SElTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX0xJTktTVEFUSU9OIGlzIG5v
dCBzZXQKQ09ORklHX1BPV0VSX1JFU0VUX01TTT15CkNPTkZJR19QT1dFUl9SRVNFVF9RQ09N
X1BPTj1tCiMgQ09ORklHX1BPV0VSX1JFU0VUX0xUQzI5NTIgaXMgbm90IHNldAojIENPTkZJ
R19QT1dFUl9SRVNFVF9NVDYzMjMgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9S
RUdVTEFUT1IgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9SRVNUQVJUIGlzIG5v
dCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfVkVYUFJFU1MgaXMgbm90IHNldApDT05GSUdf
UE9XRVJfUkVTRVRfWEdFTkU9eQpDT05GSUdfUE9XRVJfUkVTRVRfU1lTQ09OPXkKIyBDT05G
SUdfUE9XRVJfUkVTRVRfU1lTQ09OX1BPV0VST0ZGIGlzIG5vdCBzZXQKQ09ORklHX1JFQk9P
VF9NT0RFPXkKQ09ORklHX1NZU0NPTl9SRUJPT1RfTU9ERT15CiMgQ09ORklHX05WTUVNX1JF
Qk9PVF9NT0RFIGlzIG5vdCBzZXQKQ09ORklHX1BPV0VSX1NVUFBMWT15CiMgQ09ORklHX1BP
V0VSX1NVUFBMWV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9TVVBQTFlfSFdNT049
eQojIENPTkZJR19QREFfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19HRU5FUklDX0FEQ19C
QVRURVJZIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA1WFhYX1BPV0VSIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQURQNTA2MSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfQ1cyMDE1IGlzIG5vdCBzZXQKIyBDT05GSUdf
QkFUVEVSWV9EUzI3ODAgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RTMjc4MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfRFMyNzgyIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFU
VEVSWV9TQU1TVU5HX1NESSBpcyBub3Qgc2V0CkNPTkZJR19CQVRURVJZX1NCUz1tCiMgQ09O
RklHX0NIQVJHRVJfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFOQUdFUl9TQlMgaXMgbm90
IHNldApDT05GSUdfQkFUVEVSWV9CUTI3WFhYPXkKQ09ORklHX0JBVFRFUllfQlEyN1hYWF9J
MkM9eQojIENPTkZJR19CQVRURVJZX0JRMjdYWFhfRFRfVVBEQVRFU19OVk0gaXMgbm90IHNl
dAojIENPTkZJR19BWFAyMFhfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX01B
WDE3MDQwIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfTUFYMTcwNDI9bQojIENPTkZJR19D
SEFSR0VSX0lTUDE3MDQgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDg5MDMgaXMg
bm90IHNldAojIENPTkZJR19DSEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfTUFOQUdFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NIQVJHRVJfTFQzNjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdF
Ul9MVEM0MTYyTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfREVURUNUT1JfTUFYMTQ2
NTYgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDc3OTc2IGlzIG5vdCBzZXQKQ09O
RklHX0NIQVJHRVJfTVQ2MzYwPW0KIyBDT05GSUdfQ0hBUkdFUl9RQ09NX1NNQkIgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQxNVggaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX0JRMjQxOTAgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQyNTcgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQ3MzUgaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX0JRMjUxNVggaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9CUTI1ODkwPW0KQ09ORklH
X0NIQVJHRVJfQlEyNTk4MD1tCiMgQ09ORklHX0NIQVJHRVJfQlEyNTZYWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfUks4MTcgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX1NN
QjM0NyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR0FVR0VfTFRDMjk0MSBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBVFRFUllfR09MREZJU0ggaXMgbm90IHNldAojIENPTkZJR19CQVRU
RVJZX1JUNTAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfUlQ5NDU1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ0hBUkdFUl9DUk9TX1VTQlBEIGlzIG5vdCBzZXQKQ09ORklHX0NIQVJH
RVJfQ1JPU19QQ0hHPXkKIyBDT05GSUdfQ0hBUkdFUl9VQ1MxMDAyIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ0hBUkdFUl9CRDk5OTU0IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9VRzMx
MDUgaXMgbm90IHNldApDT05GSUdfSFdNT049eQojIENPTkZJR19IV01PTl9ERUJVR19DSElQ
IGlzIG5vdCBzZXQKCiMKIyBOYXRpdmUgZHJpdmVycwojCiMgQ09ORklHX1NFTlNPUlNfQUQ3
MzE0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRDc0MTQgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0FENzQxOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAy
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAyNiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQURNMTAyOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAz
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTE3NyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQURNOTI0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzMx
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQxMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQURUNzQxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQ2
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQ3MCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQURUNzQ3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQUhUMTAg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FRVUFDT01QVVRFUl9ENU5FWFQgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0FTMzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19BU0M3NjIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BWElfRkFOX0NPTlRST0wg
aXMgbm90IHNldApDT05GSUdfU0VOU09SU19BUk1fU0NNST15CkNPTkZJR19TRU5TT1JTX0FS
TV9TQ1BJPXkKIyBDT05GSUdfU0VOU09SU19BVFhQMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfQ09SU0FJUl9DUFJPIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19DT1JTQUlS
X1BTVSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRFJJVkVURU1QIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19EUzYyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRFMx
NjIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JNUtfQU1CIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19GNzE4MDVGIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19GNzE4
ODJGRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRjc1Mzc1UyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfRlRTVEVVVEFURVMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0dMNTE4U00gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0dMNTIwU00gaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0c3NjBBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19H
NzYyIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfR1BJT19GQU49bQojIENPTkZJR19TRU5T
T1JTX0hJSDYxMzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lCTUFFTSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfSUJNUEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19JSU9fSFdNT04gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lUODcgaXMgbm90IHNl
dApDT05GSUdfU0VOU09SU19KQzQyPW0KIyBDT05GSUdfU0VOU09SU19QT1dSMTIyMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTElORUFHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTFRDMjk0NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk0N19JMkMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzI5NDdfU1BJIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MVEMyOTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMy
OTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MTUxIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MVEM0MjE1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0
MjIyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MjQ1IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MVEM0MjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0
MjYxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxMTExIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19NQVgxMjcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDE2
MDY1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxNjE5IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19NQVgxNjY4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgx
OTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDMxNzIyIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19NQVgzMTczMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFY
MzE3NjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2MjAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX01BWDY2MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01B
WDY2MzkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2NTAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX01BWDY2OTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01B
WDMxNzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQ1AzMDIxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19UQzY1NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVFBT
MjM4NjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01SNzUyMDMgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0FEQ1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTYz
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTcwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19MTTczIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTE03NT1tCiMgQ09ORklH
X1NFTlNPUlNfTE03NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE03OCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTE04MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TE04MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE04NSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfTE04NyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xNOTA9bQojIENP
TkZJR19TRU5TT1JTX0xNOTIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTMgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTUyMzQgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0xNOTUyNDEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTUyNDUgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1BDODczNjAgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX1BDODc0MjcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05UQ19USEVSTUlT
VE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OQ1Q2NjgzIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19OQ1Q2Nzc1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OQ1Q2
Nzc1X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTkNUNzgwMiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfTkNUNzkwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TlBDTTdYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlpYVF9LUkFLRU4yIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19OWlhUX1NNQVJUMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfT0NDX1A4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUENGODU5
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1BNQlVTIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNf
UFdNX0ZBTj1tCkNPTkZJR19TRU5TT1JTX1JBU1BCRVJSWVBJX0hXTU9OPW0KQ09ORklHX1NF
TlNPUlNfU0wyOENQTEQ9bQojIENPTkZJR19TRU5TT1JTX1NCVFNJIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19TQlJNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUMTUg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NIVDIxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19TSFQzeCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUNHggaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1NIVEMxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19TSVM1NTk1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19ETUUxNzM3IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19FTUMxNDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19FTUMyMTAzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19FTUMyMzA1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19FTUM2VzIwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfU01TQzQ3TTEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NNU0M0N00xOTIgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1NNU0M0N0IzOTcgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1NDSDU2MjcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NDSDU2MzYg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NUVFM3NTEgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1NNTTY2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURDMTI4RDgx
OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURTNzgyOCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQURTNzg3MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQU1DNjgy
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5BMjA5IGlzIG5vdCBzZXQKQ09ORklH
X1NFTlNPUlNfSU5BMlhYPW0KIyBDT05GSUdfU0VOU09SU19JTkEyMzggaXMgbm90IHNldApD
T05GSUdfU0VOU09SU19JTkEzMjIxPW0KIyBDT05GSUdfU0VOU09SU19UQzc0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19USE1DNTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X1RNUDEwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QMTAzIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19UTVAxMDggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RN
UDQwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QNDIxIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19UTVA0NjQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDUx
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVkVYUFJFU1MgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX1ZJQTY4NkEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1ZUMTIx
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVlQ4MjMxIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19XODM3NzNHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3ODFE
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3OTFEIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19XODM3OTJEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3OTMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc5NSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfVzgzTDc4NVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODNMNzg2
TkcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4MzYyN0hGIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19XODM2MjdFSEYgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1hH
RU5FIGlzIG5vdCBzZXQKCiMKIyBBQ1BJIGRyaXZlcnMKIwojIENPTkZJR19TRU5TT1JTX0FD
UElfUE9XRVIgaXMgbm90IHNldApDT05GSUdfVEhFUk1BTD15CiMgQ09ORklHX1RIRVJNQUxf
TkVUTElOSyBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfU1RBVElTVElDUyBpcyBub3Qg
c2V0CkNPTkZJR19USEVSTUFMX0VNRVJHRU5DWV9QT1dFUk9GRl9ERUxBWV9NUz0wCkNPTkZJ
R19USEVSTUFMX0hXTU9OPXkKQ09ORklHX1RIRVJNQUxfT0Y9eQojIENPTkZJR19USEVSTUFM
X1dSSVRBQkxFX1RSSVBTIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1Zf
U1RFUF9XSVNFPXkKIyBDT05GSUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9GQUlSX1NIQVJFIGlz
IG5vdCBzZXQKIyBDT05GSUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9VU0VSX1NQQUNFIGlzIG5v
dCBzZXQKIyBDT05GSUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9QT1dFUl9BTExPQ0FUT1IgaXMg
bm90IHNldAojIENPTkZJR19USEVSTUFMX0dPVl9GQUlSX1NIQVJFIGlzIG5vdCBzZXQKQ09O
RklHX1RIRVJNQUxfR09WX1NURVBfV0lTRT15CiMgQ09ORklHX1RIRVJNQUxfR09WX0JBTkdf
QkFORyBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfR09WX1VTRVJfU1BBQ0UgaXMgbm90
IHNldApDT05GSUdfVEhFUk1BTF9HT1ZfUE9XRVJfQUxMT0NBVE9SPXkKQ09ORklHX0NQVV9U
SEVSTUFMPXkKQ09ORklHX0NQVV9GUkVRX1RIRVJNQUw9eQpDT05GSUdfREVWRlJFUV9USEVS
TUFMPXkKQ09ORklHX1RIRVJNQUxfRU1VTEFUSU9OPXkKIyBDT05GSUdfVEhFUk1BTF9NTUlP
IGlzIG5vdCBzZXQKQ09ORklHX0hJU0lfVEhFUk1BTD15CiMgQ09ORklHX0lNWF9USEVSTUFM
IGlzIG5vdCBzZXQKQ09ORklHX0lNWF9TQ19USEVSTUFMPW0KQ09ORklHX0lNWDhNTV9USEVS
TUFMPW0KIyBDT05GSUdfSzNfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDc3NjIw
X1RIRVJNQUwgaXMgbm90IHNldApDT05GSUdfUU9SSVFfVEhFUk1BTD1tCkNPTkZJR19TVU44
SV9USEVSTUFMPXkKQ09ORklHX1JPQ0tDSElQX1RIRVJNQUw9bQpDT05GSUdfUkNBUl9USEVS
TUFMPXkKQ09ORklHX1JDQVJfR0VOM19USEVSTUFMPXkKQ09ORklHX1JaRzJMX1RIRVJNQUw9
eQpDT05GSUdfQVJNQURBX1RIRVJNQUw9eQpDT05GSUdfTVRLX1RIRVJNQUw9eQpDT05GSUdf
QU1MT0dJQ19USEVSTUFMPXkKCiMKIyBCcm9hZGNvbSB0aGVybWFsIGRyaXZlcnMKIwpDT05G
SUdfQkNNMjcxMV9USEVSTUFMPW0KQ09ORklHX0JDTTI4MzVfVEhFUk1BTD1tCkNPTkZJR19C
UkNNU1RCX1RIRVJNQUw9bQpDT05GSUdfQkNNX05TX1RIRVJNQUw9eQpDT05GSUdfQkNNX1NS
X1RIRVJNQUw9eQojIGVuZCBvZiBCcm9hZGNvbSB0aGVybWFsIGRyaXZlcnMKCiMKIyBTYW1z
dW5nIHRoZXJtYWwgZHJpdmVycwojCkNPTkZJR19FWFlOT1NfVEhFUk1BTD15CiMgZW5kIG9m
IFNhbXN1bmcgdGhlcm1hbCBkcml2ZXJzCgojCiMgTlZJRElBIFRlZ3JhIHRoZXJtYWwgZHJp
dmVycwojCkNPTkZJR19URUdSQV9TT0NUSEVSTT1tCkNPTkZJR19URUdSQV9CUE1QX1RIRVJN
QUw9bQojIGVuZCBvZiBOVklESUEgVGVncmEgdGhlcm1hbCBkcml2ZXJzCgojIENPTkZJR19H
RU5FUklDX0FEQ19USEVSTUFMIGlzIG5vdCBzZXQKCiMKIyBRdWFsY29tbSB0aGVybWFsIGRy
aXZlcnMKIwpDT05GSUdfUUNPTV9UU0VOUz15CkNPTkZJR19RQ09NX1NQTUlfQURDX1RNNT1t
CkNPTkZJR19RQ09NX1NQTUlfVEVNUF9BTEFSTT1tCkNPTkZJR19RQ09NX0xNSD1tCiMgZW5k
IG9mIFF1YWxjb21tIHRoZXJtYWwgZHJpdmVycwoKQ09ORklHX1VOSVBISUVSX1RIRVJNQUw9
eQojIENPTkZJR19TUFJEX1RIRVJNQUwgaXMgbm90IHNldApDT05GSUdfV0FUQ0hET0c9eQpD
T05GSUdfV0FUQ0hET0dfQ09SRT15CiMgQ09ORklHX1dBVENIRE9HX05PV0FZT1VUIGlzIG5v
dCBzZXQKQ09ORklHX1dBVENIRE9HX0hBTkRMRV9CT09UX0VOQUJMRUQ9eQpDT05GSUdfV0FU
Q0hET0dfT1BFTl9USU1FT1VUPTAKIyBDT05GSUdfV0FUQ0hET0dfU1lTRlMgaXMgbm90IHNl
dAojIENPTkZJR19XQVRDSERPR19IUlRJTUVSX1BSRVRJTUVPVVQgaXMgbm90IHNldAoKIwoj
IFdhdGNoZG9nIFByZXRpbWVvdXQgR292ZXJub3JzCiMKIyBDT05GSUdfV0FUQ0hET0dfUFJF
VElNRU9VVF9HT1YgaXMgbm90IHNldAoKIwojIFdhdGNoZG9nIERldmljZSBEcml2ZXJzCiMK
IyBDT05GSUdfU09GVF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fV0FUQ0hE
T0cgaXMgbm90IHNldAojIENPTkZJR19XREFUX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1hJ
TElOWF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1pJSVJBVkVfV0FUQ0hET0cgaXMg
bm90IHNldApDT05GSUdfU0wyOENQTERfV0FUQ0hET0c9bQpDT05GSUdfQVJNX1NQODA1X1dB
VENIRE9HPXkKQ09ORklHX0FSTV9TQlNBX1dBVENIRE9HPXkKIyBDT05GSUdfQVJNQURBXzM3
WFhfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19DQURFTkNFX1dBVENIRE9HIGlzIG5v
dCBzZXQKQ09ORklHX1MzQzI0MTBfV0FUQ0hET0c9eQpDT05GSUdfRFdfV0FUQ0hET0c9eQoj
IENPTkZJR19LM19SVElfV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfU1VOWElfV0FUQ0hE
T0c9bQpDT05GSUdfTlBDTTdYWF9XQVRDSERPRz15CiMgQ09ORklHX01BWDYzWFhfV0FUQ0hE
T0cgaXMgbm90IHNldAojIENPTkZJR19NQVg3NzYyMF9XQVRDSERPRyBpcyBub3Qgc2V0CkNP
TkZJR19JTVgyX1dEVD15CkNPTkZJR19JTVhfU0NfV0RUPW0KIyBDT05GSUdfSU1YN1VMUF9X
RFQgaXMgbm90IHNldAojIENPTkZJR19URUdSQV9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJ
R19RQ09NX1dEVD1tCkNPTkZJR19NRVNPTl9HWEJCX1dBVENIRE9HPW0KQ09ORklHX01FU09O
X1dBVENIRE9HPW0KQ09ORklHX01FRElBVEVLX1dBVENIRE9HPXkKQ09ORklHX0FSTV9TTUNf
V0FUQ0hET0c9eQpDT05GSUdfUkVORVNBU19XRFQ9eQojIENPTkZJR19SRU5FU0FTX1JaQVdE
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTkVTQVNfUlpOMVdEVCBpcyBub3Qgc2V0CkNPTkZJ
R19SRU5FU0FTX1JaRzJMV0RUPXkKQ09ORklHX1VOSVBISUVSX1dBVENIRE9HPXkKIyBDT05G
SUdfU1BSRF9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19QTTg5MTZfV0FUQ0hET0c9bQoj
IENPTkZJR19WSVNDT05USV9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FQUExFX1dB
VENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxJTTcxMDFfV0RUIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTYzMDBFU0JfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBfV0FUQ0hET0cgaXMg
bm90IHNldApDT05GSUdfQkNNMjgzNV9XRFQ9eQpDT05GSUdfQkNNNzAzOF9XRFQ9bQojIENP
TkZJR19NRU5fQTIxX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1hFTl9XRFQgaXMgbm90IHNl
dAoKIwojIFBDSS1iYXNlZCBXYXRjaGRvZyBDYXJkcwojCiMgQ09ORklHX1BDSVBDV0FUQ0hE
T0cgaXMgbm90IHNldAojIENPTkZJR19XRFRQQ0kgaXMgbm90IHNldAoKIwojIFVTQi1iYXNl
ZCBXYXRjaGRvZyBDYXJkcwojCiMgQ09ORklHX1VTQlBDV0FUQ0hET0cgaXMgbm90IHNldAoj
IENPTkZJR19LRUVNQkFZX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX1NTQl9QT1NTSUJM
RT15CiMgQ09ORklHX1NTQiBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX1BPU1NJQkxFPXkKIyBD
T05GSUdfQkNNQSBpcyBub3Qgc2V0CgojCiMgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVy
cwojCkNPTkZJR19NRkRfQ09SRT15CiMgQ09ORklHX01GRF9BTFRFUkFfQTEwU1IgaXMgbm90
IHNldApDT05GSUdfTUZEX0FMVEVSQV9TWVNNR1I9eQojIENPTkZJR19NRkRfQUNUODk0NUEg
aXMgbm90IHNldAojIENPTkZJR19NRkRfU1VONElfR1BBREMgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfQVMzNzExIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FTMzcyMiBpcyBub3Qgc2V0
CiMgQ09ORklHX1BNSUNfQURQNTUyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BQVQyODcw
X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVRNRUxfRkxFWENPTSBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9BVE1FTF9ITENEQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9CQ001
OTBYWCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfQkQ5NTcxTVdWPXkKIyBDT05GSUdfTUZEX0FD
MTAwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9BWFAyMFg9eQpDT05GSUdfTUZEX0FYUDIwWF9J
MkM9eQpDT05GSUdfTUZEX0FYUDIwWF9SU0I9eQpDT05GSUdfTUZEX0NST1NfRUNfREVWPXkK
IyBDT05GSUdfTUZEX01BREVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNfREE5MDNYIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1Ml9TUEkgaXMgbm90IHNldAojIENPTkZJR19N
RkRfREE5MDUyX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNTUgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfREE5MDYyIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA2MyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkxNTAgaXMgbm90IHNldAojIENPTkZJR19NRkRf
RExOMiBpcyBub3Qgc2V0CkNPTkZJR19NRkRfRVhZTk9TX0xQQVNTPW0KIyBDT05GSUdfTUZE
X0dBVEVXT1JLU19HU0MgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUMxM1hYWF9TUEkgaXMg
bm90IHNldAojIENPTkZJR19NRkRfTUMxM1hYWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19N
RkRfTVAyNjI5IGlzIG5vdCBzZXQKQ09ORklHX01GRF9ISTY0MjFfUE1JQz15CiMgQ09ORklH
X01GRF9ISTY0MjFfU1BNSSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfSEk2NTVYX1BNSUM9eQoj
IENPTkZJR19IVENfUEFTSUMzIGlzIG5vdCBzZXQKIyBDT05GSUdfSFRDX0kyQ1BMRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xQQ19JQ0ggaXMgbm90IHNldAojIENPTkZJR19MUENfU0NIIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0lRUzYyWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9K
QU5aX0NNT0RJTyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9LRU1QTEQgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfODhQTTgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODA1IGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEXzg4UE04NjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X01BWDE0NTc3IGlzIG5vdCBzZXQKQ09ORklHX01GRF9NQVg3NzYyMD15CiMgQ09ORklHX01G
RF9NQVg3NzY1MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3NzY4NiBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9NQVg3NzY5MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3Nzcx
NCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3Nzg0MyBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9NQVg4OTA3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5MjUgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfTUFYODk5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTk4
IGlzIG5vdCBzZXQKQ09ORklHX01GRF9NVDYzNjA9eQojIENPTkZJR19NRkRfTVQ2MzcwIGlz
IG5vdCBzZXQKQ09ORklHX01GRF9NVDYzOTc9eQojIENPTkZJR19NRkRfTUVORjIxQk1DIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX09DRUxPVCBpcyBub3Qgc2V0CiMgQ09ORklHX0VaWF9Q
Q0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0NQQ0FQIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1ZJUEVSQk9BUkQgaXMgbm90IHNldAojIENPTkZJR19NRkRfTlRYRUMgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfUkVUVSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9QQ0Y1MDYzMyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9RQ09NX1JQTSBpcyBub3Qgc2V0CkNPTkZJR19NRkRf
U1BNSV9QTUlDPXkKIyBDT05GSUdfTUZEX1NZNzYzNkEgaXMgbm90IHNldAojIENPTkZJR19N
RkRfUkRDMzIxWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SVDQ4MzEgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfUlQ1MDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNTEyMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9SQzVUNTgzIGlzIG5vdCBzZXQKQ09ORklHX01GRF9SSzgw
OD15CiMgQ09ORklHX01GRF9STjVUNjE4IGlzIG5vdCBzZXQKQ09ORklHX01GRF9TRUNfQ09S
RT15CiMgQ09ORklHX01GRF9TSTQ3NlhfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfU0lN
UExFX01GRF9JMkM9eQpDT05GSUdfTUZEX1NMMjhDUExEPXkKIyBDT05GSUdfTUZEX1NNNTAx
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1NDMjdYWF9QTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NUTVBFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX1NVTjZJX1BSQ00gaXMgbm90IHNldApDT05GSUdfTUZEX1NZU0NP
Tj15CiMgQ09ORklHX01GRF9USV9BTTMzNVhfVFNDQURDIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX0xQMzk0MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDg3ODggaXMgbm90IHNldAoj
IENPTkZJR19NRkRfVElfTE1VIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1BBTE1BUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RQUzYxMDVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUwMTAg
aXMgbm90IHNldAojIENPTkZJR19UUFM2NTA3WCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9U
UFM2NTA4NiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM2NTA5MCBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9UUFM2NTIxNyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9USV9MUDg3M1gg
aXMgbm90IHNldAojIENPTkZJR19NRkRfVElfTFA4NzU2NSBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9UUFM2NTIxOCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM2NTg2WCBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9UUFM2NTkxMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM2
NTkxMl9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTJfU1BJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVFdMNDAzMF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfVFdMNjA0MF9D
T1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX0xNMzUzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UQzM1ODlYIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1RRTVg4NiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9WWDg1
NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MT0NITkFHQVIgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfQVJJWk9OQV9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVJJWk9OQV9TUEkg
aXMgbm90IHNldAojIENPTkZJR19NRkRfV004NDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1dNODMxWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004MzFYX1NQSSBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9XTTgzNTBfSTJDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9XTTg5
OTQ9bQpDT05GSUdfTUZEX1JPSE1fQkQ3MThYWD15CiMgQ09ORklHX01GRF9ST0hNX0JENzE4
MjggaXMgbm90IHNldAojIENPTkZJR19NRkRfUk9ITV9CRDk1N1hNVUYgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfU1RQTUlDMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TVE1GWCBpcyBu
b3Qgc2V0CkNPTkZJR19NRkRfV0NEOTM0WD1tCiMgQ09ORklHX01GRF9BVEMyNjBYX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9LSEFEQVNfTUNVIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1FDT01fUE04MDA4IGlzIG5vdCBzZXQKQ09ORklHX01GRF9WRVhQUkVTU19TWVNSRUc9
eQojIENPTkZJR19SQVZFX1NQX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfSU5URUxf
TTEwX0JNQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SU01VX0kyQyBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9SU01VX1NQSSBpcyBub3Qgc2V0CiMgZW5kIG9mIE11bHRpZnVuY3Rpb24g
ZGV2aWNlIGRyaXZlcnMKCkNPTkZJR19SRUdVTEFUT1I9eQojIENPTkZJR19SRUdVTEFUT1Jf
REVCVUcgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQojIENP
TkZJR19SRUdVTEFUT1JfVklSVFVBTF9DT05TVU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9VU0VSU1BBQ0VfQ09OU1VNRVIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFU
T1JfODhQRzg2WCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9BQ1Q4ODY1IGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0FENTM5OCBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9BTkFUT1AgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfQVJNX1NDTUkg
aXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0FYUDIwWD15CkNPTkZJR19SRUdVTEFUT1Jf
QkQ3MThYWD15CkNPTkZJR19SRUdVTEFUT1JfQkQ5NTcxTVdWPXkKIyBDT05GSUdfUkVHVUxB
VE9SX0NST1NfRUMgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfREE5MTIxIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0RBOTIxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9EQTkyMTEgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0ZBTjUzNTU1PXkK
IyBDT05GSUdfUkVHVUxBVE9SX0ZBTjUzODgwIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRP
Ul9HUElPPXkKIyBDT05GSUdfUkVHVUxBVE9SX0hJNjQyMSBpcyBub3Qgc2V0CkNPTkZJR19S
RUdVTEFUT1JfSEk2NDIxVjUzMD15CkNPTkZJR19SRUdVTEFUT1JfSEk2NTVYPXkKIyBDT05G
SUdfUkVHVUxBVE9SX0lTTDkzMDUgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfSVNM
NjI3MUEgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTFAzOTcxIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX0xQMzk3MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRP
Ul9MUDg3MlggaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTFA4NzU1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xUQzM1ODkgaXMgbm90IHNldAojIENPTkZJR19SRUdV
TEFUT1JfTFRDMzY3NiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVgxNTg2IGlz
IG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NQVg3NzYyMD15CiMgQ09ORklHX1JFR1VMQVRP
Ul9NQVg4NjQ5IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01BWDg2NjAgaXMgbm90
IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUFYODg5MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9NQVg4OTUyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NQVg4OTczPXkK
IyBDT05GSUdfUkVHVUxBVE9SX01BWDIwMDg2IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SX01BWDc3ODI2IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01DUDE2NTAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01QNTQxNiBpcyBub3Qgc2V0CkNPTkZJR19S
RUdVTEFUT1JfTVA4ODU5PXkKIyBDT05GSUdfUkVHVUxBVE9SX01QODg2WCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFR1VMQVRPUl9NUFE3OTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SX01UNjMxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NVDYzMTUgaXMgbm90
IHNldAojIENPTkZJR19SRUdVTEFUT1JfTVQ2MzIzIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVH
VUxBVE9SX01UNjMzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NVDYzMzIgaXMg
bm90IHNldApDT05GSUdfUkVHVUxBVE9SX01UNjM1OD15CkNPTkZJR19SRUdVTEFUT1JfTVQ2
MzU5PXkKQ09ORklHX1JFR1VMQVRPUl9NVDYzNjA9eQojIENPTkZJR19SRUdVTEFUT1JfTVQ2
MzgwIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NVDYzOTc9eQpDT05GSUdfUkVHVUxB
VE9SX1BDQTk0NTA9eQpDT05GSUdfUkVHVUxBVE9SX1BGOFgwMD15CkNPTkZJR19SRUdVTEFU
T1JfUEZVWkUxMDA9eQojIENPTkZJR19SRUdVTEFUT1JfUFY4ODA2MCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9QVjg4MDgwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9S
X1BWODgwOTAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1BXTT15CkNPTkZJR19SRUdV
TEFUT1JfUUNPTV9SUE1IPXkKQ09ORklHX1JFR1VMQVRPUl9RQ09NX1NNRF9SUE09eQpDT05G
SUdfUkVHVUxBVE9SX1FDT01fU1BNST15CiMgQ09ORklHX1JFR1VMQVRPUl9RQ09NX1VTQl9W
QlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1JBU1BCRVJSWVBJX1RPVUNIU0NS
RUVOX0FUVElOWSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUks4MDg9eQpDT05GSUdf
UkVHVUxBVE9SX1JPSE09eQojIENPTkZJR19SRUdVTEFUT1JfUlQ0ODAxIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX1JUNTE5MEEgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFU
T1JfUlQ1NzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1JUNjE2MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SVDYyNDUgaXMgbm90IHNldAojIENPTkZJR19SRUdV
TEFUT1JfUlRRMjEzNCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SVE1WMjAgaXMg
bm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUlRRNjc1MiBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFR1VMQVRPUl9TMk1QQTAxIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9TMk1QUzEx
PXkKIyBDT05GSUdfUkVHVUxBVE9SX1M1TTg3NjcgaXMgbm90IHNldAojIENPTkZJR19SRUdV
TEFUT1JfU0xHNTEwMDAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfU1k4MTA2QSBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9TWTg4MjRYIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkVHVUxBVE9SX1NZODgyN04gaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBT
NTE2MzIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjIzNjAgaXMgbm90IHNl
dAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjI4NlggaXMgbm90IHNldAojIENPTkZJR19SRUdV
TEFUT1JfVFBTNjUwMjMgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUwN1gg
aXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1RQUzY1MTMyPW0KIyBDT05GSUdfUkVHVUxB
VE9SX1RQUzY1MjRYIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9VTklQSElFUj15CkNP
TkZJR19SRUdVTEFUT1JfVkNUUkw9bQojIENPTkZJR19SRUdVTEFUT1JfVkVYUFJFU1MgaXMg
bm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVlFNTUNfSVBRNDAxOSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9XTTg5OTQgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1Jf
UUNPTV9MQUJJQkIgaXMgbm90IHNldApDT05GSUdfUkNfQ09SRT1tCiMgQ09ORklHX0xJUkMg
aXMgbm90IHNldApDT05GSUdfUkNfTUFQPW0KQ09ORklHX1JDX0RFQ09ERVJTPXkKIyBDT05G
SUdfSVJfSU1PTl9ERUNPREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfSlZDX0RFQ09ERVIg
aXMgbm90IHNldAojIENPTkZJR19JUl9NQ0VfS0JEX0RFQ09ERVIgaXMgbm90IHNldAojIENP
TkZJR19JUl9ORUNfREVDT0RFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX1JDNV9ERUNPREVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfUkM2X0RFQ09ERVIgaXMgbm90IHNldAojIENPTkZJ
R19JUl9SQ01NX0RFQ09ERVIgaXMgbm90IHNldAojIENPTkZJR19JUl9TQU5ZT19ERUNPREVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfU0hBUlBfREVDT0RFUiBpcyBub3Qgc2V0CiMgQ09O
RklHX0lSX1NPTllfREVDT0RFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX1hNUF9ERUNPREVS
IGlzIG5vdCBzZXQKQ09ORklHX1JDX0RFVklDRVM9eQojIENPTkZJR19JUl9FTkUgaXMgbm90
IHNldAojIENPTkZJR19JUl9GSU5URUsgaXMgbm90IHNldAojIENPTkZJR19JUl9HUElPX0NJ
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX0hJWDVIRDIgaXMgbm90IHNldAojIENPTkZJR19J
Ul9JR09SUExVR1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX0lHVUFOQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lSX0lNT04gaXMgbm90IHNldAojIENPTkZJR19JUl9JTU9OX1JBVyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lSX0lURV9DSVIgaXMgbm90IHNldAojIENPTkZJR19JUl9NQ0VV
U0IgaXMgbm90IHNldApDT05GSUdfSVJfTUVTT049bQojIENPTkZJR19JUl9NRVNPTl9UWCBp
cyBub3Qgc2V0CiMgQ09ORklHX0lSX01USyBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX05VVk9U
T04gaXMgbm90IHNldAojIENPTkZJR19JUl9SRURSQVQzIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVJfU0VSSUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfU1RSRUFNWkFQIGlzIG5vdCBzZXQK
Q09ORklHX0lSX1NVTlhJPW0KIyBDT05GSUdfSVJfVE9ZIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVJfVFRVU0JJUiBpcyBub3Qgc2V0CiMgQ09ORklHX1JDX0FUSV9SRU1PVEUgaXMgbm90IHNl
dAojIENPTkZJR19SQ19MT09QQkFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1JDX1hCT1hfRFZE
IGlzIG5vdCBzZXQKQ09ORklHX0NFQ19DT1JFPW0KQ09ORklHX0NFQ19OT1RJRklFUj15Cgoj
CiMgQ0VDIHN1cHBvcnQKIwojIENPTkZJR19NRURJQV9DRUNfUkMgaXMgbm90IHNldAojIENP
TkZJR19NRURJQV9DRUNfU1VQUE9SVCBpcyBub3Qgc2V0CiMgZW5kIG9mIENFQyBzdXBwb3J0
CgpDT05GSUdfTUVESUFfU1VQUE9SVD1tCkNPTkZJR19NRURJQV9TVVBQT1JUX0ZJTFRFUj15
CkNPTkZJR19NRURJQV9TVUJEUlZfQVVUT1NFTEVDVD15CgojCiMgTWVkaWEgZGV2aWNlIHR5
cGVzCiMKQ09ORklHX01FRElBX0NBTUVSQV9TVVBQT1JUPXkKQ09ORklHX01FRElBX0FOQUxP
R19UVl9TVVBQT1JUPXkKQ09ORklHX01FRElBX0RJR0lUQUxfVFZfU1VQUE9SVD15CiMgQ09O
RklHX01FRElBX1JBRElPX1NVUFBPUlQgaXMgbm90IHNldApDT05GSUdfTUVESUFfU0RSX1NV
UFBPUlQ9eQpDT05GSUdfTUVESUFfUExBVEZPUk1fU1VQUE9SVD15CiMgQ09ORklHX01FRElB
X1RFU1RfU1VQUE9SVCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lZGlhIGRldmljZSB0eXBlcwoK
Q09ORklHX1ZJREVPX0RFVj1tCkNPTkZJR19NRURJQV9DT05UUk9MTEVSPXkKQ09ORklHX0RW
Ql9DT1JFPW0KCiMKIyBWaWRlbzRMaW51eCBvcHRpb25zCiMKQ09ORklHX1ZJREVPX1Y0TDJf
STJDPXkKQ09ORklHX1ZJREVPX1Y0TDJfU1VCREVWX0FQST15CiMgQ09ORklHX1ZJREVPX0FE
Vl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0ZJWEVEX01JTk9SX1JBTkdFUyBp
cyBub3Qgc2V0CkNPTkZJR19WNEwyX0gyNjQ9bQpDT05GSUdfVjRMMl9WUDk9bQpDT05GSUdf
VjRMMl9NRU0yTUVNX0RFVj1tCkNPTkZJR19WNEwyX0ZXTk9ERT1tCkNPTkZJR19WNEwyX0FT
WU5DPW0KIyBlbmQgb2YgVmlkZW80TGludXggb3B0aW9ucwoKIwojIE1lZGlhIGNvbnRyb2xs
ZXIgb3B0aW9ucwojCiMgQ09ORklHX01FRElBX0NPTlRST0xMRVJfRFZCIGlzIG5vdCBzZXQK
Q09ORklHX01FRElBX0NPTlRST0xMRVJfUkVRVUVTVF9BUEk9eQojIGVuZCBvZiBNZWRpYSBj
b250cm9sbGVyIG9wdGlvbnMKCiMKIyBEaWdpdGFsIFRWIG9wdGlvbnMKIwojIENPTkZJR19E
VkJfTU1BUCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9ORVQgaXMgbm90IHNldApDT05GSUdf
RFZCX01BWF9BREFQVEVSUz0xNgpDT05GSUdfRFZCX0RZTkFNSUNfTUlOT1JTPXkKIyBDT05G
SUdfRFZCX0RFTVVYX1NFQ1RJT05fTE9TU19MT0cgaXMgbm90IHNldAojIENPTkZJR19EVkJf
VUxFX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlnaXRhbCBUViBvcHRpb25zCgojCiMg
TWVkaWEgZHJpdmVycwojCgojCiMgRHJpdmVycyBmaWx0ZXJlZCBhcyBzZWxlY3RlZCBhdCAn
RmlsdGVyIG1lZGlhIGRyaXZlcnMnCiMKCiMKIyBNZWRpYSBkcml2ZXJzCiMKQ09ORklHX01F
RElBX1VTQl9TVVBQT1JUPXkKCiMKIyBXZWJjYW0gZGV2aWNlcwojCiMgQ09ORklHX1VTQl9H
U1BDQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9QV0MgaXMgbm90IHNldAojIENPTkZJR19V
U0JfUzIyNTUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19VU0JUViBpcyBub3Qgc2V0CkNP
TkZJR19VU0JfVklERU9fQ0xBU1M9bQpDT05GSUdfVVNCX1ZJREVPX0NMQVNTX0lOUFVUX0VW
REVWPXkKCiMKIyBBbmFsb2cgVFYgVVNCIGRldmljZXMKIwojIENPTkZJR19WSURFT19HTzcw
MDcgaXMgbm90IHNldAojIENPTkZJR19WSURFT19IRFBWUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX1BWUlVTQjIgaXMgbm90IHNldAojIENPTkZJR19WSURFT19TVEsxMTYwX0NPTU1P
TiBpcyBub3Qgc2V0CgojCiMgQW5hbG9nL2RpZ2l0YWwgVFYgVVNCIGRldmljZXMKIwojIENP
TkZJR19WSURFT19BVTA4MjggaXMgbm90IHNldAojIENPTkZJR19WSURFT19DWDIzMVhYIGlz
IG5vdCBzZXQKCiMKIyBEaWdpdGFsIFRWIFVTQiBkZXZpY2VzCiMKIyBDT05GSUdfRFZCX0FT
MTAyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0IyQzJfRkxFWENPUF9VU0IgaXMgbm90IHNl
dAojIENPTkZJR19EVkJfVVNCX1YyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1VTQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NNU19VU0JfRFJWIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1RU
VVNCX0JVREdFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9UVFVTQl9ERUMgaXMgbm90IHNl
dAoKIwojIFdlYmNhbSwgVFYgKGFuYWxvZy9kaWdpdGFsKSBVU0IgZGV2aWNlcwojCiMgQ09O
RklHX1ZJREVPX0VNMjhYWCBpcyBub3Qgc2V0CgojCiMgU29mdHdhcmUgZGVmaW5lZCByYWRp
byBVU0IgZGV2aWNlcwojCiMgQ09ORklHX1VTQl9BSVJTUFkgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfSEFDS1JGIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01TSTI1MDAgaXMgbm90IHNl
dAojIENPTkZJR19NRURJQV9QQ0lfU1VQUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9Q
TEFURk9STV9EUklWRVJTPXkKQ09ORklHX1Y0TF9QTEFURk9STV9EUklWRVJTPXkKQ09ORklH
X1NEUl9QTEFURk9STV9EUklWRVJTPXkKIyBDT05GSUdfRFZCX1BMQVRGT1JNX0RSSVZFUlMg
aXMgbm90IHNldApDT05GSUdfVjRMX01FTTJNRU1fRFJJVkVSUz15CiMgQ09ORklHX1ZJREVP
X01FTTJNRU1fREVJTlRFUkxBQ0UgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVVggaXMg
bm90IHNldAoKIwojIEFsbGVncm8gRFZUIG1lZGlhIHBsYXRmb3JtIGRyaXZlcnMKIwojIENP
TkZJR19WSURFT19BTExFR1JPX0RWVCBpcyBub3Qgc2V0CgojCiMgQW1sb2dpYyBtZWRpYSBw
bGF0Zm9ybSBkcml2ZXJzCiMKIyBDT05GSUdfVklERU9fTUVTT05fR0UyRCBpcyBub3Qgc2V0
CgojCiMgQW1waGlvbiBkcml2ZXJzCiMKIyBDT05GSUdfVklERU9fQU1QSElPTl9WUFUgaXMg
bm90IHNldAoKIwojIEFzcGVlZCBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKIyBDT05GSUdf
VklERU9fQVNQRUVEIGlzIG5vdCBzZXQKCiMKIyBBdG1lbCBtZWRpYSBwbGF0Zm9ybSBkcml2
ZXJzCiMKCiMKIyBDYWRlbmNlIG1lZGlhIHBsYXRmb3JtIGRyaXZlcnMKIwojIENPTkZJR19W
SURFT19DQURFTkNFX0NTSTJSWCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0NBREVOQ0Vf
Q1NJMlRYIGlzIG5vdCBzZXQKCiMKIyBDaGlwcyZNZWRpYSBtZWRpYSBwbGF0Zm9ybSBkcml2
ZXJzCiMKIyBDT05GSUdfVklERU9fQ09EQSBpcyBub3Qgc2V0CgojCiMgSW50ZWwgbWVkaWEg
cGxhdGZvcm0gZHJpdmVycwojCgojCiMgTWFydmVsbCBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJz
CiMKIyBDT05GSUdfVklERU9fQ0FGRV9DQ0lDIGlzIG5vdCBzZXQKCiMKIyBNZWRpYXRlayBt
ZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKIyBDT05GSUdfVklERU9fTUVESUFURUtfSlBFRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01FRElBVEVLX01EUCBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX01FRElBVEVLX1ZQVSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01FRElB
VEVLX01EUDMgaXMgbm90IHNldAoKIwojIE5WaWRpYSBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJz
CiMKIyBDT05GSUdfVklERU9fVEVHUkFfVkRFIGlzIG5vdCBzZXQKCiMKIyBOWFAgbWVkaWEg
cGxhdGZvcm0gZHJpdmVycwojCiMgQ09ORklHX1ZJREVPX0lNWF9NSVBJX0NTSVMgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19JTVhfUFhQIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
RFcxMDAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19JTVg4X0pQRUcgaXMgbm90IHNldAoK
IwojIFF1YWxjb21tIG1lZGlhIHBsYXRmb3JtIGRyaXZlcnMKIwpDT05GSUdfVklERU9fUUNP
TV9DQU1TUz1tCkNPTkZJR19WSURFT19RQ09NX1ZFTlVTPW0KCiMKIyBSZW5lc2FzIG1lZGlh
IHBsYXRmb3JtIGRyaXZlcnMKIwpDT05GSUdfVklERU9fUkNBUl9JU1A9bQpDT05GSUdfVklE
RU9fUkNBUl9DU0kyPW0KQ09ORklHX1ZJREVPX1JDQVJfVklOPW0KQ09ORklHX1ZJREVPX1JF
TkVTQVNfRkNQPW0KQ09ORklHX1ZJREVPX1JFTkVTQVNfRkRQMT1tCiMgQ09ORklHX1ZJREVP
X1JFTkVTQVNfSlBVIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1JFTkVTQVNfVlNQMT1tCkNP
TkZJR19WSURFT19SQ0FSX0RSSUY9bQoKIwojIFJvY2tjaGlwIG1lZGlhIHBsYXRmb3JtIGRy
aXZlcnMKIwojIENPTkZJR19WSURFT19ST0NLQ0hJUF9SR0EgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19ST0NLQ0hJUF9JU1AxIGlzIG5vdCBzZXQKCiMKIyBTYW1zdW5nIG1lZGlhIHBs
YXRmb3JtIGRyaXZlcnMKIwpDT05GSUdfVklERU9fU0FNU1VOR19FWFlOT1NfR1NDPW0KIyBD
T05GSUdfVklERU9fU0FNU1VOR19FWFlOT1M0X0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fU0FNU1VOR19TNVBfRzJEIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1NBTVNVTkdfUzVQ
X0pQRUc9bQpDT05GSUdfVklERU9fU0FNU1VOR19TNVBfTUZDPW0KCiMKIyBTVE1pY3JvZWxl
Y3Ryb25pY3MgbWVkaWEgcGxhdGZvcm0gZHJpdmVycwojCgojCiMgU3VueGkgbWVkaWEgcGxh
dGZvcm0gZHJpdmVycwojCiMgQ09ORklHX1ZJREVPX1NVTjRJX0NTSSBpcyBub3Qgc2V0CkNP
TkZJR19WSURFT19TVU42SV9DU0k9bQojIENPTkZJR19WSURFT19TVU42SV9NSVBJX0NTSTIg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19TVU44SV9BODNUX01JUElfQ1NJMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX1NVTjhJX0RFSU5URVJMQUNFIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fU1VOOElfUk9UQVRFIGlzIG5vdCBzZXQKCiMKIyBUZXhhcyBJbnN0cnVtZW50
cyBkcml2ZXJzCiMKIyBDT05GSUdfVklERU9fVElfQ0FMIGlzIG5vdCBzZXQKCiMKIyBWZXJp
c2lsaWNvbiBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKQ09ORklHX1ZJREVPX0hBTlRSTz1t
CkNPTkZJR19WSURFT19IQU5UUk9fSU1YOE09eQpDT05GSUdfVklERU9fSEFOVFJPX1JPQ0tD
SElQPXkKQ09ORklHX1ZJREVPX0hBTlRST19TVU5YST15CgojCiMgVklBIG1lZGlhIHBsYXRm
b3JtIGRyaXZlcnMKIwoKIwojIFhpbGlueCBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKIyBD
T05GSUdfVklERU9fWElMSU5YIGlzIG5vdCBzZXQKCiMKIyBNTUMvU0RJTyBEVkIgYWRhcHRl
cnMKIwojIENPTkZJR19TTVNfU0RJT19EUlYgaXMgbm90IHNldApDT05GSUdfVklERU9CVUYy
X0NPUkU9bQpDT05GSUdfVklERU9CVUYyX1Y0TDI9bQpDT05GSUdfVklERU9CVUYyX01FTU9Q
Uz1tCkNPTkZJR19WSURFT0JVRjJfRE1BX0NPTlRJRz1tCkNPTkZJR19WSURFT0JVRjJfVk1B
TExPQz1tCkNPTkZJR19WSURFT0JVRjJfRE1BX1NHPW0KIyBlbmQgb2YgTWVkaWEgZHJpdmVy
cwoKQ09ORklHX01FRElBX0hJREVfQU5DSUxMQVJZX1NVQkRSVj15CgojCiMgTWVkaWEgYW5j
aWxsYXJ5IGRyaXZlcnMKIwpDT05GSUdfTUVESUFfQVRUQUNIPXkKCiMKIyBJUiBJMkMgZHJp
dmVyIGF1dG8tc2VsZWN0ZWQgYnkgJ0F1dG9zZWxlY3QgYW5jaWxsYXJ5IGRyaXZlcnMnCiMK
Q09ORklHX1ZJREVPX0lSX0kyQz1tCgojCiMgQ2FtZXJhIHNlbnNvciBkZXZpY2VzCiMKIyBD
T05GSUdfVklERU9fQVIwNTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSEk1NTYgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19ISTg0NiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X0hJODQ3IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjA4IGlzIG5vdCBzZXQKIyBD
T05GSUdfVklERU9fSU1YMjE0IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX0lNWDIxOT1tCiMg
Q09ORklHX1ZJREVPX0lNWDI1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDI3NCBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDI5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX0lNWDMxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDMzNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX0lNWDMzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDM1
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDQxMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX01UOU0wMDEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlNMDMyIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fTVQ5TTExMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X01UOVAwMzEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlUMDAxIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fTVQ5VDExMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01UOVYw
MTEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlWMDMyIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fTVQ5VjExMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX05PT04wMTBQQzMw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT0cwMUExQiBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX09WMDJBMTAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjA4RDEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fT1YxMzg1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X09WMTNCMTAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI2NDAgaXMgbm90IHNldAoj
IENPTkZJR19WSURFT19PVjI2NTkgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI2ODAg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI2ODUgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19PVjI3NDAgaXMgbm90IHNldApDT05GSUdfVklERU9fT1Y1NjQwPW0KQ09ORklHX1ZJ
REVPX09WNTY0NT1tCiMgQ09ORklHX1ZJREVPX09WNTY0NyBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX09WNTY0OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNTY3MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX09WNTY3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09W
NTY5MyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNTY5NSBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX09WNjY1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNzI1MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNzY0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X09WNzY3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNzcyWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX09WNzc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WODg1NiBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WODg2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX09WOTI4MiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WOTY0MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX09WOTY1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WOTcz
NCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1JEQUNNMjAgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19SREFDTTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUko1NE4xIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fUzVDNzNNMyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X1M1SzRFQ0dYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUzVLNUJBRiBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX1M1SzZBMyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1M1SzZB
QSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1NSMDMwUEMzMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX1ZTNjYyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0NDUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX0VUOEVLOCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX001
TU9MUyBpcyBub3Qgc2V0CiMgZW5kIG9mIENhbWVyYSBzZW5zb3IgZGV2aWNlcwoKIwojIExl
bnMgZHJpdmVycwojCiMgQ09ORklHX1ZJREVPX0FENTgyMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX0FLNzM3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0RXOTcxNCBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX0RXOTc2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0RX
OTgwN19WQ00gaXMgbm90IHNldAojIGVuZCBvZiBMZW5zIGRyaXZlcnMKCiMKIyBGbGFzaCBk
ZXZpY2VzCiMKIyBDT05GSUdfVklERU9fQURQMTY1MyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX0xNMzU2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0xNMzY0NiBpcyBub3Qgc2V0
CiMgZW5kIG9mIEZsYXNoIGRldmljZXMKCiMKIyBhdWRpbywgdmlkZW8gYW5kIHJhZGlvIEky
QyBkcml2ZXJzIGF1dG8tc2VsZWN0ZWQgYnkgJ0F1dG9zZWxlY3QgYW5jaWxsYXJ5IGRyaXZl
cnMnCiMKCiMKIyBWaWRlbyBhbmQgYXVkaW8gZGVjb2RlcnMKIwoKIwojIFNQSSBJMkMgZHJp
dmVycyBhdXRvLXNlbGVjdGVkIGJ5ICdBdXRvc2VsZWN0IGFuY2lsbGFyeSBkcml2ZXJzJwoj
CgojCiMgTWVkaWEgU1BJIEFkYXB0ZXJzCiMKIyBDT05GSUdfQ1hEMjg4MF9TUElfRFJWIGlz
IG5vdCBzZXQKIyBDT05GSUdfVklERU9fR1MxNjYyIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVk
aWEgU1BJIEFkYXB0ZXJzCgpDT05GSUdfTUVESUFfVFVORVI9bQoKIwojIFR1bmVyIGRyaXZl
cnMgYXV0by1zZWxlY3RlZCBieSAnQXV0b3NlbGVjdCBhbmNpbGxhcnkgZHJpdmVycycKIwpD
T05GSUdfTUVESUFfVFVORVJfTUM0NFM4MDM9bQpDT05GSUdfTUVESUFfVFVORVJfTVQyMFhY
PW0KQ09ORklHX01FRElBX1RVTkVSX1NJTVBMRT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREEx
ODI3MT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREE4MjdYPW0KQ09ORklHX01FRElBX1RVTkVS
X1REQTgyOTA9bQpDT05GSUdfTUVESUFfVFVORVJfVERBOTg4Nz1tCkNPTkZJR19NRURJQV9U
VU5FUl9YQzIwMjg9bQpDT05GSUdfTUVESUFfVFVORVJfWEM0MDAwPW0KQ09ORklHX01FRElB
X1RVTkVSX1hDNTAwMD1tCgojCiMgRFZCIEZyb250ZW5kIGRyaXZlcnMgYXV0by1zZWxlY3Rl
ZCBieSAnQXV0b3NlbGVjdCBhbmNpbGxhcnkgZHJpdmVycycKIwoKIwojIE11bHRpc3RhbmRh
cmQgKHNhdGVsbGl0ZSkgZnJvbnRlbmRzCiMKCiMKIyBNdWx0aXN0YW5kYXJkIChjYWJsZSAr
IHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwoKIwojIERWQi1TIChzYXRlbGxpdGUpIGZyb250
ZW5kcwojCgojCiMgRFZCLVQgKHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwoKIwojIERWQi1D
IChjYWJsZSkgZnJvbnRlbmRzCiMKCiMKIyBBVFNDIChOb3J0aCBBbWVyaWNhbi9Lb3JlYW4g
VGVycmVzdHJpYWwvQ2FibGUgRFRWKSBmcm9udGVuZHMKIwoKIwojIElTREItVCAodGVycmVz
dHJpYWwpIGZyb250ZW5kcwojCgojCiMgSVNEQi1TIChzYXRlbGxpdGUpICYgSVNEQi1UICh0
ZXJyZXN0cmlhbCkgZnJvbnRlbmRzCiMKCiMKIyBEaWdpdGFsIHRlcnJlc3RyaWFsIG9ubHkg
dHVuZXJzL1BMTAojCgojCiMgU0VDIGNvbnRyb2wgZGV2aWNlcyBmb3IgRFZCLVMKIwoKIwoj
IENvbW1vbiBJbnRlcmZhY2UgKEVONTAyMjEpIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgZW5k
IG9mIE1lZGlhIGFuY2lsbGFyeSBkcml2ZXJzCgojCiMgR3JhcGhpY3Mgc3VwcG9ydAojCkNP
TkZJR19BUEVSVFVSRV9IRUxQRVJTPXkKQ09ORklHX1RFR1JBX0hPU1QxWF9DT05URVhUX0JV
Uz15CkNPTkZJR19URUdSQV9IT1NUMVg9bQpDT05GSUdfVEVHUkFfSE9TVDFYX0ZJUkVXQUxM
PXkKQ09ORklHX0RSTT1tCkNPTkZJR19EUk1fTUlQSV9EU0k9eQpDT05GSUdfRFJNX0tNU19I
RUxQRVI9bQpDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTj15CkNPTkZJR19EUk1fRkJERVZf
T1ZFUkFMTE9DPTEwMAojIENPTkZJR19EUk1fTE9BRF9FRElEX0ZJUk1XQVJFIGlzIG5vdCBz
ZXQKQ09ORklHX0RSTV9EUF9BVVhfQlVTPW0KQ09ORklHX0RSTV9ESVNQTEFZX0hFTFBFUj1t
CkNPTkZJR19EUk1fRElTUExBWV9EUF9IRUxQRVI9eQpDT05GSUdfRFJNX0RJU1BMQVlfSERD
UF9IRUxQRVI9eQpDT05GSUdfRFJNX0RJU1BMQVlfSERNSV9IRUxQRVI9eQojIENPTkZJR19E
Uk1fRFBfQVVYX0NIQVJERVYgaXMgbm90IHNldAojIENPTkZJR19EUk1fRFBfQ0VDIGlzIG5v
dCBzZXQKQ09ORklHX0RSTV9UVE09bQpDT05GSUdfRFJNX1ZSQU1fSEVMUEVSPW0KQ09ORklH
X0RSTV9UVE1fSEVMUEVSPW0KQ09ORklHX0RSTV9HRU1fRE1BX0hFTFBFUj1tCkNPTkZJR19E
Uk1fR0VNX1NITUVNX0hFTFBFUj1tCkNPTkZJR19EUk1fU0NIRUQ9bQoKIwojIEkyQyBlbmNv
ZGVyIG9yIGhlbHBlciBjaGlwcwojCkNPTkZJR19EUk1fSTJDX0NINzAwNj1tCkNPTkZJR19E
Uk1fSTJDX1NJTDE2ND1tCkNPTkZJR19EUk1fSTJDX05YUF9UREE5OThYPW0KIyBDT05GSUdf
RFJNX0kyQ19OWFBfVERBOTk1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBlbmNvZGVyIG9y
IGhlbHBlciBjaGlwcwoKIwojIEFSTSBkZXZpY2VzCiMKQ09ORklHX0RSTV9IRExDRD1tCiMg
Q09ORklHX0RSTV9IRExDRF9TSE9XX1VOREVSUlVOIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9N
QUxJX0RJU1BMQVk9bQpDT05GSUdfRFJNX0tPTUVEQT1tCiMgZW5kIG9mIEFSTSBkZXZpY2Vz
CgojIENPTkZJR19EUk1fUkFERU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0FNREdQVSBp
cyBub3Qgc2V0CkNPTkZJR19EUk1fTk9VVkVBVT1tCkNPTkZJR19OT1VWRUFVX0xFR0FDWV9D
VFhfU1VQUE9SVD15CkNPTkZJR19OT1VWRUFVX1BMQVRGT1JNX0RSSVZFUj15CkNPTkZJR19O
T1VWRUFVX0RFQlVHPTUKQ09ORklHX05PVVZFQVVfREVCVUdfREVGQVVMVD0zCiMgQ09ORklH
X05PVVZFQVVfREVCVUdfTU1VIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9VVkVBVV9ERUJVR19Q
VVNIIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9OT1VWRUFVX0JBQ0tMSUdIVD15CiMgQ09ORklH
X0RSTV9LTUJfRElTUExBWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WR0VNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1ZLTVMgaXMgbm90IHNldApDT05GSUdfRFJNX0VYWU5PUz1tCgoj
CiMgQ1JUQ3MKIwojIENPTkZJR19EUk1fRVhZTk9TX0ZJTUQgaXMgbm90IHNldApDT05GSUdf
RFJNX0VYWU5PUzU0MzNfREVDT049eQpDT05GSUdfRFJNX0VYWU5PUzdfREVDT049eQojIENP
TkZJR19EUk1fRVhZTk9TX01JWEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0VYWU5PU19W
SURJIGlzIG5vdCBzZXQKCiMKIyBFbmNvZGVycyBhbmQgQnJpZGdlcwojCkNPTkZJR19EUk1f
RVhZTk9TX0RTST15CiMgQ09ORklHX0RSTV9FWFlOT1NfRFAgaXMgbm90IHNldApDT05GSUdf
RFJNX0VYWU5PU19IRE1JPXkKQ09ORklHX0RSTV9FWFlOT1NfTUlDPXkKCiMKIyBTdWItZHJp
dmVycwojCiMgQ09ORklHX0RSTV9FWFlOT1NfRzJEIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
X0VYWU5PU19GSU1DIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0VYWU5PU19ST1RBVE9SIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX0VYWU5PU19TQ0FMRVIgaXMgbm90IHNldApDT05GSUdf
RFJNX1JPQ0tDSElQPW0KQ09ORklHX1JPQ0tDSElQX1ZPUD15CiMgQ09ORklHX1JPQ0tDSElQ
X1ZPUDIgaXMgbm90IHNldApDT05GSUdfUk9DS0NISVBfQU5BTE9HSVhfRFA9eQpDT05GSUdf
Uk9DS0NISVBfQ0ROX0RQPXkKQ09ORklHX1JPQ0tDSElQX0RXX0hETUk9eQpDT05GSUdfUk9D
S0NISVBfRFdfTUlQSV9EU0k9eQpDT05GSUdfUk9DS0NISVBfSU5OT19IRE1JPXkKQ09ORklH
X1JPQ0tDSElQX0xWRFM9eQojIENPTkZJR19ST0NLQ0hJUF9SR0IgaXMgbm90IHNldAojIENP
TkZJR19ST0NLQ0hJUF9SSzMwNjZfSERNSSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WTVdH
RlggaXMgbm90IHNldAojIENPTkZJR19EUk1fVURMIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
X0FTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9NR0FHMjAwIGlzIG5vdCBzZXQKQ09ORklH
X0RSTV9SQ0FSX0RVPW0KQ09ORklHX0RSTV9SQ0FSX1VTRV9DTU09eQpDT05GSUdfRFJNX1JD
QVJfQ01NPW0KQ09ORklHX0RSTV9SQ0FSX0RXX0hETUk9bQpDT05GSUdfRFJNX1JDQVJfVVNF
X0xWRFM9eQpDT05GSUdfRFJNX1JDQVJfTFZEUz1tCkNPTkZJR19EUk1fUkNBUl9NSVBJX0RT
ST1tCkNPTkZJR19EUk1fUkNBUl9WU1A9eQpDT05GSUdfRFJNX1JDQVJfV1JJVEVCQUNLPXkK
Q09ORklHX0RSTV9TVU40ST1tCkNPTkZJR19EUk1fU1VONklfRFNJPW0KQ09ORklHX0RSTV9T
VU44SV9EV19IRE1JPW0KQ09ORklHX0RSTV9TVU44SV9NSVhFUj1tCkNPTkZJR19EUk1fU1VO
OElfVENPTl9UT1A9bQojIENPTkZJR19EUk1fUVhMIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
X1ZJUlRJT19HUFUgaXMgbm90IHNldApDT05GSUdfRFJNX01TTT1tCkNPTkZJR19EUk1fTVNN
X0dQVV9TVEFURT15CkNPTkZJR19EUk1fTVNNX01EU1M9eQpDT05GSUdfRFJNX01TTV9NRFA0
PXkKQ09ORklHX0RSTV9NU01fTURQNT15CkNPTkZJR19EUk1fTVNNX0RQVT15CkNPTkZJR19E
Uk1fTVNNX0RQPXkKQ09ORklHX0RSTV9NU01fRFNJPXkKQ09ORklHX0RSTV9NU01fRFNJXzI4
Tk1fUEhZPXkKQ09ORklHX0RSTV9NU01fRFNJXzIwTk1fUEhZPXkKQ09ORklHX0RSTV9NU01f
RFNJXzI4Tk1fODk2MF9QSFk9eQpDT05GSUdfRFJNX01TTV9EU0lfMTROTV9QSFk9eQpDT05G
SUdfRFJNX01TTV9EU0lfMTBOTV9QSFk9eQpDT05GSUdfRFJNX01TTV9EU0lfN05NX1BIWT15
CkNPTkZJR19EUk1fTVNNX0hETUk9eQpDT05GSUdfRFJNX01TTV9IRE1JX0hEQ1A9eQpDT05G
SUdfRFJNX1RFR1JBPW0KIyBDT05GSUdfRFJNX1RFR1JBX0RFQlVHIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX1RFR1JBX1NUQUdJTkcgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMPXkK
CiMKIyBEaXNwbGF5IFBhbmVscwojCiMgQ09ORklHX0RSTV9QQU5FTF9BQlRfWTAzMFhYMDY3
QSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9BUk1fVkVSU0FUSUxFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1BBTkVMX0FTVVNfWjAwVF9UTTVQNV9OVDM1NTk2IGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1BBTkVMX0JPRV9CRjA2MFk4TV9BSjAgaXMgbm90IHNldAojIENP
TkZJR19EUk1fUEFORUxfQk9FX0hJTUFYODI3OUQgaXMgbm90IHNldApDT05GSUdfRFJNX1BB
TkVMX0JPRV9UVjEwMVdVTV9OTDY9bQojIENPTkZJR19EUk1fUEFORUxfRFNJX0NNIGlzIG5v
dCBzZXQKQ09ORklHX0RSTV9QQU5FTF9MVkRTPW0KQ09ORklHX0RSTV9QQU5FTF9TSU1QTEU9
bQpDT05GSUdfRFJNX1BBTkVMX0VEUD1tCiMgQ09ORklHX0RSTV9QQU5FTF9FQkJHX0ZUODcx
OSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9FTElEQV9LRDM1VDEzMyBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9QQU5FTF9GRUlYSU5fSzEwMV9JTTJCQTAyIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX1BBTkVMX0ZFSVlBTkdfRlkwNzAyNERJMjZBMzBEIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX1BBTkVMX0lMSVRFS19JTDkzMjIgaXMgbm90IHNldAojIENPTkZJR19E
Uk1fUEFORUxfSUxJVEVLX0lMSTkzNDEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxf
SUxJVEVLX0lMSTk4ODFDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0lOTk9MVVhf
RUowMzBOQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9JTk5PTFVYX1AwNzlaQ0Eg
aXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfSkRJX0xUMDcwTUUwNTAwMCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9QQU5FTF9KRElfUjYzNDUyIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1BBTkVMX0tIQURBU19UUzA1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9L
SU5HRElTUExBWV9LRDA5N0QwNCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9MRUFE
VEVLX0xUSzA1MEgzMTQ2VyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9MRUFEVEVL
X0xUSzUwMEhEMTgyOSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX0xE
OTA0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9MR19MQjAzNVEwMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9QQU5FTF9MR19MRzQ1NzMgaXMgbm90IHNldAojIENPTkZJR19E
Uk1fUEFORUxfTkVDX05MODA0OEhMMTEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxf
TkVXVklTSU9OX05WMzA1MkMgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfTk9WQVRF
S19OVDM1NTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX05PVkFURUtfTlQzNTU2
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9OT1ZBVEVLX05UMzU5NTAgaXMgbm90
IHNldAojIENPTkZJR19EUk1fUEFORUxfTk9WQVRFS19OVDM2NjcyQSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9QQU5FTF9OT1ZBVEVLX05UMzkwMTYgaXMgbm90IHNldApDT05GSUdfRFJN
X1BBTkVMX01BTlRJWF9NTEFGMDU3V0U1MT1tCiMgQ09ORklHX0RSTV9QQU5FTF9PTElNRVhf
TENEX09MSU5VWElOTyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9PUklTRVRFQ0hf
T1RNODAwOUEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfT1NEX09TRDEwMVQyNTg3
XzUzVFMgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfUEFOQVNPTklDX1ZWWDEwRjAz
NE4wMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9SQVNQQkVSUllQSV9UT1VDSFND
UkVFTiBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfUkFZRElVTV9STTY3MTkxPW0KIyBD
T05GSUdfRFJNX1BBTkVMX1JBWURJVU1fUk02ODIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9QQU5FTF9ST05CT19SQjA3MEQzMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9T
QU1TVU5HX0FUTkEzM1hDMjAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VO
R19EQjc0MzAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkQxNkQw
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfUzZEMjdBMSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RTNIQTIgaXMgbm90IHNldAojIENP
TkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkU2M0owWDAzIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1BBTkVMX1NBTVNVTkdfUzZFNjNNMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5F
TF9TQU1TVU5HX1M2RTg4QTBfQU1TNDUyRUYwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9Q
QU5FTF9TQU1TVU5HX1M2RThBQTAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0FN
U1VOR19TT0ZFRjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NFSUtPXzQzV1ZG
MUcgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0hBUlBfTFExMDFSMVNYMDEgaXMg
bm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0hBUlBfTFMwMzdWN0RXMDEgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fUEFORUxfU0hBUlBfTFMwNDNUMUxFMDEgaXMgbm90IHNldAojIENP
TkZJR19EUk1fUEFORUxfU0hBUlBfTFMwNjBUMVNYMDEgaXMgbm90IHNldAojIENPTkZJR19E
Uk1fUEFORUxfU0lUUk9OSVhfU1Q3NzAxIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9T
SVRST05JWF9TVDc3MDM9bQojIENPTkZJR19EUk1fUEFORUxfU0lUUk9OSVhfU1Q3Nzg5ViBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TT05ZX0FDWDU2NUFLTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9QQU5FTF9TT05ZX1RVTElQX1RSVUxZX05UMzU1MjEgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fUEFORUxfVERPX1RMMDcwV1NIMzAgaXMgbm90IHNldAojIENPTkZJ
R19EUk1fUEFORUxfVFBPX1REMDI4VFRFQzEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFO
RUxfVFBPX1REMDQzTVRFQTEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfVFBPX1RQ
RzExMCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfVFJVTFlfTlQzNTU5N19XUVhHQT1t
CiMgQ09ORklHX0RSTV9QQU5FTF9WSVNJT05PWF9STTY5Mjk5IGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX1BBTkVMX1dJREVDSElQU19XUzI0MDEgaXMgbm90IHNldAojIENPTkZJR19EUk1f
UEFORUxfWElOUEVOR19YUFAwNTVDMjcyIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlzcGxheSBQ
YW5lbHMKCkNPTkZJR19EUk1fQlJJREdFPXkKQ09ORklHX0RSTV9QQU5FTF9CUklER0U9eQoK
IwojIERpc3BsYXkgSW50ZXJmYWNlIEJyaWRnZXMKIwojIENPTkZJR19EUk1fQ0ROU19EU0kg
aXMgbm90IHNldAojIENPTkZJR19EUk1fQ0hJUE9ORV9JQ042MjExIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX0NIUk9OVEVMX0NINzAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9DUk9T
X0VDX0FOWDc2ODggaXMgbm90IHNldApDT05GSUdfRFJNX0RJU1BMQVlfQ09OTkVDVE9SPW0K
IyBDT05GSUdfRFJNX0ZTTF9MREIgaXMgbm90IHNldAojIENPTkZJR19EUk1fSVRFX0lUNjUw
NSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fTE9OVElVTV9MVDg5MTJCPW0KIyBDT05GSUdfRFJN
X0xPTlRJVU1fTFQ5MjExIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9MT05USVVNX0xUOTYxMT1t
CkNPTkZJR19EUk1fTE9OVElVTV9MVDk2MTFVWEM9bQojIENPTkZJR19EUk1fSVRFX0lUNjYx
MjEgaXMgbm90IHNldAojIENPTkZJR19EUk1fTFZEU19DT0RFQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9NRUdBQ0hJUFNfU1REUFhYWFhfR0VfQjg1MFYzX0ZXIGlzIG5vdCBzZXQKQ09O
RklHX0RSTV9OV0xfTUlQSV9EU0k9bQojIENPTkZJR19EUk1fTlhQX1BUTjM0NjAgaXMgbm90
IHNldAojIENPTkZJR19EUk1fUEFSQURFX1BTODYyMiBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
UEFSQURFX1BTODY0MD1tCiMgQ09ORklHX0RSTV9TSUxfU0lJODYyMCBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fU0lJOTAyWD1tCiMgQ09ORklHX0RSTV9TSUk5MjM0IGlzIG5vdCBzZXQKQ09O
RklHX0RSTV9TSU1QTEVfQlJJREdFPW0KQ09ORklHX0RSTV9USElORV9USEM2M0xWRDEwMjQ9
bQojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9UT1NISUJBX1RDMzU4NzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RPU0hJQkFfVEMz
NTg3NjcgaXMgbm90IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2OCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9UT1NISUJBX1RDMzU4Nzc1IGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1RJX0RMUEMzNDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJX1RGUDQxMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RSTV9USV9TTjY1RFNJODMgaXMgbm90IHNldApDT05GSUdfRFJN
X1RJX1NONjVEU0k4Nj1tCiMgQ09ORklHX0RSTV9USV9UUEQxMlMwMTUgaXMgbm90IHNldAoj
IENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNjM0NSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9B
TkFMT0dJWF9BTlg3OFhYIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9BTkFMT0dJWF9EUD1tCiMg
Q09ORklHX0RSTV9BTkFMT0dJWF9BTlg3NjI1IGlzIG5vdCBzZXQKQ09ORklHX0RSTV9JMkNf
QURWNzUxMT1tCkNPTkZJR19EUk1fSTJDX0FEVjc1MTFfQVVESU89eQpDT05GSUdfRFJNX0ky
Q19BRFY3NTExX0NFQz15CkNPTkZJR19EUk1fQ0ROU19NSERQODU0Nj1tCkNPTkZJR19EUk1f
Q0ROU19NSERQODU0Nl9KNzIxRT15CiMgQ09ORklHX0RSTV9JTVg4UU1fTERCIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX0lNWDhRWFBfTERCIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0lN
WDhRWFBfUElYRUxfQ09NQklORVIgaXMgbm90IHNldAojIENPTkZJR19EUk1fSU1YOFFYUF9Q
SVhFTF9MSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0lNWDhRWFBfUElYRUxfTElOS19U
T19EUEkgaXMgbm90IHNldApDT05GSUdfRFJNX0RXX0hETUk9bQpDT05GSUdfRFJNX0RXX0hE
TUlfQUhCX0FVRElPPW0KQ09ORklHX0RSTV9EV19IRE1JX0kyU19BVURJTz1tCiMgQ09ORklH
X0RSTV9EV19IRE1JX0dQX0FVRElPIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9EV19IRE1JX0NF
Qz1tCkNPTkZJR19EUk1fRFdfTUlQSV9EU0k9bQojIGVuZCBvZiBEaXNwbGF5IEludGVyZmFj
ZSBCcmlkZ2VzCgpDT05GSUdfRFJNX0lNWF9EQ1NTPW0KQ09ORklHX0RSTV9WM0Q9bQpDT05G
SUdfRFJNX1ZDND1tCiMgQ09ORklHX0RSTV9WQzRfSERNSV9DRUMgaXMgbm90IHNldApDT05G
SUdfRFJNX0VUTkFWSVY9bQpDT05GSUdfRFJNX0VUTkFWSVZfVEhFUk1BTD15CkNPTkZJR19E
Uk1fSElTSV9ISUJNQz1tCkNPTkZJR19EUk1fSElTSV9LSVJJTj1tCiMgQ09ORklHX0RSTV9M
T0dJQ1ZDIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9NRURJQVRFSz1tCiMgQ09ORklHX0RSTV9N
RURJQVRFS19EUCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fTUVESUFURUtfSERNST1tCkNPTkZJ
R19EUk1fTVhTPXkKQ09ORklHX0RSTV9NWFNGQj1tCiMgQ09ORklHX0RSTV9JTVhfTENESUYg
aXMgbm90IHNldApDT05GSUdfRFJNX01FU09OPW0KQ09ORklHX0RSTV9NRVNPTl9EV19IRE1J
PW0KIyBDT05GSUdfRFJNX0FSQ1BHVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9CT0NIUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9DSVJSVVNfUUVNVSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9HTTEyVTMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9NSVBJX0RCSSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TSU1QTEVEUk0gaXMgbm90IHNldAojIENPTkZJR19U
SU5ZRFJNX0hYODM1N0QgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTkxNjMgaXMg
bm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTkyMjUgaXMgbm90IHNldAojIENPTkZJR19U
SU5ZRFJNX0lMSTkzNDEgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTk0ODYgaXMg
bm90IHNldAojIENPTkZJR19USU5ZRFJNX01JMDI4M1FUIGlzIG5vdCBzZXQKIyBDT05GSUdf
VElOWURSTV9SRVBBUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfVElOWURSTV9TVDc1ODYgaXMg
bm90IHNldAojIENPTkZJR19USU5ZRFJNX1NUNzczNVIgaXMgbm90IHNldApDT05GSUdfRFJN
X1BMMTExPW0KIyBDT05GSUdfRFJNX1hFTl9GUk9OVEVORCBpcyBub3Qgc2V0CkNPTkZJR19E
Uk1fTElNQT1tCkNPTkZJR19EUk1fUEFORlJPU1Q9bQpDT05GSUdfRFJNX1RJRFNTPW0KIyBD
T05GSUdfRFJNX0dVRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TU0QxMzBYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1NQUkQgaXMgbm90IHNldApDT05GSUdfRFJNX0xFR0FDWT15CiMg
Q09ORklHX0RSTV9UREZYIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1IxMjggaXMgbm90IHNl
dAojIENPTkZJR19EUk1fTUdBIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1ZJQSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9TQVZBR0UgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX09S
SUVOVEFUSU9OX1FVSVJLUz15CkNPTkZJR19EUk1fTk9NT0RFU0VUPXkKCiMKIyBGcmFtZSBi
dWZmZXIgRGV2aWNlcwojCkNPTkZJR19GQl9DTURMSU5FPXkKQ09ORklHX0ZCX05PVElGWT15
CkNPTkZJR19GQj15CiMgQ09ORklHX0ZJUk1XQVJFX0VESUQgaXMgbm90IHNldApDT05GSUdf
RkJfQ0ZCX0ZJTExSRUNUPXkKQ09ORklHX0ZCX0NGQl9DT1BZQVJFQT15CkNPTkZJR19GQl9D
RkJfSU1BR0VCTElUPXkKQ09ORklHX0ZCX1NZU19GSUxMUkVDVD15CkNPTkZJR19GQl9TWVNf
Q09QWUFSRUE9eQpDT05GSUdfRkJfU1lTX0lNQUdFQkxJVD15CiMgQ09ORklHX0ZCX0ZPUkVJ
R05fRU5ESUFOIGlzIG5vdCBzZXQKQ09ORklHX0ZCX1NZU19GT1BTPXkKQ09ORklHX0ZCX0RF
RkVSUkVEX0lPPXkKQ09ORklHX0ZCX01PREVfSEVMUEVSUz15CiMgQ09ORklHX0ZCX1RJTEVC
TElUVElORyBpcyBub3Qgc2V0CgojCiMgRnJhbWUgYnVmZmVyIGhhcmR3YXJlIGRyaXZlcnMK
IwojIENPTkZJR19GQl9DSVJSVVMgaXMgbm90IHNldAojIENPTkZJR19GQl9QTTIgaXMgbm90
IHNldAojIENPTkZJR19GQl9BUk1DTENEIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSU1YIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfQ1lCRVIyMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
QVNJTElBTlQgaXMgbm90IHNldAojIENPTkZJR19GQl9JTVNUVCBpcyBub3Qgc2V0CkNPTkZJ
R19GQl9FRkk9eQojIENPTkZJR19GQl9PUEVOQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19G
Ql9TMUQxM1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX05WSURJQSBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX1JJVkEgaXMgbm90IHNldAojIENPTkZJR19GQl9JNzQwIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkJfTUFUUk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUkFERU9OIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfQVRZMTI4IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVRZIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfUzMgaXMgbm90IHNldAojIENPTkZJR19GQl9TQVZBR0Ug
aXMgbm90IHNldAojIENPTkZJR19GQl9TSVMgaXMgbm90IHNldAojIENPTkZJR19GQl9ORU9N
QUdJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0tZUk8gaXMgbm90IHNldAojIENPTkZJR19G
Ql8zREZYIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVk9PRE9PMSBpcyBub3Qgc2V0CiMgQ09O
RklHX0ZCX1ZUODYyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RSSURFTlQgaXMgbm90IHNl
dAojIENPTkZJR19GQl9BUksgaXMgbm90IHNldAojIENPTkZJR19GQl9QTTMgaXMgbm90IHNl
dAojIENPTkZJR19GQl9DQVJNSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU0hfTU9CSUxF
X0xDREMgaXMgbm90IHNldAojIENPTkZJR19GQl9TTVNDVUZYIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfVURMIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSUJNX0dYVDQ1MDAgaXMgbm90IHNl
dAojIENPTkZJR19GQl9YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19GQl9WSVJUVUFMIGlz
IG5vdCBzZXQKQ09ORklHX1hFTl9GQkRFVl9GUk9OVEVORD15CiMgQ09ORklHX0ZCX01FVFJP
Tk9NRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX01CODYyWFggaXMgbm90IHNldApDT05GSUdf
RkJfTVgzPXkKIyBDT05GSUdfRkJfU0lNUExFIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU1NE
MTMwNyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNNzEyIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
RnJhbWUgYnVmZmVyIERldmljZXMKCiMKIyBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBv
cnQKIwojIENPTkZJR19MQ0RfQ0xBU1NfREVWSUNFIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tM
SUdIVF9DTEFTU19ERVZJQ0U9eQojIENPTkZJR19CQUNLTElHSFRfS1REMjUzIGlzIG5vdCBz
ZXQKQ09ORklHX0JBQ0tMSUdIVF9QV009bQojIENPTkZJR19CQUNLTElHSFRfUUNPTV9XTEVE
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0FEUDg4NjAgaXMgbm90IHNldAojIENP
TkZJR19CQUNLTElHSFRfQURQODg3MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9M
TTM2MzBBIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xNMzYzOSBpcyBub3Qgc2V0
CkNPTkZJR19CQUNLTElHSFRfTFA4NTVYPW0KIyBDT05GSUdfQkFDS0xJR0hUX0dQSU8gaXMg
bm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTFY1MjA3TFAgaXMgbm90IHNldAojIENPTkZJ
R19CQUNLTElHSFRfQkQ2MTA3IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0FSQ1hD
Tk4gaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTEVEIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0CgpDT05GSUdfVklERU9NT0RFX0hF
TFBFUlM9eQpDT05GSUdfSERNST15CgojCiMgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBzdXBw
b3J0CiMKQ09ORklHX0RVTU1ZX0NPTlNPTEU9eQpDT05GSUdfRFVNTVlfQ09OU09MRV9DT0xV
TU5TPTgwCkNPTkZJR19EVU1NWV9DT05TT0xFX1JPV1M9MjUKQ09ORklHX0ZSQU1FQlVGRkVS
X0NPTlNPTEU9eQojIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0xFR0FDWV9BQ0NFTEVS
QVRJT04gaXMgbm90IHNldApDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9ERVRFQ1RfUFJJ
TUFSWT15CiMgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVfUk9UQVRJT04gaXMgbm90IHNl
dAojIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0RFRkVSUkVEX1RBS0VPVkVSIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBzdXBwb3J0CgpDT05GSUdf
TE9HTz15CiMgQ09ORklHX0xPR09fTElOVVhfTU9OTyBpcyBub3Qgc2V0CiMgQ09ORklHX0xP
R09fTElOVVhfVkdBMTYgaXMgbm90IHNldApDT05GSUdfTE9HT19MSU5VWF9DTFVUMjI0PXkK
IyBlbmQgb2YgR3JhcGhpY3Mgc3VwcG9ydAoKQ09ORklHX1NPVU5EPXkKQ09ORklHX1NORD15
CkNPTkZJR19TTkRfVElNRVI9eQpDT05GSUdfU05EX1BDTT15CkNPTkZJR19TTkRfUENNX0VM
RD15CkNPTkZJR19TTkRfUENNX0lFQzk1OD15CkNPTkZJR19TTkRfRE1BRU5HSU5FX1BDTT15
CkNPTkZJR19TTkRfQ09NUFJFU1NfT0ZGTE9BRD15CkNPTkZJR19TTkRfSkFDSz15CkNPTkZJ
R19TTkRfSkFDS19JTlBVVF9ERVY9eQojIENPTkZJR19TTkRfT1NTRU1VTCBpcyBub3Qgc2V0
CkNPTkZJR19TTkRfUENNX1RJTUVSPXkKIyBDT05GSUdfU05EX0hSVElNRVIgaXMgbm90IHNl
dApDT05GSUdfU05EX0RZTkFNSUNfTUlOT1JTPXkKQ09ORklHX1NORF9NQVhfQ0FSRFM9MzIK
Q09ORklHX1NORF9TVVBQT1JUX09MRF9BUEk9eQpDT05GSUdfU05EX1BST0NfRlM9eQpDT05G
SUdfU05EX1ZFUkJPU0VfUFJPQ0ZTPXkKIyBDT05GSUdfU05EX1ZFUkJPU0VfUFJJTlRLIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9DVExfRkFTVF9MT09LVVA9eQojIENPTkZJR19TTkRfREVC
VUcgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1RMX0lOUFVUX1ZBTElEQVRJT04gaXMgbm90
IHNldApDT05GSUdfU05EX1ZNQVNURVI9eQojIENPTkZJR19TTkRfU0VRVUVOQ0VSIGlzIG5v
dCBzZXQKQ09ORklHX1NORF9EUklWRVJTPXkKIyBDT05GSUdfU05EX0RVTU1ZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0FMT09QIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01UUEFWIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NFUklBTF9VMTY1NTAgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU0VSSUFMX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19TTkRfTVBVNDAxIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9QQ0k9eQojIENPTkZJR19TTkRfQUQxODg5IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0FMUzMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BTEk1NDUx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FUSUlYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9BVElJWFBfTU9ERU0gaXMgbm90IHNldAojIENPTkZJR19TTkRfQVU4ODEwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0FVODgyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVTg4MzAg
aXMgbm90IHNldAojIENPTkZJR19TTkRfQVcyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0Fa
VDMzMjggaXMgbm90IHNldAojIENPTkZJR19TTkRfQlQ4N1ggaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQ0EwMTA2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NNSVBDSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9PWFlHRU4gaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1M0MjgxIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0NTNDZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9D
VFhGSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9EQVJMQTIwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0dJTkEyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9MQVlMQTIwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0RBUkxBMjQgaXMgbm90IHNldAojIENPTkZJR19TTkRfR0lOQTI0
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xBWUxBMjQgaXMgbm90IHNldAojIENPTkZJR19T
TkRfTU9OQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NSUEgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfRUNITzNHIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHTyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9JTkRJR09JTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09E
SiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09JT1ggaXMgbm90IHNldAojIENPTkZJ
R19TTkRfSU5ESUdPREpYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VNVTEwSzEgaXMgbm90
IHNldAojIENPTkZJR19TTkRfRU1VMTBLMVggaXMgbm90IHNldAojIENPTkZJR19TTkRfRU5T
MTM3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FTlMxMzcxIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0VTMTkzOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FUzE5NjggaXMgbm90IHNl
dAojIENPTkZJR19TTkRfRk04MDEgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERTUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9IRFNQTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JQ0Ux
NzEyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lDRTE3MjQgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfSU5URUw4WDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5URUw4WDBNIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0tPUkcxMjEyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xP
TEEgaXMgbm90IHNldAojIENPTkZJR19TTkRfTFg2NDY0RVMgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfTUFFU1RSTzMgaXMgbm90IHNldAojIENPTkZJR19TTkRfTUlYQVJUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX05NMjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1BDWEhSIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1JJUFRJREUgaXMgbm90IHNldAojIENPTkZJR19TTkRf
Uk1FMzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfUk1FOTYgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfUk1FOTY1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TRTZYIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPTklDVklCRVMgaXMgbm90IHNldAojIENPTkZJR19TTkRfVFJJREVO
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSUE4MlhYIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1ZJQTgyWFhfTU9ERU0gaXMgbm90IHNldAojIENPTkZJR19TTkRfVklSVFVPU08gaXMg
bm90IHNldAojIENPTkZJR19TTkRfVlgyMjIgaXMgbm90IHNldAojIENPTkZJR19TTkRfWU1G
UENJIGlzIG5vdCBzZXQKCiMKIyBIRC1BdWRpbwojCkNPTkZJR19TTkRfSERBPW0KIyBDT05G
SUdfU05EX0hEQV9JTlRFTCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfSERBX1RFR1JBPW0KIyBD
T05GSUdfU05EX0hEQV9IV0RFUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfUkVDT05G
SUcgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0lOUFVUX0JFRVAgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfSERBX1BBVENIX0xPQURFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9I
REFfU0NPREVDX0NTMzVMNDFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9TQ09E
RUNfQ1MzNUw0MV9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX1JFQUxU
RUsgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0FOQUxPRyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9IREFfQ09ERUNfU0lHTUFURUwgaXMgbm90IHNldAojIENPTkZJR19T
TkRfSERBX0NPREVDX1ZJQSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfSERBX0NPREVDX0hETUk9
bQojIENPTkZJR19TTkRfSERBX0NPREVDX0NJUlJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9IREFfQ09ERUNfQ1M4NDA5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19D
T05FWEFOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ0EwMTEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19DQTAxMzIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfSERBX0NPREVDX0NNRURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09E
RUNfU0kzMDU0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9HRU5FUklDIGlzIG5vdCBz
ZXQKQ09ORklHX1NORF9IREFfUE9XRVJfU0FWRV9ERUZBVUxUPTAKIyBlbmQgb2YgSEQtQXVk
aW8KCkNPTkZJR19TTkRfSERBX0NPUkU9bQpDT05GSUdfU05EX0hEQV9BTElHTkVEX01NSU89
eQpDT05GSUdfU05EX0hEQV9DT01QT05FTlQ9eQpDT05GSUdfU05EX0hEQV9QUkVBTExPQ19T
SVpFPTY0CkNPTkZJR19TTkRfU1BJPXkKQ09ORklHX1NORF9VU0I9eQojIENPTkZJR19TTkRf
VVNCX0FVRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9VQTEwMSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9VU0JfQ0FJQVEgaXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCXzZG
SVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9ISUZBQ0UgaXMgbm90IHNldAojIENP
TkZJR19TTkRfQkNEMjAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9VU0JfUE9EIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1VTQl9QT0RIRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9V
U0JfVE9ORVBPUlQgaXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX1ZBUklBWCBpcyBub3Qg
c2V0CkNPTkZJR19TTkRfU09DPXkKQ09ORklHX1NORF9TT0NfR0VORVJJQ19ETUFFTkdJTkVf
UENNPXkKQ09ORklHX1NORF9TT0NfQ09NUFJFU1M9eQpDT05GSUdfU05EX1NPQ19UT1BPTE9H
WT15CiMgQ09ORklHX1NORF9TT0NfQURJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19B
TURfQUNQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FNRF9BQ1BfQ09ORklHIGlzIG5vdCBz
ZXQKQ09ORklHX1NORF9TT0NfQVBQTEVfTUNBPXkKIyBDT05GSUdfU05EX0FUTUVMX1NPQyBp
cyBub3Qgc2V0CkNPTkZJR19TTkRfQkNNMjgzNV9TT0NfSTJTPW0KIyBDT05GSUdfU05EX0JD
TTYzWFhfSTJTX1dISVNUTEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RFU0lHTldBUkVf
STJTIGlzIG5vdCBzZXQKCiMKIyBTb0MgQXVkaW8gZm9yIEZyZWVzY2FsZSBDUFVzCiMKCiMK
IyBDb21tb24gU29DIEF1ZGlvIG9wdGlvbnMgZm9yIEZyZWVzY2FsZSBDUFVzOgojCkNPTkZJ
R19TTkRfU09DX0ZTTF9BU1JDPW0KQ09ORklHX1NORF9TT0NfRlNMX1NBST1tCiMgQ09ORklH
X1NORF9TT0NfRlNMX01RUyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX0ZTTF9BVURNSVg9
bQpDT05GSUdfU05EX1NPQ19GU0xfU1NJPW0KQ09ORklHX1NORF9TT0NfRlNMX1NQRElGPW0K
Q09ORklHX1NORF9TT0NfRlNMX0VTQUk9bQpDT05GSUdfU05EX1NPQ19GU0xfTUlDRklMPW0K
Q09ORklHX1NORF9TT0NfRlNMX0VBU1JDPW0KIyBDT05GSUdfU05EX1NPQ19GU0xfWENWUiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRlNMX0FVRDJIVFggaXMgbm90IHNldApDT05G
SUdfU05EX1NPQ19GU0xfVVRJTFM9bQojIENPTkZJR19TTkRfU09DX0ZTTF9SUE1TRyBpcyBu
b3Qgc2V0CkNPTkZJR19TTkRfU09DX0lNWF9QQ01fRE1BPW0KQ09ORklHX1NORF9TT0NfSU1Y
X0FVRE1VWD1tCkNPTkZJR19TTkRfSU1YX1NPQz1tCgojCiMgU29DIEF1ZGlvIHN1cHBvcnQg
Zm9yIEZyZWVzY2FsZSBpLk1YIGJvYXJkczoKIwojIENPTkZJR19TTkRfU09DX0lNWF9FUzgz
MjggaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19JTVhfU0dUTDUwMDA9bQpDT05GSUdfU05E
X1NPQ19JTVhfU1BESUY9bQpDT05GSUdfU05EX1NPQ19GU0xfQVNPQ19DQVJEPW0KQ09ORklH
X1NORF9TT0NfSU1YX0FVRE1JWD1tCiMgQ09ORklHX1NORF9TT0NfSU1YX0hETUkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0lNWF9SUE1TRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT0NfSU1YX0NBUkQgaXMgbm90IHNldAojIGVuZCBvZiBTb0MgQXVkaW8gZm9yIEZyZWVz
Y2FsZSBDUFVzCgojIENPTkZJR19TTkRfSTJTX0hJNjIxMF9JMlMgaXMgbm90IHNldAojIENP
TkZJR19TTkRfS0lSS1dPT0RfU09DIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19JTUcg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0lOVEVMX0tFRU1CQVkgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX01UMjcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVQ2
Nzk3IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NVDgxNzMgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX01UODE4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVQ4MTg2
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NVEtfQlRDVlNEIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19NVDgxOTIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01UODE5
NSBpcyBub3Qgc2V0CgojCiMgQVNvQyBzdXBwb3J0IGZvciBBbWxvZ2ljIHBsYXRmb3Jtcwoj
CkNPTkZJR19TTkRfTUVTT05fQUlVPW0KQ09ORklHX1NORF9NRVNPTl9BWEdfRklGTz1tCkNP
TkZJR19TTkRfTUVTT05fQVhHX0ZSRERSPW0KQ09ORklHX1NORF9NRVNPTl9BWEdfVE9ERFI9
bQpDT05GSUdfU05EX01FU09OX0FYR19URE1fRk9STUFUVEVSPW0KQ09ORklHX1NORF9NRVNP
Tl9BWEdfVERNX0lOVEVSRkFDRT1tCkNPTkZJR19TTkRfTUVTT05fQVhHX1RETUlOPW0KQ09O
RklHX1NORF9NRVNPTl9BWEdfVERNT1VUPW0KQ09ORklHX1NORF9NRVNPTl9BWEdfU09VTkRf
Q0FSRD1tCkNPTkZJR19TTkRfTUVTT05fQVhHX1NQRElGT1VUPW0KQ09ORklHX1NORF9NRVNP
Tl9BWEdfU1BESUZJTj1tCkNPTkZJR19TTkRfTUVTT05fQVhHX1BETT1tCkNPTkZJR19TTkRf
TUVTT05fQ0FSRF9VVElMUz1tCkNPTkZJR19TTkRfTUVTT05fQ09ERUNfR0xVRT1tCkNPTkZJ
R19TTkRfTUVTT05fR1hfU09VTkRfQ0FSRD1tCkNPTkZJR19TTkRfTUVTT05fRzEyQV9UT0FD
T0RFQz1tCkNPTkZJR19TTkRfTUVTT05fRzEyQV9UT0hETUlUWD1tCkNPTkZJR19TTkRfU09D
X01FU09OX1Q5MDE1PW0KIyBlbmQgb2YgQVNvQyBzdXBwb3J0IGZvciBBbWxvZ2ljIHBsYXRm
b3JtcwoKQ09ORklHX1NORF9TT0NfUUNPTT1tCkNPTkZJR19TTkRfU09DX0xQQVNTX0NQVT1t
CkNPTkZJR19TTkRfU09DX0xQQVNTX0hETUk9bQpDT05GSUdfU05EX1NPQ19MUEFTU19QTEFU
Rk9STT1tCkNPTkZJR19TTkRfU09DX0xQQVNTX0NEQ19ETUE9bQpDT05GSUdfU05EX1NPQ19M
UEFTU19BUFE4MDE2PW0KQ09ORklHX1NORF9TT0NfTFBBU1NfU0M3MTgwPW0KQ09ORklHX1NO
RF9TT0NfTFBBU1NfU0M3MjgwPW0KIyBDT05GSUdfU05EX1NPQ19TVE9STSBpcyBub3Qgc2V0
CkNPTkZJR19TTkRfU09DX0FQUTgwMTZfU0JDPW0KQ09ORklHX1NORF9TT0NfUUNPTV9DT01N
T049bQpDT05GSUdfU05EX1NPQ19RRFNQNl9DT01NT049bQpDT05GSUdfU05EX1NPQ19RRFNQ
Nl9DT1JFPW0KQ09ORklHX1NORF9TT0NfUURTUDZfQUZFPW0KQ09ORklHX1NORF9TT0NfUURT
UDZfQUZFX0RBST1tCkNPTkZJR19TTkRfU09DX1FEU1A2X0FGRV9DTE9DS1M9bQpDT05GSUdf
U05EX1NPQ19RRFNQNl9BRE09bQpDT05GSUdfU05EX1NPQ19RRFNQNl9ST1VUSU5HPW0KQ09O
RklHX1NORF9TT0NfUURTUDZfQVNNPW0KQ09ORklHX1NORF9TT0NfUURTUDZfQVNNX0RBST1t
CkNPTkZJR19TTkRfU09DX1FEU1A2X0FQTV9EQUk9bQpDT05GSUdfU05EX1NPQ19RRFNQNl9B
UE1fTFBBU1NfREFJPW0KQ09ORklHX1NORF9TT0NfUURTUDZfQVBNPW0KQ09ORklHX1NORF9T
T0NfUURTUDZfUFJNX0xQQVNTX0NMT0NLUz1tCkNPTkZJR19TTkRfU09DX1FEU1A2X1BSTT1t
CkNPTkZJR19TTkRfU09DX1FEU1A2PW0KQ09ORklHX1NORF9TT0NfTVNNODk5Nj1tCkNPTkZJ
R19TTkRfU09DX1NETTg0NT1tCkNPTkZJR19TTkRfU09DX1NNODI1MD1tCiMgQ09ORklHX1NO
RF9TT0NfU0M4MjgwWFAgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19TQzcxODA9bQpDT05G
SUdfU05EX1NPQ19TQzcyODA9bQpDT05GSUdfU05EX1NPQ19ST0NLQ0hJUD1tCkNPTkZJR19T
TkRfU09DX1JPQ0tDSElQX0kyUz1tCiMgQ09ORklHX1NORF9TT0NfUk9DS0NISVBfSTJTX1RE
TSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUk9DS0NISVBfUERNIGlzIG5vdCBzZXQK
Q09ORklHX1NORF9TT0NfUk9DS0NISVBfU1BESUY9bQojIENPTkZJR19TTkRfU09DX1JPQ0tD
SElQX01BWDk4MDkwIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfUk9DS0NISVBfUlQ1NjQ1
PW0KIyBDT05GSUdfU05EX1NPQ19SSzMyODhfSERNSV9BTkFMT0cgaXMgbm90IHNldApDT05G
SUdfU05EX1NPQ19SSzMzOTlfR1JVX1NPVU5EPW0KQ09ORklHX1NORF9TT0NfU0FNU1VORz15
CiMgQ09ORklHX1NORF9TQU1TVU5HX1BDTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TQU1T
VU5HX1NQRElGIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NBTVNVTkdfSTJTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19TQU1TVU5HX1NNREtfV004OTk0IGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19TQU1TVU5HX1NNREtfU1BESUYgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1NNREtfV004OTk0X1BDTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU05P
VyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfT0RST0lEIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19BUk5EQUxFIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TQU1TVU5H
X0FSSUVTX1dNODk5NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU0FNU1VOR19NSURB
U19XTTE4MTEgaXMgbm90IHNldAoKIwojIFNvQyBBdWRpbyBzdXBwb3J0IGZvciBSZW5lc2Fz
IFNvQ3MKIwojIENPTkZJR19TTkRfU09DX1NINF9GU0kgaXMgbm90IHNldApDT05GSUdfU05E
X1NPQ19SQ0FSPW0KQ09ORklHX1NORF9TT0NfUlo9bQojIGVuZCBvZiBTb0MgQXVkaW8gc3Vw
cG9ydCBmb3IgUmVuZXNhcyBTb0NzCgojIENPTkZJR19TTkRfU09DX1NPRl9UT1BMRVZFTCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU1BSRCBpcyBub3Qgc2V0CgojCiMgU1RNaWNy
b2VsZWN0cm9uaWNzIFNUTTMyIFNPQyBhdWRpbyBzdXBwb3J0CiMKIyBlbmQgb2YgU1RNaWNy
b2VsZWN0cm9uaWNzIFNUTTMyIFNPQyBhdWRpbyBzdXBwb3J0CgojCiMgQWxsd2lubmVyIFNv
QyBBdWRpbyBzdXBwb3J0CiMKIyBDT05GSUdfU05EX1NVTjRJX0NPREVDIGlzIG5vdCBzZXQK
Q09ORklHX1NORF9TVU44SV9DT0RFQz1tCkNPTkZJR19TTkRfU1VOOElfQ09ERUNfQU5BTE9H
PW0KQ09ORklHX1NORF9TVU41MElfQ09ERUNfQU5BTE9HPW0KQ09ORklHX1NORF9TVU40SV9J
MlM9bQpDT05GSUdfU05EX1NVTjRJX1NQRElGPW0KIyBDT05GSUdfU05EX1NVTjUwSV9ETUlD
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9TVU44SV9BRERBX1BSX1JFR01BUD1tCiMgZW5kIG9m
IEFsbHdpbm5lciBTb0MgQXVkaW8gc3VwcG9ydAoKQ09ORklHX1NORF9TT0NfVEVHUkE9bQoj
IENPTkZJR19TTkRfU09DX1RFR1JBMjBfQUM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfVEVHUkEyMF9EQVMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RFR1JBMjBfSTJT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19URUdSQTIwX1NQRElGIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19URUdSQTMwX0FIVUIgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1RFR1JBMzBfSTJTIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfVEVHUkEyMTBfQUhV
Qj1tCkNPTkZJR19TTkRfU09DX1RFR1JBMjEwX0RNSUM9bQpDT05GSUdfU05EX1NPQ19URUdS
QTIxMF9JMlM9bQpDT05GSUdfU05EX1NPQ19URUdSQTIxMF9PUEU9bQpDT05GSUdfU05EX1NP
Q19URUdSQTE4Nl9BU1JDPW0KQ09ORklHX1NORF9TT0NfVEVHUkExODZfRFNQSz1tCkNPTkZJ
R19TTkRfU09DX1RFR1JBMjEwX0FETUFJRj1tCkNPTkZJR19TTkRfU09DX1RFR1JBMjEwX01W
Qz1tCkNPTkZJR19TTkRfU09DX1RFR1JBMjEwX1NGQz1tCkNPTkZJR19TTkRfU09DX1RFR1JB
MjEwX0FNWD1tCkNPTkZJR19TTkRfU09DX1RFR1JBMjEwX0FEWD1tCkNPTkZJR19TTkRfU09D
X1RFR1JBMjEwX01JWEVSPW0KQ09ORklHX1NORF9TT0NfVEVHUkFfQVVESU9fR1JBUEhfQ0FS
RD1tCiMgQ09ORklHX1NORF9TT0NfVEVHUkFfUlQ1NjQwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19URUdSQV9XTTg3NTMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RFR1JB
X1dNODkwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEVHUkFfV005NzEyIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19URUdSQV9UUklNU0xJQ0UgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX1RFR1JBX0FMQzU2MzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1RFR1JBX01BWDk4MDkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19URUdSQV9SVDU2
NzcgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RFR1JBX1NHVEw1MDAwIGlzIG5vdCBz
ZXQKCiMKIyBBdWRpbyBzdXBwb3J0IGZvciBUZXhhcyBJbnN0cnVtZW50cyBTb0NzCiMKCiMK
IyBUZXhhcyBJbnN0cnVtZW50cyBEQUkgc3VwcG9ydCBmb3I6CiMKIyBDT05GSUdfU05EX1NP
Q19EQVZJTkNJX01DQVNQIGlzIG5vdCBzZXQKCiMKIyBBdWRpbyBzdXBwb3J0IGZvciBib2Fy
ZHMgd2l0aCBUZXhhcyBJbnN0cnVtZW50cyBTb0NzCiMKIyBDT05GSUdfU05EX1NPQ19KNzIx
RV9FVk0gaXMgbm90IHNldAojIGVuZCBvZiBBdWRpbyBzdXBwb3J0IGZvciBUZXhhcyBJbnN0
cnVtZW50cyBTb0NzCgojIENPTkZJR19TTkRfU09DX1VOSVBISUVSIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19YSUxJTlhfSTJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19Y
SUxJTlhfQVVESU9fRk9STUFUVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19YSUxJ
TlhfU1BESUYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1hURlBHQV9JMlMgaXMgbm90
IHNldApDT05GSUdfU05EX1NPQ19JMkNfQU5EX1NQST15CgojCiMgQ09ERUMgZHJpdmVycwoj
CkNPTkZJR19TTkRfU09DX1dNX0hVQlM9bQojIENPTkZJR19TTkRfU09DX0FDOTdfQ09ERUMg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FEQVUxMzcyX0kyQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQURBVTEzNzJfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19BREFVMTcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQURBVTE3NjFfSTJDIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BREFVMTc2MV9TUEkgaXMgbm90IHNldApDT05G
SUdfU05EX1NPQ19BREFVNzAwMj1tCiMgQ09ORklHX1NORF9TT0NfQURBVTcxMThfSFcgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX0FEQVU3MTE4X0kyQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfQUs0MTA0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BSzQxMTgg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDM3NSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfQUs0NDU4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BSzQ1NTQgaXMg
bm90IHNldApDT05GSUdfU05EX1NPQ19BSzQ2MTM9bQojIENPTkZJR19TTkRfU09DX0FLNDY0
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQUs1Mzg2IGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19BSzU1NTggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FMQzU2MjMg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FXODczOCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfQkQyODYyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQlRfU0NPIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9TT0NfQ1JPU19FQ19DT0RFQz1tCiMgQ09ORklHX1NORF9T
T0NfQ1MzNUwzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUwzMyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUwzNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfQ1MzNUwzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUwzNiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUw0MV9TUEkgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0NTMzVMNDFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzM1TDQ1
X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUw0NV9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX0NTNDJMNDIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0NTNDJMNTFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyTDUyIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyTDU2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19DUzQyTDczIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyTDgzIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyMzQgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX0NTNDI2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0MjcwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyNzFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19DUzQyNzFfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyWFg4X0ky
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0MzEzMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfQ1M0MzQxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQzNDkg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNTNMMzAgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX0NYMjA3MlggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0RBNzIxMyBp
cyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX0RBNzIxOT1tCkNPTkZJR19TTkRfU09DX0RNSUM9
bQpDT05GSUdfU05EX1NPQ19IRE1JX0NPREVDPW0KQ09ORklHX1NORF9TT0NfRVM3MTM0PW0K
Q09ORklHX1NORF9TT0NfRVM3MjQxPW0KIyBDT05GSUdfU05EX1NPQ19FUzgzMTYgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0VTODMyNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfRVM4MzI4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRVM4MzI4X1NQSSBp
cyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX0dUTTYwMT1tCiMgQ09ORklHX1NORF9TT0NfSERB
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19JQ1M0MzQzMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfSU5OT19SSzMwMzYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01B
WDk4MDg4IGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfTUFYOTgzNTdBPW0KIyBDT05GSUdf
U05EX1NPQ19NQVg5ODUwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTg2NyBp
cyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX01BWDk4OTI3PW0KIyBDT05GSUdfU05EX1NPQ19N
QVg5ODUyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTgzNzNfSTJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19NQVg5ODM3M19TRFcgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX01BWDk4MzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NQVg5ODM5
NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTg2MCBpcyBub3Qgc2V0CkNPTkZJ
R19TTkRfU09DX01TTTg5MTZfV0NEX0FOQUxPRz1tCkNPTkZJR19TTkRfU09DX01TTTg5MTZf
V0NEX0RJR0lUQUw9bQojIENPTkZJR19TTkRfU09DX1BDTTE2ODEgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX1BDTTE3ODlfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19Q
Q00xNzlYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNMTc5WF9TUEkgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE4NlhfSTJDIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19QQ00xODZYX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENN
MzA2MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTMwNjBfU1BJIGlzIG5v
dCBzZXQKQ09ORklHX1NORF9TT0NfUENNMzE2OEE9bQpDT05GSUdfU05EX1NPQ19QQ00zMTY4
QV9JMkM9bQojIENPTkZJR19TTkRfU09DX1BDTTMxNjhBX1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfUENNNTEwMkEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTUx
MnhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ001MTJ4X1NQSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfUkszMzI4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19SSzgxNyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX1JMNjIzMT1tCiMgQ09ORklHX1NO
RF9TT0NfUlQxMzA4X1NEVyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUlQxMzE2X1NE
VyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX1JUNTUxND1tCkNPTkZJR19TTkRfU09DX1JU
NTUxNF9TUEk9bQojIENPTkZJR19TTkRfU09DX1JUNTYxNiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfUlQ1NjMxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19SVDU2NDAgaXMg
bm90IHNldApDT05GSUdfU05EX1NPQ19SVDU2NDU9bQpDT05GSUdfU05EX1NPQ19SVDU2NTk9
bQpDT05GSUdfU05EX1NPQ19SVDU2NjM9bQpDT05GSUdfU05EX1NPQ19SVDU2ODI9bQpDT05G
SUdfU05EX1NPQ19SVDU2ODJfSTJDPW0KIyBDT05GSUdfU05EX1NPQ19SVDU2ODJfU0RXIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9TT0NfUlQ1NjgyUz1tCiMgQ09ORklHX1NORF9TT0NfUlQ3
MDBfU0RXIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19SVDcxMV9TRFcgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX1JUNzExX1NEQ0FfU0RXIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19SVDcxNV9TRFcgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1JUNzE1X1NE
Q0FfU0RXIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19SVDkxMjAgaXMgbm90IHNldApD
T05GSUdfU05EX1NPQ19TR1RMNTAwMD1tCkNPTkZJR19TTkRfU09DX1NJTVBMRV9BTVBMSUZJ
RVI9bQpDT05GSUdfU05EX1NPQ19TSU1QTEVfTVVYPW0KQ09ORklHX1NORF9TT0NfU1BESUY9
bQojIENPTkZJR19TTkRfU09DX1NSQzRYWFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19TU00yMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TU00yNTE4IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19TU00yNjAyX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfU1NNMjYwMl9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1NTTTQ1
NjcgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1NUQTMyWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfU1RBMzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TVElfU0FT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVMyNTUyIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19UQVMyNTYyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVMyNzY0
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVMyNzcwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19UQVMyNzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVM1MDg2
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfVEFTNTcxWD1tCiMgQ09ORklHX1NORF9TT0Nf
VEFTNTcyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTgwNU0gaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX1RBUzY0MjQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1REQTc0MTkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RGQTk4NzkgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX1RGQTk4OVggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1RMVjMyMEFEQzNYWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RMVjMyMEFJQzIz
X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIwQUlDMjNfU1BJIGlzIG5v
dCBzZXQKQ09ORklHX1NORF9TT0NfVExWMzIwQUlDMzFYWD1tCkNPTkZJR19TTkRfU09DX1RM
VjMyMEFJQzMyWDQ9bQpDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMlg0X0kyQz1tCiMgQ09O
RklHX1NORF9TT0NfVExWMzIwQUlDMzJYNF9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1RMVjMyMEFJQzNYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIw
QUlDM1hfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBBRENYMTQwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UUzNBMjI3RSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfVFNDUzQyWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RTQ1M0NTQg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1VEQTEzMzQgaXMgbm90IHNldApDT05GSUdf
U05EX1NPQ19XQ0Q5MzM1PW0KQ09ORklHX1NORF9TT0NfV0NEX01CSEM9bQpDT05GSUdfU05E
X1NPQ19XQ0Q5MzRYPW0KQ09ORklHX1NORF9TT0NfV0NEOTM4WD1tCkNPTkZJR19TTkRfU09D
X1dDRDkzOFhfU0RXPW0KIyBDT05GSUdfU05EX1NPQ19XTTg1MTAgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX1dNODUyMyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX1dNODUyND1t
CiMgQ09ORklHX1NORF9TT0NfV004NTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19X
TTg3MTEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODcyOCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfV004NzMxX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
V004NzMxX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzM3IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3NDEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1dNODc1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzUzIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19XTTg3NzAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dN
ODc3NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzgyIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19XTTg4MDRfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19X
TTg4MDRfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg5MDMgaXMgbm90IHNl
dApDT05GSUdfU05EX1NPQ19XTTg5MDQ9bQojIENPTkZJR19TTkRfU09DX1dNODk0MCBpcyBu
b3Qgc2V0CkNPTkZJR19TTkRfU09DX1dNODk2MD1tCkNPTkZJR19TTkRfU09DX1dNODk2Mj1t
CiMgQ09ORklHX1NORF9TT0NfV004OTc0IGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfV004
OTc4PW0KIyBDT05GSUdfU05EX1NPQ19XTTg5ODUgaXMgbm90IHNldApDT05GSUdfU05EX1NP
Q19XTTg5OTQ9bQpDT05GSUdfU05EX1NPQ19XU0E4ODFYPW0KIyBDT05GSUdfU05EX1NPQ19X
U0E4ODNYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19aTDM4MDYwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19NQVg5NzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19N
VDYzNTEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01UNjM1OCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfTVQ2MzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NVDYz
NTlfQUNDREVUIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NVDY2NjAgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX05BVTgzMTUgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X05BVTg1NDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX05BVTg4MTAgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX05BVTg4MjEgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19O
QVU4ODIyPW0KIyBDT05GSUdfU05EX1NPQ19OQVU4ODI0IGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19UUEE2MTMwQTIgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19MUEFTU19NQUNS
T19DT01NT049bQpDT05GSUdfU05EX1NPQ19MUEFTU19XU0FfTUFDUk89bQpDT05GSUdfU05E
X1NPQ19MUEFTU19WQV9NQUNSTz1tCkNPTkZJR19TTkRfU09DX0xQQVNTX1JYX01BQ1JPPW0K
Q09ORklHX1NORF9TT0NfTFBBU1NfVFhfTUFDUk89bQojIGVuZCBvZiBDT0RFQyBkcml2ZXJz
CgpDT05GSUdfU05EX1NJTVBMRV9DQVJEX1VUSUxTPW0KQ09ORklHX1NORF9TSU1QTEVfQ0FS
RD1tCkNPTkZJR19TTkRfQVVESU9fR1JBUEhfQ0FSRD1tCkNPTkZJR19TTkRfQVVESU9fR1JB
UEhfQ0FSRDI9bQojIENPTkZJR19TTkRfQVVESU9fR1JBUEhfQ0FSRDJfQ1VTVE9NX1NBTVBM
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9URVNUX0NPTVBPTkVOVCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9YRU5fRlJPTlRFTkQgaXMgbm90IHNldAojIENPTkZJR19TTkRfVklSVElP
IGlzIG5vdCBzZXQKCiMKIyBISUQgc3VwcG9ydAojCkNPTkZJR19ISUQ9eQojIENPTkZJR19I
SURfQkFUVEVSWV9TVFJFTkdUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRFJBVyBpcyBub3Qg
c2V0CiMgQ09ORklHX1VISUQgaXMgbm90IHNldApDT05GSUdfSElEX0dFTkVSSUM9eQoKIwoj
IFNwZWNpYWwgSElEIGRyaXZlcnMKIwpDT05GSUdfSElEX0E0VEVDSD15CiMgQ09ORklHX0hJ
RF9BQ0NVVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfQUNSVVggaXMgbm90IHNldApD
T05GSUdfSElEX0FQUExFPXkKIyBDT05GSUdfSElEX0FQUExFSVIgaXMgbm90IHNldAojIENP
TkZJR19ISURfQVNVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BVVJFQUwgaXMgbm90IHNl
dApDT05GSUdfSElEX0JFTEtJTj15CiMgQ09ORklHX0hJRF9CRVRPUF9GRiBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9CSUdCRU5fRkYgaXMgbm90IHNldApDT05GSUdfSElEX0NIRVJSWT15
CkNPTkZJR19ISURfQ0hJQ09OWT15CiMgQ09ORklHX0hJRF9DT1JTQUlSIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0NPVUdBUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQUNBTExZIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1BST0RJS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9DTUVESUEgaXMgbm90IHNldAojIENPTkZJR19ISURfQ1JFQVRJVkVfU0IwNTQwIGlzIG5v
dCBzZXQKQ09ORklHX0hJRF9DWVBSRVNTPXkKIyBDT05GSUdfSElEX0RSQUdPTlJJU0UgaXMg
bm90IHNldAojIENPTkZJR19ISURfRU1TX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VM
QU4gaXMgbm90IHNldAojIENPTkZJR19ISURfRUxFQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0VMTyBpcyBub3Qgc2V0CkNPTkZJR19ISURfRVpLRVk9eQojIENPTkZJR19ISURfR0VN
QklSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0dMT1JJT1VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0hPTFRFSyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9HT09HTEVfSEFNTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJ
VkFMREkgaXMgbm90IHNldAojIENPTkZJR19ISURfR1Q2ODNSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0tFWVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tZRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9VQ0xPR0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1dBTFRPUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9WSUVXU09OSUMgaXMgbm90IHNldAojIENPTkZJR19I
SURfVlJDMiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9YSUFPTUkgaXMgbm90IHNldAojIENP
TkZJR19ISURfR1lSQVRJT04gaXMgbm90IHNldAojIENPTkZJR19ISURfSUNBREUgaXMgbm90
IHNldApDT05GSUdfSElEX0lURT15CiMgQ09ORklHX0hJRF9KQUJSQSBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9UV0lOSEFOIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9LRU5TSU5HVE9OPXkK
IyBDT05GSUdfSElEX0xDUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19ISURfTEVEIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0xFTk9WTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MRVRT
S0VUQ0ggaXMgbm90IHNldApDT05GSUdfSElEX0xPR0lURUNIPXkKIyBDT05GSUdfSElEX0xP
R0lURUNIX0hJRFBQIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9HSVRFQ0hfRkYgaXMgbm90IHNl
dAojIENPTkZJR19MT0dJUlVNQkxFUEFEMl9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0xPR0lH
OTQwX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9HSVdIRUVMU19GRiBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9NQUdJQ01PVVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01BTFRST04g
aXMgbm90IHNldAojIENPTkZJR19ISURfTUFZRkxBU0ggaXMgbm90IHNldAojIENPTkZJR19I
SURfTUVHQVdPUkxEX0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9SRURSQUdPTj15CkNPTkZJ
R19ISURfTUlDUk9TT0ZUPXkKQ09ORklHX0hJRF9NT05URVJFWT15CkNPTkZJR19ISURfTVVM
VElUT1VDSD1tCiMgQ09ORklHX0hJRF9OSU5URU5ETyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9OVEkgaXMgbm90IHNldAojIENPTkZJR19ISURfTlRSSUcgaXMgbm90IHNldAojIENPTkZJ
R19ISURfT1JURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfUEFOVEhFUkxPUkQgaXMgbm90
IHNldAojIENPTkZJR19ISURfUEVOTU9VTlQgaXMgbm90IHNldAojIENPTkZJR19ISURfUEVU
QUxZTlggaXMgbm90IHNldAojIENPTkZJR19ISURfUElDT0xDRCBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9QTEFOVFJPTklDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFZU1RBVElP
TiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QWFJDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1JBWkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BSSU1BWCBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9SRVRST0RFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JPQ0NBVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9TQUlURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfU0FNU1VO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TRU1JVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX1NJR01BTUlDUk8gaXMgbm90IHNldAojIENPTkZJR19ISURfU09OWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9TUEVFRExJTksgaXMgbm90IHNldAojIENPTkZJR19ISURfU1RFQU0g
aXMgbm90IHNldAojIENPTkZJR19ISURfU1RFRUxTRVJJRVMgaXMgbm90IHNldAojIENPTkZJ
R19ISURfU1VOUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9STUkgaXMgbm90IHNldAoj
IENPTkZJR19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NNQVJUSk9Z
UExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USVZPIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX1RPUFNFRUQgaXMgbm90IHNldAojIENPTkZJR19ISURfVE9QUkUgaXMgbm90IHNldAoj
IENPTkZJR19ISURfVEhJTkdNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RIUlVTVE1BU1RF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VRFJBV19QUzMgaXMgbm90IHNldAojIENPTkZJ
R19ISURfVTJGWkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUNPTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9XSUlNT1RFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1hJTk1PIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1pFUk9QTFVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1pZREFDUk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NFTlNPUl9IVUIgaXMgbm90IHNl
dAojIENPTkZJR19ISURfQUxQUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQ1AyMjIxIGlz
IG5vdCBzZXQKIyBlbmQgb2YgU3BlY2lhbCBISUQgZHJpdmVycwoKIwojIFVTQiBISUQgc3Vw
cG9ydAojCkNPTkZJR19VU0JfSElEPXkKIyBDT05GSUdfSElEX1BJRCBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9ISURERVYgaXMgbm90IHNldAojIGVuZCBvZiBVU0IgSElEIHN1cHBvcnQK
CiMKIyBJMkMgSElEIHN1cHBvcnQKIwpDT05GSUdfSTJDX0hJRF9BQ1BJPW0KQ09ORklHX0ky
Q19ISURfT0Y9bQojIENPTkZJR19JMkNfSElEX09GX0VMQU4gaXMgbm90IHNldAojIENPTkZJ
R19JMkNfSElEX09GX0dPT0RJWCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBISUQgc3VwcG9y
dAoKQ09ORklHX0kyQ19ISURfQ09SRT1tCiMgZW5kIG9mIEhJRCBzdXBwb3J0CgpDT05GSUdf
VVNCX09IQ0lfTElUVExFX0VORElBTj15CkNPTkZJR19VU0JfU1VQUE9SVD15CkNPTkZJR19V
U0JfQ09NTU9OPXkKIyBDT05GSUdfVVNCX0xFRF9UUklHIGlzIG5vdCBzZXQKQ09ORklHX1VT
Ql9VTFBJX0JVUz15CkNPTkZJR19VU0JfQ09OTl9HUElPPXkKQ09ORklHX1VTQl9BUkNIX0hB
U19IQ0Q9eQpDT05GSUdfVVNCPXkKQ09ORklHX1VTQl9QQ0k9eQojIENPTkZJR19VU0JfQU5O
T1VOQ0VfTkVXX0RFVklDRVMgaXMgbm90IHNldAoKIwojIE1pc2NlbGxhbmVvdXMgVVNCIG9w
dGlvbnMKIwpDT05GSUdfVVNCX0RFRkFVTFRfUEVSU0lTVD15CiMgQ09ORklHX1VTQl9GRVdf
SU5JVF9SRVRSSUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0RZTkFNSUNfTUlOT1JTIGlz
IG5vdCBzZXQKQ09ORklHX1VTQl9PVEc9eQojIENPTkZJR19VU0JfT1RHX1BST0RVQ1RMSVNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09UR19ESVNBQkxFX0VYVEVSTkFMX0hVQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9PVEdfRlNNIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xF
RFNfVFJJR0dFUl9VU0JQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BVVRPU1VTUEVORF9E
RUxBWT0yCiMgQ09ORklHX1VTQl9NT04gaXMgbm90IHNldAoKIwojIFVTQiBIb3N0IENvbnRy
b2xsZXIgRHJpdmVycwojCiMgQ09ORklHX1VTQl9DNjdYMDBfSENEIGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9YSENJX0hDRD15CiMgQ09ORklHX1VTQl9YSENJX0RCR0NBUCBpcyBub3Qgc2V0
CkNPTkZJR19VU0JfWEhDSV9QQ0k9bQpDT05GSUdfVVNCX1hIQ0lfUENJX1JFTkVTQVM9bQpD
T05GSUdfVVNCX1hIQ0lfUExBVEZPUk09eQojIENPTkZJR19VU0JfWEhDSV9ISVNUQiBpcyBu
b3Qgc2V0CkNPTkZJR19VU0JfWEhDSV9NVEs9eQojIENPTkZJR19VU0JfWEhDSV9NVkVCVSBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfWEhDSV9SQ0FSPXkKQ09ORklHX1VTQl9YSENJX1RFR1JB
PXkKQ09ORklHX1VTQl9FSENJX0JSQ01TVEI9bQpDT05GSUdfVVNCX0JSQ01TVEI9bQpDT05G
SUdfVVNCX0VIQ0lfSENEPXkKQ09ORklHX1VTQl9FSENJX1JPT1RfSFVCX1RUPXkKQ09ORklH
X1VTQl9FSENJX1RUX05FV1NDSEVEPXkKQ09ORklHX1VTQl9FSENJX1BDST15CiMgQ09ORklH
X1VTQl9FSENJX0ZTTCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRUhDSV9IQ0RfTlBDTTdYWD15
CkNPTkZJR19VU0JfRUhDSV9IQ0RfT1JJT049eQojIENPTkZJR19VU0JfRUhDSV9URUdSQSBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfRUhDSV9FWFlOT1M9eQpDT05GSUdfVVNCX0VIQ0lfSENE
X1BMQVRGT1JNPXkKIyBDT05GSUdfVVNCX09YVTIxMEhQX0hDRCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9JU1AxMTZYX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9GT1RHMjEwX0hD
RCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9NQVgzNDIxX0hDRCBpcyBub3Qgc2V0CkNPTkZJ
R19VU0JfT0hDSV9IQ0Q9eQpDT05GSUdfVVNCX09IQ0lfSENEX1BDST15CkNPTkZJR19VU0Jf
T0hDSV9FWFlOT1M9eQpDT05GSUdfVVNCX09IQ0lfSENEX1BMQVRGT1JNPXkKIyBDT05GSUdf
VVNCX1VIQ0lfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NMODExX0hDRCBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9SOEE2NjU5N19IQ0QgaXMgbm90IHNldApDT05GSUdfVVNCX1JF
TkVTQVNfVVNCSFNfSENEPW0KIyBDT05GSUdfVVNCX0hDRF9URVNUX01PREUgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfWEVOX0hDRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfUkVORVNBU19V
U0JIUz1tCgojCiMgVVNCIERldmljZSBDbGFzcyBkcml2ZXJzCiMKQ09ORklHX1VTQl9BQ009
bQojIENPTkZJR19VU0JfUFJJTlRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9XRE0gaXMg
bm90IHNldAojIENPTkZJR19VU0JfVE1DIGlzIG5vdCBzZXQKCiMKIyBOT1RFOiBVU0JfU1RP
UkFHRSBkZXBlbmRzIG9uIFNDU0kgYnV0IEJMS19ERVZfU0QgbWF5CiMKCiMKIyBhbHNvIGJl
IG5lZWRlZDsgc2VlIFVTQl9TVE9SQUdFIEhlbHAgZm9yIG1vcmUgaW5mbwojCkNPTkZJR19V
U0JfU1RPUkFHRT15CiMgQ09ORklHX1VTQl9TVE9SQUdFX0RFQlVHIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NUT1JBR0VfUkVBTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9S
QUdFX0RBVEFGQUIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9GUkVFQ09NIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfSVNEMjAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1NUT1JBR0VfVVNCQVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9T
RERSMDkgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9TRERSNTUgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfU1RPUkFHRV9KVU1QU0hPVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TVE9SQUdFX0FMQVVEQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX09ORVRP
VUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfS0FSTUEgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU1RPUkFHRV9DWVBSRVNTX0FUQUNCIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NUT1JBR0VfRU5FX1VCNjI1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9VQVMgaXMg
bm90IHNldAoKIwojIFVTQiBJbWFnaW5nIGRldmljZXMKIwojIENPTkZJR19VU0JfTURDODAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01JQ1JPVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCSVBfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQ0ROU19TVVBQT1JUPW0KQ09ORklH
X1VTQl9DRE5TX0hPU1Q9eQpDT05GSUdfVVNCX0NETlMzPW0KQ09ORklHX1VTQl9DRE5TM19H
QURHRVQ9eQpDT05GSUdfVVNCX0NETlMzX0hPU1Q9eQpDT05GSUdfVVNCX0NETlMzX1BDSV9X
UkFQPW0KQ09ORklHX1VTQl9DRE5TM19UST1tCkNPTkZJR19VU0JfQ0ROUzNfSU1YPW0KIyBD
T05GSUdfVVNCX0NETlNQX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTVRVMz15CiMgQ09O
RklHX1VTQl9NVFUzX0hPU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVRVM19HQURHRVQg
aXMgbm90IHNldApDT05GSUdfVVNCX01UVTNfRFVBTF9ST0xFPXkKIyBDT05GSUdfVVNCX01U
VTNfREVCVUcgaXMgbm90IHNldApDT05GSUdfVVNCX01VU0JfSERSQz15CiMgQ09ORklHX1VT
Ql9NVVNCX0hPU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVVTQl9HQURHRVQgaXMgbm90
IHNldApDT05GSUdfVVNCX01VU0JfRFVBTF9ST0xFPXkKCiMKIyBQbGF0Zm9ybSBHbHVlIExh
eWVyCiMKQ09ORklHX1VTQl9NVVNCX1NVTlhJPXkKIyBDT05GSUdfVVNCX01VU0JfTUVESUFU
RUsgaXMgbm90IHNldAoKIwojIE1VU0IgRE1BIG1vZGUKIwojIENPTkZJR19NVVNCX1BJT19P
TkxZIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9EV0MzPXkKIyBDT05GSUdfVVNCX0RXQzNfVUxQ
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EV0MzX0hPU1QgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfRFdDM19HQURHRVQgaXMgbm90IHNldApDT05GSUdfVVNCX0RXQzNfRFVBTF9ST0xF
PXkKCiMKIyBQbGF0Zm9ybSBHbHVlIERyaXZlciBTdXBwb3J0CiMKQ09ORklHX1VTQl9EV0Mz
X0VYWU5PUz15CkNPTkZJR19VU0JfRFdDM19QQ0k9eQpDT05GSUdfVVNCX0RXQzNfSEFQUz15
CkNPTkZJR19VU0JfRFdDM19LRVlTVE9ORT15CkNPTkZJR19VU0JfRFdDM19NRVNPTl9HMTJB
PXkKQ09ORklHX1VTQl9EV0MzX09GX1NJTVBMRT15CkNPTkZJR19VU0JfRFdDM19RQ09NPXkK
Q09ORklHX1VTQl9EV0MzX0lNWDhNUD15CkNPTkZJR19VU0JfRFdDM19YSUxJTlg9eQpDT05G
SUdfVVNCX0RXQzNfQU02Mj15CkNPTkZJR19VU0JfRFdDMj15CiMgQ09ORklHX1VTQl9EV0My
X0hPU1QgaXMgbm90IHNldAoKIwojIEdhZGdldC9EdWFsLXJvbGUgbW9kZSByZXF1aXJlcyBV
U0IgR2FkZ2V0IHN1cHBvcnQgdG8gYmUgZW5hYmxlZAojCiMgQ09ORklHX1VTQl9EV0MyX1BF
UklQSEVSQUwgaXMgbm90IHNldApDT05GSUdfVVNCX0RXQzJfRFVBTF9ST0xFPXkKIyBDT05G
SUdfVVNCX0RXQzJfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0RXQzJfREVCVUcgaXMg
bm90IHNldAojIENPTkZJR19VU0JfRFdDMl9UUkFDS19NSVNTRURfU09GUyBpcyBub3Qgc2V0
CkNPTkZJR19VU0JfQ0hJUElERUE9eQpDT05GSUdfVVNCX0NISVBJREVBX1VEQz15CkNPTkZJ
R19VU0JfQ0hJUElERUFfSE9TVD15CkNPTkZJR19VU0JfQ0hJUElERUFfUENJPXkKQ09ORklH
X1VTQl9DSElQSURFQV9NU009eQpDT05GSUdfVVNCX0NISVBJREVBX0lNWD15CkNPTkZJR19V
U0JfQ0hJUElERUFfR0VORVJJQz15CkNPTkZJR19VU0JfQ0hJUElERUFfVEVHUkE9eQpDT05G
SUdfVVNCX0lTUDE3NjA9eQpDT05GSUdfVVNCX0lTUDE3NjBfSENEPXkKQ09ORklHX1VTQl9J
U1AxNzYxX1VEQz15CiMgQ09ORklHX1VTQl9JU1AxNzYwX0hPU1RfUk9MRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9JU1AxNzYwX0dBREdFVF9ST0xFIGlzIG5vdCBzZXQKQ09ORklHX1VT
Ql9JU1AxNzYwX0RVQUxfUk9MRT15CgojCiMgVVNCIHBvcnQgZHJpdmVycwojCkNPTkZJR19V
U0JfU0VSSUFMPW0KIyBDT05GSUdfVVNCX1NFUklBTF9HRU5FUklDIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NFUklBTF9TSU1QTEUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFM
X0FJUkNBQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9BUkszMTE2IGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9CRUxLSU4gaXMgbm90IHNldAojIENPTkZJR19V
U0JfU0VSSUFMX0NIMzQxIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9XSElURUhF
QVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0RJR0lfQUNDRUxFUE9SVCBpcyBu
b3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX0NQMjEwWD1tCiMgQ09ORklHX1VTQl9TRVJJQUxf
Q1lQUkVTU19NOCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfRU1QRUcgaXMgbm90
IHNldApDT05GSUdfVVNCX1NFUklBTF9GVERJX1NJTz1tCiMgQ09ORklHX1VTQl9TRVJJQUxf
VklTT1IgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0lQQVEgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0VSSUFMX0lSIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9F
REdFUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfRURHRVBPUlRfVEkgaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0Y4MTIzMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9TRVJJQUxfRjgxNTNYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9HQVJN
SU4gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0lQVyBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TRVJJQUxfSVVVIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9LRVlT
UEFOX1BEQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfS0VZU1BBTiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfS0xTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9T
RVJJQUxfS09CSUxfU0NUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9NQ1RfVTIz
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTUVUUk8gaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0VSSUFMX01PUzc3MjAgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFM
X01PUzc4NDAgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX01YVVBPUlQgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU0VSSUFMX05BVk1BTiBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TRVJJQUxfUEwyMzAzIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PVEk2ODU4
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9RQ0FVWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TRVJJQUxfUVVBTENPTU0gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFM
X1NQQ1A4WDUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1NBRkUgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfU0VSSUFMX1NJRVJSQVdJUkVMRVNTIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1NFUklBTF9TWU1CT0wgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1RJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9DWUJFUkpBQ0sgaXMgbm90IHNldApD
T05GSUdfVVNCX1NFUklBTF9XV0FOPW0KQ09ORklHX1VTQl9TRVJJQUxfT1BUSU9OPW0KIyBD
T05GSUdfVVNCX1NFUklBTF9PTU5JTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklB
TF9PUFRJQ09OIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9YU0VOU19NVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfV0lTSEJPTkUgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfU0VSSUFMX1NTVTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfUVQy
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9VUEQ3OEYwNzMwIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NFUklBTF9YUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxf
REVCVUcgaXMgbm90IHNldAoKIwojIFVTQiBNaXNjZWxsYW5lb3VzIGRyaXZlcnMKIwojIENP
TkZJR19VU0JfRU1JNjIgaXMgbm90IHNldAojIENPTkZJR19VU0JfRU1JMjYgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfQURVVFVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFVlNFRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRUdPVE9XRVIgaXMgbm90IHNldAojIENPTkZJR19V
U0JfTENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NZUFJFU1NfQ1k3QzYzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX0NZVEhFUk0gaXMgbm90IHNldAojIENPTkZJR19VU0JfSURNT1VT
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9GVERJX0VMQU4gaXMgbm90IHNldAojIENPTkZJ
R19VU0JfQVBQTEVESVNQTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1FDT01fRVVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVBQTEVfTUZJX0ZBU1RDSEFSR0UgaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0lTVVNCVkdBIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1RSQU5DRVZJQlJBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X0lPV0FSUklPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9URVNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX0VIU0VUX1RFU1RfRklYVFVSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9J
U0lHSFRGVyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ZVVJFWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9FWlVTQl9GWDIgaXMgbm90IHNldAojIENPTkZJR19VU0JfSFVCX1VTQjI1MVhC
IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9IU0lDX1VTQjM1MDM9eQojIENPTkZJR19VU0JfSFNJ
Q19VU0I0NjA0IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xJTktfTEFZRVJfVEVTVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9DSEFPU0tFWSBpcyBub3Qgc2V0CkNPTkZJR19CUkNNX1VT
Ql9QSU5NQVA9eQpDT05GSUdfVVNCX09OQk9BUkRfSFVCPXkKCiMKIyBVU0IgUGh5c2ljYWwg
TGF5ZXIgZHJpdmVycwojCkNPTkZJR19VU0JfUEhZPXkKQ09ORklHX05PUF9VU0JfWENFSVY9
eQojIENPTkZJR19VU0JfR1BJT19WQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0lTUDEz
MDEgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVhTX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfVEVHUkFfUEhZPXkKQ09ORklHX1VTQl9VTFBJPXkKQ09ORklHX1VTQl9VTFBJX1ZJRVdQ
T1JUPXkKIyBlbmQgb2YgVVNCIFBoeXNpY2FsIExheWVyIGRyaXZlcnMKCkNPTkZJR19VU0Jf
R0FER0VUPXkKIyBDT05GSUdfVVNCX0dBREdFVF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9HQURHRVRfREVCVUdfRklMRVMgaXMgbm90IHNldAojIENPTkZJR19VU0JfR0FER0VU
X0RFQlVHX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9HQURHRVRfVkJVU19EUkFXPTIKQ09O
RklHX1VTQl9HQURHRVRfU1RPUkFHRV9OVU1fQlVGRkVSUz0yCiMgQ09ORklHX1VfU0VSSUFM
X0NPTlNPTEUgaXMgbm90IHNldAoKIwojIFVTQiBQZXJpcGhlcmFsIENvbnRyb2xsZXIKIwoj
IENPTkZJR19VU0JfRk9URzIxMF9VREMgaXMgbm90IHNldAojIENPTkZJR19VU0JfR1JfVURD
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1I4QTY2NTk3IGlzIG5vdCBzZXQKQ09ORklHX1VT
Ql9SRU5FU0FTX1VTQkhTX1VEQz1tCkNPTkZJR19VU0JfUkVORVNBU19VU0IzPW0KIyBDT05G
SUdfVVNCX1BYQTI3WCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9NVl9VREMgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfTVZfVTNEIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9TTlBfQ09SRT15
CkNPTkZJR19VU0JfU05QX1VEQ19QTEFUPXkKIyBDT05GSUdfVVNCX002NjU5MiBpcyBub3Qg
c2V0CkNPTkZJR19VU0JfQkRDX1VEQz15CiMgQ09ORklHX1VTQl9BTUQ1NTM2VURDIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX05FVDIyNzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVU
MjI4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HT0tVIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX0VHMjBUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dBREdFVF9YSUxJTlggaXMgbm90
IHNldAojIENPTkZJR19VU0JfTUFYMzQyMF9VREMgaXMgbm90IHNldApDT05GSUdfVVNCX1RF
R1JBX1hVREM9bQojIENPTkZJR19VU0JfRFVNTVlfSENEIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
VVNCIFBlcmlwaGVyYWwgQ29udHJvbGxlcgoKQ09ORklHX1VTQl9MSUJDT01QT1NJVEU9bQpD
T05GSUdfVVNCX0ZfQUNNPW0KQ09ORklHX1VTQl9VX1NFUklBTD1tCkNPTkZJR19VU0JfVV9F
VEhFUj1tCkNPTkZJR19VU0JfRl9TRVJJQUw9bQpDT05GSUdfVVNCX0ZfT0JFWD1tCkNPTkZJ
R19VU0JfRl9OQ009bQpDT05GSUdfVVNCX0ZfRUNNPW0KQ09ORklHX1VTQl9GX0VFTT1tCkNP
TkZJR19VU0JfRl9TVUJTRVQ9bQpDT05GSUdfVVNCX0ZfUk5ESVM9bQpDT05GSUdfVVNCX0Zf
TUFTU19TVE9SQUdFPW0KQ09ORklHX1VTQl9GX0ZTPW0KQ09ORklHX1VTQl9DT05GSUdGUz1t
CkNPTkZJR19VU0JfQ09ORklHRlNfU0VSSUFMPXkKQ09ORklHX1VTQl9DT05GSUdGU19BQ009
eQpDT05GSUdfVVNCX0NPTkZJR0ZTX09CRVg9eQpDT05GSUdfVVNCX0NPTkZJR0ZTX05DTT15
CkNPTkZJR19VU0JfQ09ORklHRlNfRUNNPXkKQ09ORklHX1VTQl9DT05GSUdGU19FQ01fU1VC
U0VUPXkKQ09ORklHX1VTQl9DT05GSUdGU19STkRJUz15CkNPTkZJR19VU0JfQ09ORklHRlNf
RUVNPXkKQ09ORklHX1VTQl9DT05GSUdGU19NQVNTX1NUT1JBR0U9eQojIENPTkZJR19VU0Jf
Q09ORklHRlNfRl9MQl9TUyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQ09ORklHRlNfRl9GUz15
CiMgQ09ORklHX1VTQl9DT05GSUdGU19GX1VBQzEgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
Q09ORklHRlNfRl9VQUMxX0xFR0FDWSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DT05GSUdG
U19GX1VBQzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ09ORklHRlNfRl9NSURJIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0NPTkZJR0ZTX0ZfSElEIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX0NPTkZJR0ZTX0ZfVVZDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NPTkZJR0ZTX0Zf
UFJJTlRFUiBpcyBub3Qgc2V0CgojCiMgVVNCIEdhZGdldCBwcmVjb21wb3NlZCBjb25maWd1
cmF0aW9ucwojCiMgQ09ORklHX1VTQl9aRVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0FV
RElPIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VUSCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9HX05DTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HQURHRVRGUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9GVU5DVElPTkZTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01BU1NfU1RP
UkFHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9NSURJX0dBREdFVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX1BSSU5URVIg
aXMgbm90IHNldAojIENPTkZJR19VU0JfQ0RDX0NPTVBPU0lURSBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9HX0FDTV9NUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX01VTFRJIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0dfSElEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dfREJH
UCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX1dFQkNBTSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9SQVdfR0FER0VUIGlzIG5vdCBzZXQKIyBlbmQgb2YgVVNCIEdhZGdldCBwcmVjb21w
b3NlZCBjb25maWd1cmF0aW9ucwoKQ09ORklHX1RZUEVDPW0KQ09ORklHX1RZUEVDX1RDUE09
bQpDT05GSUdfVFlQRUNfVENQQ0k9bQojIENPTkZJR19UWVBFQ19SVDE3MTFIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVFlQRUNfTVQ2MzYwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUNfVENQ
Q0lfTUFYSU0gaXMgbm90IHNldApDT05GSUdfVFlQRUNfRlVTQjMwMj1tCiMgQ09ORklHX1RZ
UEVDX1VDU0kgaXMgbm90IHNldApDT05GSUdfVFlQRUNfVFBTNjU5OFg9bQojIENPTkZJR19U
WVBFQ19BTlg3NDExIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUNfUlQxNzE5IGlzIG5vdCBz
ZXQKQ09ORklHX1RZUEVDX0hEM1NTMzIyMD1tCiMgQ09ORklHX1RZUEVDX1NUVVNCMTYwWCBp
cyBub3Qgc2V0CiMgQ09ORklHX1RZUEVDX1FDT01fUE1JQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1RZUEVDX1dVU0IzODAxIGlzIG5vdCBzZXQKCiMKIyBVU0IgVHlwZS1DIE11bHRpcGxleGVy
L0RlTXVsdGlwbGV4ZXIgU3dpdGNoIHN1cHBvcnQKIwojIENPTkZJR19UWVBFQ19NVVhfRlNB
NDQ4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1RZUEVDX01VWF9QSTNVU0IzMDUzMiBpcyBub3Qg
c2V0CiMgZW5kIG9mIFVTQiBUeXBlLUMgTXVsdGlwbGV4ZXIvRGVNdWx0aXBsZXhlciBTd2l0
Y2ggc3VwcG9ydAoKIwojIFVTQiBUeXBlLUMgQWx0ZXJuYXRlIE1vZGUgZHJpdmVycwojCiMg
Q09ORklHX1RZUEVDX0RQX0FMVE1PREUgaXMgbm90IHNldAojIGVuZCBvZiBVU0IgVHlwZS1D
IEFsdGVybmF0ZSBNb2RlIGRyaXZlcnMKCkNPTkZJR19VU0JfUk9MRV9TV0lUQ0g9eQpDT05G
SUdfTU1DPXkKQ09ORklHX1BXUlNFUV9FTU1DPXkKIyBDT05GSUdfUFdSU0VRX1NEODc4NyBp
cyBub3Qgc2V0CkNPTkZJR19QV1JTRVFfU0lNUExFPXkKQ09ORklHX01NQ19CTE9DSz15CkNP
TkZJR19NTUNfQkxPQ0tfTUlOT1JTPTMyCiMgQ09ORklHX1NESU9fVUFSVCBpcyBub3Qgc2V0
CiMgQ09ORklHX01NQ19URVNUIGlzIG5vdCBzZXQKCiMKIyBNTUMvU0QvU0RJTyBIb3N0IENv
bnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX01NQ19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJ
R19NTUNfQVJNTU1DST15CkNPTkZJR19NTUNfUUNPTV9ETUw9eQpDT05GSUdfTU1DX1NUTTMy
X1NETU1DPXkKQ09ORklHX01NQ19TREhDST15CkNPTkZJR19NTUNfU0RIQ0lfSU9fQUNDRVNT
T1JTPXkKIyBDT05GSUdfTU1DX1NESENJX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19NTUNfU0RI
Q0lfQUNQST15CkNPTkZJR19NTUNfU0RIQ0lfUExURk09eQpDT05GSUdfTU1DX1NESENJX09G
X0FSQVNBTj15CiMgQ09ORklHX01NQ19TREhDSV9PRl9BVDkxIGlzIG5vdCBzZXQKQ09ORklH
X01NQ19TREhDSV9PRl9FU0RIQz15CkNPTkZJR19NTUNfU0RIQ0lfT0ZfRFdDTVNIQz15CkNP
TkZJR19NTUNfU0RIQ0lfQ0FERU5DRT15CkNPTkZJR19NTUNfU0RIQ0lfRVNESENfSU1YPXkK
Q09ORklHX01NQ19TREhDSV9URUdSQT15CiMgQ09ORklHX01NQ19TREhDSV9TM0MgaXMgbm90
IHNldAojIENPTkZJR19NTUNfU0RIQ0lfUFhBVjMgaXMgbm90IHNldApDT05GSUdfTU1DX1NE
SENJX0ZfU0RIMzA9eQojIENPTkZJR19NTUNfU0RIQ0lfTUlMQkVBVVQgaXMgbm90IHNldApD
T05GSUdfTU1DX1NESENJX0lQUk9DPXkKQ09ORklHX01NQ19NRVNPTl9HWD15CiMgQ09ORklH
X01NQ19NRVNPTl9NWF9TRElPIGlzIG5vdCBzZXQKQ09ORklHX01NQ19TREhDSV9NU009eQoj
IENPTkZJR19NTUNfTVhDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1RJRk1fU0QgaXMgbm90
IHNldApDT05GSUdfTU1DX1NQST15CiMgQ09ORklHX01NQ19TREhDSV9TUFJEIGlzIG5vdCBz
ZXQKQ09ORklHX01NQ19UTUlPX0NPUkU9eQpDT05GSUdfTU1DX1NESEk9eQojIENPTkZJR19N
TUNfU0RISV9TWVNfRE1BQyBpcyBub3Qgc2V0CkNPTkZJR19NTUNfU0RISV9JTlRFUk5BTF9E
TUFDPXkKQ09ORklHX01NQ19VTklQSElFUj15CiMgQ09ORklHX01NQ19DQjcxMCBpcyBub3Qg
c2V0CiMgQ09ORklHX01NQ19WSUFfU0RNTUMgaXMgbm90IHNldApDT05GSUdfTU1DX0RXPXkK
Q09ORklHX01NQ19EV19QTFRGTT15CiMgQ09ORklHX01NQ19EV19CTFVFRklFTEQgaXMgbm90
IHNldApDT05GSUdfTU1DX0RXX0VYWU5PUz15CkNPTkZJR19NTUNfRFdfSEkzNzk4Q1YyMDA9
eQpDT05GSUdfTU1DX0RXX0szPXkKIyBDT05GSUdfTU1DX0RXX1BDSSBpcyBub3Qgc2V0CkNP
TkZJR19NTUNfRFdfUk9DS0NISVA9eQojIENPTkZJR19NTUNfU0hfTU1DSUYgaXMgbm90IHNl
dAojIENPTkZJR19NTUNfVlVCMzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1VTSEMgaXMg
bm90IHNldAojIENPTkZJR19NTUNfVVNESEk2Uk9MMCBpcyBub3Qgc2V0CkNPTkZJR19NTUNf
U1VOWEk9eQpDT05GSUdfTU1DX0NRSENJPXkKIyBDT05GSUdfTU1DX0hTUSBpcyBub3Qgc2V0
CiMgQ09ORklHX01NQ19UT1NISUJBX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19NTUNfQkNNMjgz
NT15CkNPTkZJR19NTUNfTVRLPXkKQ09ORklHX01NQ19TREhDSV9CUkNNU1RCPXkKQ09ORklH
X01NQ19TREhDSV9YRU5PTj15CiMgQ09ORklHX01NQ19TREhDSV9PTUFQIGlzIG5vdCBzZXQK
Q09ORklHX01NQ19TREhDSV9BTTY1ND15CkNPTkZJR19NTUNfT1dMPXkKQ09ORklHX1NDU0lf
VUZTSENEPXkKIyBDT05GSUdfU0NTSV9VRlNfQlNHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NT
SV9VRlNfSFBCIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9VRlNfSFdNT04gaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX1VGU0hDRF9QQ0kgaXMgbm90IHNldApDT05GSUdfU0NTSV9VRlNI
Q0RfUExBVEZPUk09eQojIENPTkZJR19TQ1NJX1VGU19DRE5TX1BMQVRGT1JNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9VRlNfRFdDX1RDX1BMQVRGT1JNIGlzIG5vdCBzZXQKQ09ORklH
X1NDU0lfVUZTX1FDT009bQojIENPTkZJR19TQ1NJX1VGU19NRURJQVRFSyBpcyBub3Qgc2V0
CkNPTkZJR19TQ1NJX1VGU19ISVNJPXkKQ09ORklHX1NDU0lfVUZTX1JFTkVTQVM9bQojIENP
TkZJR19TQ1NJX1VGU19USV9KNzIxRSBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJX1VGU19FWFlO
T1M9eQojIENPTkZJR19NRU1TVElDSyBpcyBub3Qgc2V0CkNPTkZJR19ORVdfTEVEUz15CkNP
TkZJR19MRURTX0NMQVNTPXkKIyBDT05GSUdfTEVEU19DTEFTU19GTEFTSCBpcyBub3Qgc2V0
CkNPTkZJR19MRURTX0NMQVNTX01VTFRJQ09MT1I9bQojIENPTkZJR19MRURTX0JSSUdIVE5F
U1NfSFdfQ0hBTkdFRCBpcyBub3Qgc2V0CgojCiMgTEVEIGRyaXZlcnMKIwojIENPTkZJR19M
RURTX0FOMzAyNTlBIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19BVzIwMTMgaXMgbm90IHNl
dAojIENPTkZJR19MRURTX0JDTTYzMjggaXMgbm90IHNldAojIENPTkZJR19MRURTX0JDTTYz
NTggaXMgbm90IHNldAojIENPTkZJR19MRURTX0NSMDAxNDExNCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfRUwxNTIwMzAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNTMwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM1MzIgaXMgbm90IHNldAojIENPTkZJR19MRURT
X0xNMzY0MiBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xNMzY5Mlg9bQojIENPTkZJR19MRURT
X01UNjMyMyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1BDQTk1MzI9bQojIENPTkZJR19MRURT
X1BDQTk1MzJfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0dQSU89eQojIENPTkZJR19M
RURTX0xQMzk0NCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFAzOTUyIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19MUDUwWFggaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQNTVYWF9D
T01NT04gaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQODg2MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfUENBOTU1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTYzWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFRFNfREFDMTI0UzA4NSBpcyBub3Qgc2V0CkNPTkZJR19MRURT
X1BXTT15CiMgQ09ORklHX0xFRFNfUkVHVUxBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVE
U19CRDI4MDIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xUMzU5MyBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFRFNfVENBNjUwNyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVExDNTkxWFgg
aXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzU1eCBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfSVMzMUZMMzE5WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfSVMzMUZMMzJYWCBpcyBu
b3Qgc2V0CgojCiMgTEVEIGRyaXZlciBmb3IgYmxpbmsoMSkgVVNCIFJHQiBMRUQgaXMgdW5k
ZXIgU3BlY2lhbCBISUQgZHJpdmVycyAoSElEX1RISU5HTSkKIwojIENPTkZJR19MRURTX0JM
SU5LTSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1NZU0NPTj15CiMgQ09ORklHX0xFRFNfTUxY
UkVHIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19TUElfQllURSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVElfTE1VX0NPTU1PTiBp
cyBub3Qgc2V0CgojCiMgRmxhc2ggYW5kIFRvcmNoIExFRCBkcml2ZXJzCiMKCiMKIyBSR0Ig
TEVEIGRyaXZlcnMKIwojIENPTkZJR19MRURTX1BXTV9NVUxUSUNPTE9SIGlzIG5vdCBzZXQK
Q09ORklHX0xFRFNfUUNPTV9MUEc9bQoKIwojIExFRCBUcmlnZ2VycwojCkNPTkZJR19MRURT
X1RSSUdHRVJTPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9USU1FUj15CiMgQ09ORklHX0xFRFNf
VFJJR0dFUl9PTkVTSE9UIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFJJR0dFUl9ESVNLPXkK
IyBDT05GSUdfTEVEU19UUklHR0VSX01URCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdH
RVJfSEVBUlRCRUFUPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVCBpcyBub3Qg
c2V0CkNPTkZJR19MRURTX1RSSUdHRVJfQ1BVPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX0FD
VElWSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0dQSU8gaXMgbm90IHNl
dApDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT049eQoKIwojIGlwdGFibGVzIHRyaWdn
ZXIgaXMgdW5kZXIgTmV0ZmlsdGVyIGNvbmZpZyAoTEVEIHRhcmdldCkKIwojIENPTkZJR19M
RURTX1RSSUdHRVJfVFJBTlNJRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VS
X0NBTUVSQSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfUEFOSUM9eQojIENPTkZJ
R19MRURTX1RSSUdHRVJfTkVUREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VS
X1BBVFRFUk4gaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfQVVESU8gaXMgbm90
IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfVFRZIGlzIG5vdCBzZXQKCiMKIyBTaW1wbGUg
TEVEIGRyaXZlcnMKIwojIENPTkZJR19BQ0NFU1NJQklMSVRZIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5GSU5JQkFORCBpcyBub3Qgc2V0CkNPTkZJR19FREFDX1NVUFBPUlQ9eQpDT05GSUdf
RURBQz15CkNPTkZJR19FREFDX0xFR0FDWV9TWVNGUz15CiMgQ09ORklHX0VEQUNfREVCVUcg
aXMgbm90IHNldApDT05GSUdfRURBQ19HSEVTPXkKIyBDT05GSUdfRURBQ19BTF9NQyBpcyBu
b3Qgc2V0CkNPTkZJR19FREFDX0xBWUVSU0NBUEU9bQojIENPTkZJR19FREFDX1RIVU5ERVJY
IGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19BTFRFUkEgaXMgbm90IHNldAojIENPTkZJR19F
REFDX1NZTk9QU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19YR0VORSBpcyBub3Qgc2V0
CiMgQ09ORklHX0VEQUNfUUNPTSBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNfRE1DNTIwIGlz
IG5vdCBzZXQKQ09ORklHX1JUQ19MSUI9eQpDT05GSUdfUlRDX0NMQVNTPXkKQ09ORklHX1JU
Q19IQ1RPU1lTPXkKQ09ORklHX1JUQ19IQ1RPU1lTX0RFVklDRT0icnRjMCIKQ09ORklHX1JU
Q19TWVNUT0hDPXkKQ09ORklHX1JUQ19TWVNUT0hDX0RFVklDRT0icnRjMCIKIyBDT05GSUdf
UlRDX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19OVk1FTT15CgojCiMgUlRDIGludGVy
ZmFjZXMKIwpDT05GSUdfUlRDX0lOVEZfU1lTRlM9eQpDT05GSUdfUlRDX0lOVEZfUFJPQz15
CkNPTkZJR19SVENfSU5URl9ERVY9eQojIENPTkZJR19SVENfSU5URl9ERVZfVUlFX0VNVUwg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1RFU1QgaXMgbm90IHNldAoKIwojIEkyQyBS
VEMgZHJpdmVycwojCiMgQ09ORklHX1JUQ19EUlZfQUJCNVpFUzMgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX0FCRU9aOSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQUJYODBY
IGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfQlJDTVNUQj15CkNPTkZJR19SVENfRFJWX0RT
MTMwNz1tCiMgQ09ORklHX1JUQ19EUlZfRFMxMzA3X0NFTlRVUlkgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX0RTMTM3NCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNjcy
IGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfSFlNODU2Mz1tCiMgQ09ORklHX1JUQ19EUlZf
TUFYNjkwMCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX01BWDc3Njg2PXkKIyBDT05GSUdf
UlRDX0RSVl9OQ1QzMDE4WSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1JLODA4PW0KIyBD
T05GSUdfUlRDX0RSVl9SUzVDMzcyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9JU0wx
MjA4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9JU0wxMjAyMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfSVNMMTIwMjYgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1gx
MjA1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTIzIGlzIG5vdCBzZXQKQ09O
RklHX1JUQ19EUlZfUENGODUwNjM9bQpDT05GSUdfUlRDX0RSVl9QQ0Y4NTM2Mz1tCiMgQ09O
RklHX1JUQ19EUlZfUENGODU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODU4
MyBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX000MVQ4MD1tCiMgQ09ORklHX1JUQ19EUlZf
TTQxVDgwX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQlEzMksgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX1MzNTM5MEEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0ZNMzEzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg4MDEwIGlzIG5vdCBzZXQK
Q09ORklHX1JUQ19EUlZfUlg4NTgxPW0KIyBDT05GSUdfUlRDX0RSVl9SWDgwMjUgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX0VNMzAyNyBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJW
X1JWMzAyOD1tCiMgQ09ORklHX1JUQ19EUlZfUlYzMDMyIGlzIG5vdCBzZXQKQ09ORklHX1JU
Q19EUlZfUlY4ODAzPW0KQ09ORklHX1JUQ19EUlZfUzVNPXkKIyBDT05GSUdfUlRDX0RSVl9T
RDMwNzggaXMgbm90IHNldAoKIwojIFNQSSBSVEMgZHJpdmVycwojCiMgQ09ORklHX1JUQ19E
UlZfTTQxVDkzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDFUOTQgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX0RTMTMwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
RFMxMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzNDMgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX0RTMTM0NyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMx
MzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NQVg2OTE2IGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9SOTcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg0NTgx
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SUzVDMzQ4IGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9NQVg2OTAyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0YyMTIz
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NQ1A3OTUgaXMgbm90IHNldApDT05GSUdf
UlRDX0kyQ19BTkRfU1BJPXkKCiMKIyBTUEkgYW5kIEkyQyBSVEMgZHJpdmVycwojCkNPTkZJ
R19SVENfRFJWX0RTMzIzMj15CkNPTkZJR19SVENfRFJWX0RTMzIzMl9IV01PTj15CkNPTkZJ
R19SVENfRFJWX1BDRjIxMjc9bQojIENPTkZJR19SVENfRFJWX1JWMzAyOUMyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9SWDYxMTAgaXMgbm90IHNldAoKIwojIFBsYXRmb3JtIFJU
QyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9EUzEyODYgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX0RTMTUxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNTUzIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE2ODVfRkFNSUxZIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9EUzE3NDIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMjQw
NCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0VGST15CiMgQ09ORklHX1JUQ19EUlZfU1RL
MTdUQTggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000OFQ4NiBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfTTQ4VDM1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDhU
NTkgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01TTTYyNDIgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX0JRNDgwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlA1QzAx
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9WMzAyMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfT1BURUUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1pZTlFNUCBpcyBu
b3Qgc2V0CkNPTkZJR19SVENfRFJWX0NST1NfRUM9eQoKIwojIG9uLUNQVSBSVEMgZHJpdmVy
cwojCiMgQ09ORklHX1JUQ19EUlZfSU1YREkgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9G
U0xfRlRNX0FMQVJNPW0KQ09ORklHX1JUQ19EUlZfTUVTT05fVlJUQz1tCkNPTkZJR19SVENf
RFJWX1MzQz15CiMgQ09ORklHX1JUQ19EUlZfU0ggaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX1BMMDMwIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfUEwwMzE9eQpDT05GSUdfUlRD
X0RSVl9TVU42ST15CiMgQ09ORklHX1JUQ19EUlZfTVYgaXMgbm90IHNldApDT05GSUdfUlRD
X0RSVl9BUk1BREEzOFg9eQojIENPTkZJR19SVENfRFJWX0NBREVOQ0UgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX0ZUUlRDMDEwIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfUE04
WFhYPW0KQ09ORklHX1JUQ19EUlZfVEVHUkE9eQojIENPTkZJR19SVENfRFJWX01YQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTVhDX1YyIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19E
UlZfU05WUz1tCkNPTkZJR19SVENfRFJWX0lNWF9TQz1tCiMgQ09ORklHX1JUQ19EUlZfTVQy
NzEyIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfTVQ2Mzk3PW0KIyBDT05GSUdfUlRDX0RS
Vl9NVDc2MjIgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9YR0VORT15CiMgQ09ORklHX1JU
Q19EUlZfUjczMDEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1RJX0szIGlzIG5vdCBz
ZXQKCiMKIyBISUQgU2Vuc29yIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9HT0xE
RklTSCBpcyBub3Qgc2V0CkNPTkZJR19ETUFERVZJQ0VTPXkKIyBDT05GSUdfRE1BREVWSUNF
U19ERUJVRyBpcyBub3Qgc2V0CgojCiMgRE1BIERldmljZXMKIwpDT05GSUdfQVNZTkNfVFhf
RU5BQkxFX0NIQU5ORUxfU1dJVENIPXkKQ09ORklHX0RNQV9FTkdJTkU9eQpDT05GSUdfRE1B
X1ZJUlRVQUxfQ0hBTk5FTFM9eQpDT05GSUdfRE1BX0FDUEk9eQpDT05GSUdfRE1BX09GPXkK
IyBDT05GSUdfQUxURVJBX01TR0RNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FNQkFfUEwwOFgg
aXMgbm90IHNldApDT05GSUdfQVBQTEVfQURNQUM9eQojIENPTkZJR19BWElfRE1BQyBpcyBu
b3Qgc2V0CkNPTkZJR19CQ01fU0JBX1JBSUQ9bQpDT05GSUdfRE1BX0JDTTI4MzU9eQpDT05G
SUdfRE1BX1NVTjZJPW0KIyBDT05GSUdfRFdfQVhJX0RNQUMgaXMgbm90IHNldApDT05GSUdf
RlNMX0VETUE9eQojIENPTkZJR19GU0xfUURNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJU0lf
RE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1YX0RNQSBpcyBub3Qgc2V0CkNPTkZJR19JTVhf
U0RNQT1tCiMgQ09ORklHX0lOVEVMX0lETUE2NCBpcyBub3Qgc2V0CkNPTkZJR19LM19ETUE9
eQpDT05GSUdfTVZfWE9SPXkKQ09ORklHX01WX1hPUl9WMj15CiMgQ09ORklHX01YU19ETUEg
aXMgbm90IHNldApDT05GSUdfTVgzX0lQVT15CkNPTkZJR19NWDNfSVBVX0lSUVM9NApDT05G
SUdfT1dMX0RNQT15CkNPTkZJR19QTDMzMF9ETUE9eQojIENPTkZJR19QTFhfRE1BIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1BSRF9ETUEgaXMgbm90IHNldApDT05GSUdfVEVHUkExODZfR1BD
X0RNQT15CkNPTkZJR19URUdSQTIwX0FQQl9ETUE9eQpDT05GSUdfVEVHUkEyMTBfQURNQT1t
CiMgQ09ORklHX1VOSVBISUVSX01ETUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfVU5JUEhJRVJf
WERNQUMgaXMgbm90IHNldAojIENPTkZJR19YR0VORV9ETUEgaXMgbm90IHNldAojIENPTkZJ
R19YSUxJTlhfRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX1pZTlFNUF9ETUEgaXMg
bm90IHNldAojIENPTkZJR19YSUxJTlhfWllOUU1QX0RQRE1BIGlzIG5vdCBzZXQKIyBDT05G
SUdfTVRLX0hTRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX0NRRE1BIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVRLX1VBUlRfQVBETUEgaXMgbm90IHNldApDT05GSUdfUUNPTV9CQU1fRE1B
PXkKQ09ORklHX1FDT01fR1BJX0RNQT1tCkNPTkZJR19RQ09NX0hJRE1BX01HTVQ9eQpDT05G
SUdfUUNPTV9ISURNQT15CiMgQ09ORklHX0RXX0RNQUMgaXMgbm90IHNldAojIENPTkZJR19E
V19ETUFDX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0RXX0VETUEgaXMgbm90IHNldAojIENP
TkZJR19EV19FRE1BX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19TRl9QRE1BIGlzIG5vdCBz
ZXQKQ09ORklHX1JFTkVTQVNfRE1BPXkKQ09ORklHX1JDQVJfRE1BQz15CkNPTkZJR19SRU5F
U0FTX1VTQl9ETUFDPW0KQ09ORklHX1JaX0RNQUM9eQpDT05GSUdfVElfSzNfVURNQT15CkNP
TkZJR19USV9LM19VRE1BX0dMVUVfTEFZRVI9eQpDT05GSUdfVElfSzNfUFNJTD15CiMgQ09O
RklHX0ZTTF9EUEFBMl9RRE1BIGlzIG5vdCBzZXQKCiMKIyBETUEgQ2xpZW50cwojCiMgQ09O
RklHX0FTWU5DX1RYX0RNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQVRFU1QgaXMgbm90IHNl
dApDT05GSUdfRE1BX0VOR0lORV9SQUlEPXkKCiMKIyBETUFCVUYgb3B0aW9ucwojCkNPTkZJ
R19TWU5DX0ZJTEU9eQojIENPTkZJR19TV19TWU5DIGlzIG5vdCBzZXQKIyBDT05GSUdfVURN
QUJVRiBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQUJVRl9NT1ZFX05PVElGWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNQUJVRl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQUJVRl9TRUxG
VEVTVFMgaXMgbm90IHNldAojIENPTkZJR19ETUFCVUZfSEVBUFMgaXMgbm90IHNldAojIENP
TkZJR19ETUFCVUZfU1lTRlNfU1RBVFMgaXMgbm90IHNldAojIGVuZCBvZiBETUFCVUYgb3B0
aW9ucwoKIyBDT05GSUdfQVVYRElTUExBWSBpcyBub3Qgc2V0CiMgQ09ORklHX1VJTyBpcyBu
b3Qgc2V0CkNPTkZJR19WRklPPXkKQ09ORklHX1ZGSU9fSU9NTVVfVFlQRTE9eQpDT05GSUdf
VkZJT19WSVJRRkQ9eQojIENPTkZJR19WRklPX05PSU9NTVUgaXMgbm90IHNldApDT05GSUdf
VkZJT19QQ0lfQ09SRT15CkNPTkZJR19WRklPX1BDSV9NTUFQPXkKQ09ORklHX1ZGSU9fUENJ
X0lOVFg9eQpDT05GSUdfVkZJT19QQ0k9eQojIENPTkZJR19NTFg1X1ZGSU9fUENJIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElTSV9BQ0NfVkZJT19QQ0kgaXMgbm90IHNldAojIENPTkZJR19W
RklPX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfVkZJT19NREVWIGlzIG5vdCBzZXQK
IyBDT05GSUdfVkZJT19GU0xfTUMgaXMgbm90IHNldAojIENPTkZJR19WSVJUX0RSSVZFUlMg
aXMgbm90IHNldApDT05GSUdfVklSVElPX0FOQ0hPUj15CkNPTkZJR19WSVJUSU89eQpDT05G
SUdfVklSVElPX1BDSV9MSUI9eQpDT05GSUdfVklSVElPX1BDSV9MSUJfTEVHQUNZPXkKQ09O
RklHX1ZJUlRJT19NRU5VPXkKQ09ORklHX1ZJUlRJT19QQ0k9eQpDT05GSUdfVklSVElPX1BD
SV9MRUdBQ1k9eQpDT05GSUdfVklSVElPX0JBTExPT049eQojIENPTkZJR19WSVJUSU9fTUVN
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElPX0lOUFVUIGlzIG5vdCBzZXQKQ09ORklHX1ZJ
UlRJT19NTUlPPXkKIyBDT05GSUdfVklSVElPX01NSU9fQ01ETElORV9ERVZJQ0VTIGlzIG5v
dCBzZXQKIyBDT05GSUdfVkRQQSBpcyBub3Qgc2V0CkNPTkZJR19WSE9TVF9NRU5VPXkKIyBD
T05GSUdfVkhPU1RfTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfVkhPU1RfQ1JPU1NfRU5ESUFO
X0xFR0FDWSBpcyBub3Qgc2V0CgojCiMgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vlc3Qgc3VwcG9y
dAojCiMgQ09ORklHX0hZUEVSViBpcyBub3Qgc2V0CiMgZW5kIG9mIE1pY3Jvc29mdCBIeXBl
ci1WIGd1ZXN0IHN1cHBvcnQKCiMKIyBYZW4gZHJpdmVyIHN1cHBvcnQKIwpDT05GSUdfWEVO
X0JBTExPT049eQpDT05GSUdfWEVOX0JBTExPT05fTUVNT1JZX0hPVFBMVUc9eQpDT05GSUdf
WEVOX1NDUlVCX1BBR0VTX0RFRkFVTFQ9eQpDT05GSUdfWEVOX0RFVl9FVlRDSE49eQpDT05G
SUdfWEVOX0JBQ0tFTkQ9eQpDT05GSUdfWEVORlM9eQpDT05GSUdfWEVOX0NPTVBBVF9YRU5G
Uz15CkNPTkZJR19YRU5fU1lTX0hZUEVSVklTT1I9eQpDT05GSUdfWEVOX1hFTkJVU19GUk9O
VEVORD15CkNPTkZJR19YRU5fR05UREVWPXkKQ09ORklHX1hFTl9HUkFOVF9ERVZfQUxMT0M9
eQojIENPTkZJR19YRU5fR1JBTlRfRE1BX0FMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1NXSU9U
TEJfWEVOPXkKQ09ORklHX1hFTl9QQ0lfU1RVQj15CkNPTkZJR19YRU5fUENJREVWX1NUVUI9
bQojIENPTkZJR19YRU5fUFZDQUxMU19GUk9OVEVORCBpcyBub3Qgc2V0CiMgQ09ORklHX1hF
Tl9QVkNBTExTX0JBQ0tFTkQgaXMgbm90IHNldApDT05GSUdfWEVOX1BSSVZDTUQ9eQpDT05G
SUdfWEVOX0VGST15CkNPTkZJR19YRU5fQVVUT19YTEFURT15CiMgQ09ORklHX1hFTl9WSVJU
SU8gaXMgbm90IHNldAojIGVuZCBvZiBYZW4gZHJpdmVyIHN1cHBvcnQKCiMgQ09ORklHX0dS
RVlCVVMgaXMgbm90IHNldAojIENPTkZJR19DT01FREkgaXMgbm90IHNldApDT05GSUdfU1RB
R0lORz15CiMgQ09ORklHX1BSSVNNMl9VU0IgaXMgbm90IHNldAojIENPTkZJR19SVEw4MTky
VSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTExJQiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDg3
MjNCUyBpcyBub3Qgc2V0CiMgQ09ORklHX1I4NzEyVSBpcyBub3Qgc2V0CiMgQ09ORklHX1I4
MTg4RVUgaXMgbm90IHNldAojIENPTkZJR19SVFM1MjA4IGlzIG5vdCBzZXQKIyBDT05GSUdf
VlQ2NjU1IGlzIG5vdCBzZXQKIyBDT05GSUdfVlQ2NjU2IGlzIG5vdCBzZXQKCiMKIyBJSU8g
c3RhZ2luZyBkcml2ZXJzCiMKCiMKIyBBY2NlbGVyb21ldGVycwojCiMgQ09ORklHX0FESVMx
NjIwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0FESVMxNjI0MCBpcyBub3Qgc2V0CiMgZW5kIG9m
IEFjY2VsZXJvbWV0ZXJzCgojCiMgQW5hbG9nIHRvIGRpZ2l0YWwgY29udmVydGVycwojCiMg
Q09ORklHX0FENzgxNiBpcyBub3Qgc2V0CiMgZW5kIG9mIEFuYWxvZyB0byBkaWdpdGFsIGNv
bnZlcnRlcnMKCiMKIyBBbmFsb2cgZGlnaXRhbCBiaS1kaXJlY3Rpb24gY29udmVydGVycwoj
CiMgQ09ORklHX0FEVDczMTYgaXMgbm90IHNldAojIGVuZCBvZiBBbmFsb2cgZGlnaXRhbCBi
aS1kaXJlY3Rpb24gY29udmVydGVycwoKIwojIERpcmVjdCBEaWdpdGFsIFN5bnRoZXNpcwoj
CiMgQ09ORklHX0FEOTgzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FEOTgzNCBpcyBub3Qgc2V0
CiMgZW5kIG9mIERpcmVjdCBEaWdpdGFsIFN5bnRoZXNpcwoKIwojIE5ldHdvcmsgQW5hbHl6
ZXIsIEltcGVkYW5jZSBDb252ZXJ0ZXJzCiMKIyBDT05GSUdfQUQ1OTMzIGlzIG5vdCBzZXQK
IyBlbmQgb2YgTmV0d29yayBBbmFseXplciwgSW1wZWRhbmNlIENvbnZlcnRlcnMKCiMKIyBB
Y3RpdmUgZW5lcmd5IG1ldGVyaW5nIElDCiMKIyBDT05GSUdfQURFNzg1NCBpcyBub3Qgc2V0
CiMgZW5kIG9mIEFjdGl2ZSBlbmVyZ3kgbWV0ZXJpbmcgSUMKCiMKIyBSZXNvbHZlciB0byBk
aWdpdGFsIGNvbnZlcnRlcnMKIwojIENPTkZJR19BRDJTMTIxMCBpcyBub3Qgc2V0CiMgZW5k
IG9mIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojIGVuZCBvZiBJSU8gc3RhZ2lu
ZyBkcml2ZXJzCgojIENPTkZJR19GQl9TTTc1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9F
TVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX05WRUMgaXMgbm90IHNldApDT05GSUdfU1RB
R0lOR19NRURJQT15CkNPTkZJR19WSURFT19JTVhfTUVESUE9bQoKIwojIGkuTVg1LzYvNy84
IE1lZGlhIFN1YiBkZXZpY2VzCiMKQ09ORklHX1ZJREVPX0lNWDdfQ1NJPW0KIyBlbmQgb2Yg
aS5NWDUvNi83LzggTWVkaWEgU3ViIGRldmljZXMKCkNPTkZJR19WSURFT19NQVg5NjcxMj1t
CiMgQ09ORklHX1ZJREVPX01FU09OX1ZERUMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19S
T0NLQ0hJUF9WREVDIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fU1VOWEkgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19URUdSQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUdJTkdfTUVE
SUFfREVQUkVDQVRFRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUdJTkdfQk9BUkQgaXMgbm90
IHNldAojIENPTkZJR19MVEVfR0RNNzI0WCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RGVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0tTNzAxMCBpcyBub3Qgc2V0CkNPTkZJR19CQ01fVklERU9D
T1JFPXkKIyBDT05GSUdfQkNNMjgzNV9WQ0hJUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9C
Q00yODM1IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQkNNMjgzNSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BJNDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMX0FYSVNfRklGTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZJRUxEQlVTX0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX1FMR0UgaXMg
bm90IHNldAojIENPTkZJR19WTUVfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfR09MREZJU0gg
aXMgbm90IHNldApDT05GSUdfQ0hST01FX1BMQVRGT1JNUz15CiMgQ09ORklHX0NIUk9NRU9T
X0FDUEkgaXMgbm90IHNldAojIENPTkZJR19DSFJPTUVPU19UQk1DIGlzIG5vdCBzZXQKQ09O
RklHX0NST1NfRUM9eQpDT05GSUdfQ1JPU19FQ19JMkM9eQojIENPTkZJR19DUk9TX0VDX1JQ
TVNHIGlzIG5vdCBzZXQKQ09ORklHX0NST1NfRUNfU1BJPXkKQ09ORklHX0NST1NfRUNfUFJP
VE89eQojIENPTkZJR19DUk9TX0tCRF9MRURfQkFDS0xJR0hUIGlzIG5vdCBzZXQKQ09ORklH
X0NST1NfRUNfQ0hBUkRFVj1tCkNPTkZJR19DUk9TX0VDX0xJR0hUQkFSPXkKQ09ORklHX0NS
T1NfRUNfVkJDPXkKQ09ORklHX0NST1NfRUNfREVCVUdGUz15CkNPTkZJR19DUk9TX0VDX1NF
TlNPUkhVQj15CkNPTkZJR19DUk9TX0VDX1NZU0ZTPXkKQ09ORklHX0NST1NfRUNfVFlQRUM9
bQpDT05GSUdfQ1JPU19VU0JQRF9OT1RJRlk9eQojIENPTkZJR19DSFJPTUVPU19QUklWQUNZ
X1NDUkVFTiBpcyBub3Qgc2V0CkNPTkZJR19DUk9TX1RZUEVDX1NXSVRDSD1tCiMgQ09ORklH
X01FTExBTk9YX1BMQVRGT1JNIGlzIG5vdCBzZXQKQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1T
PXkKIyBDT05GSUdfU1VSRkFDRV8zX1BPV0VSX09QUkVHSU9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1VSRkFDRV9HUEUgaXMgbm90IHNldAojIENPTkZJR19TVVJGQUNFX0hPVFBMVUcgaXMg
bm90IHNldAojIENPTkZJR19TVVJGQUNFX1BSTzNfQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1VSRkFDRV9BR0dSRUdBVE9SIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQ0xLPXkKQ09O
RklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpDT05GSUdfQ09NTU9OX0NMSz15CgojCiMgQ2xvY2sg
ZHJpdmVyIGZvciBBUk0gUmVmZXJlbmNlIGRlc2lnbnMKIwojIENPTkZJR19DTEtfSUNTVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NMS19TUDgxMCBpcyBub3Qgc2V0CkNPTkZJR19DTEtfVkVY
UFJFU1NfT1NDPXkKIyBlbmQgb2YgQ2xvY2sgZHJpdmVyIGZvciBBUk0gUmVmZXJlbmNlIGRl
c2lnbnMKCiMgQ09ORklHX0xNSzA0ODMyIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtf
QVBQTEVfTkNPPXkKIyBDT05GSUdfQ09NTU9OX0NMS19NQVg3NzY4NiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NPTU1PTl9DTEtfTUFYOTQ4NSBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xL
X1JLODA4PXkKQ09ORklHX0NPTU1PTl9DTEtfSEk2NTVYPXkKQ09ORklHX0NPTU1PTl9DTEtf
U0NNST15CkNPTkZJR19DT01NT05fQ0xLX1NDUEk9eQojIENPTkZJR19DT01NT05fQ0xLX1NJ
NTM0MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1MzUxIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19TSTUxNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9D
TEtfU0k1NDQgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJNTcwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ09NTU9OX0NMS19DRENFNzA2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09N
TU9OX0NMS19DRENFOTI1IGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtfQ1MyMDAwX0NQ
PXkKQ09ORklHX0NPTU1PTl9DTEtfRlNMX0ZMRVhTUEk9eQpDT05GSUdfQ09NTU9OX0NMS19G
U0xfU0FJPXkKQ09ORklHX0NPTU1PTl9DTEtfUzJNUFMxMT15CiMgQ09ORklHX0NPTU1PTl9D
TEtfQVhJX0NMS0dFTiBpcyBub3Qgc2V0CkNPTkZJR19DTEtfUU9SSVE9eQpDT05GSUdfQ0xL
X0xTMTAyOEFfUExMRElHPXkKQ09ORklHX0NPTU1PTl9DTEtfWEdFTkU9eQpDT05GSUdfQ09N
TU9OX0NMS19QV009eQojIENPTkZJR19DT01NT05fQ0xLX1JTOV9QQ0lFIGlzIG5vdCBzZXQK
Q09ORklHX0NPTU1PTl9DTEtfVkM1PXkKIyBDT05GSUdfQ09NTU9OX0NMS19WQzcgaXMgbm90
IHNldApDT05GSUdfQ09NTU9OX0NMS19CRDcxOFhYPW0KIyBDT05GSUdfQ09NTU9OX0NMS19G
SVhFRF9NTUlPIGlzIG5vdCBzZXQKQ09ORklHX0NMS19BQ1RJT05TPXkKQ09ORklHX0NMS19P
V0xfUzUwMD15CkNPTkZJR19DTEtfT1dMX1M3MDA9eQpDT05GSUdfQ0xLX09XTF9TOTAwPXkK
Q09ORklHX0NMS19CQ00yNzExX0RWUD15CkNPTkZJR19DTEtfQkNNMjgzNT15CkNPTkZJR19D
TEtfQkNNXzYzWFg9eQpDT05GSUdfQ09NTU9OX0NMS19JUFJPQz15CkNPTkZJR19DTEtfQkNN
X05TMj15CkNPTkZJR19DTEtfQkNNX1NSPXkKQ09ORklHX0NMS19SQVNQQkVSUllQST1tCkNP
TkZJR19DT01NT05fQ0xLX0hJMzUxNkNWMzAwPXkKQ09ORklHX0NPTU1PTl9DTEtfSEkzNTE5
PXkKQ09ORklHX0NPTU1PTl9DTEtfSEkzNTU5QT15CkNPTkZJR19DT01NT05fQ0xLX0hJMzY2
MD15CkNPTkZJR19DT01NT05fQ0xLX0hJMzY3MD15CkNPTkZJR19DT01NT05fQ0xLX0hJMzc5
OENWMjAwPXkKQ09ORklHX0NPTU1PTl9DTEtfSEk2MjIwPXkKQ09ORklHX1JFU0VUX0hJU0k9
eQpDT05GSUdfU1RVQl9DTEtfSEk2MjIwPXkKQ09ORklHX1NUVUJfQ0xLX0hJMzY2MD15CkNP
TkZJR19NWENfQ0xLPXkKQ09ORklHX01YQ19DTEtfU0NVPXkKQ09ORklHX0NMS19JTVg4TU09
eQpDT05GSUdfQ0xLX0lNWDhNTj15CkNPTkZJR19DTEtfSU1YOE1QPXkKQ09ORklHX0NMS19J
TVg4TVE9eQpDT05GSUdfQ0xLX0lNWDhRWFA9eQpDT05GSUdfQ0xLX0lNWDhVTFA9eQpDT05G
SUdfQ0xLX0lNWDkzPXkKQ09ORklHX1RJX1NDSV9DTEs9eQojIENPTkZJR19USV9TQ0lfQ0xL
X1BST0JFX0ZST01fRlcgaXMgbm90IHNldApDT05GSUdfVElfU1lTQ09OX0NMSz15CgojCiMg
Q2xvY2sgZHJpdmVyIGZvciBNZWRpYVRlayBTb0MKIwpDT05GSUdfQ09NTU9OX0NMS19NRURJ
QVRFSz15CkNPTkZJR19DT01NT05fQ0xLX01UMjcxMj15CiMgQ09ORklHX0NPTU1PTl9DTEtf
TVQyNzEyX0JEUFNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQyNzEyX0lN
R1NZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQyNzEyX0pQR0RFQ1NZUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQyNzEyX01GR0NGRyBpcyBub3Qgc2V0
CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQyNzEyX01NU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09NTU9OX0NMS19NVDI3MTJfVkRFQ1NZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9D
TEtfTVQyNzEyX1ZFTkNTWVMgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19NVDY3NjU9
eQojIENPTkZJR19DT01NT05fQ0xLX01UNjc2NV9BVURJT1NZUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTU1PTl9DTEtfTVQ2NzY1X0NBTVNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1P
Tl9DTEtfTVQ2NzY1X0dDRVNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ2
NzY1X01NU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3NjVfSU1HU1lT
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3NjVfVkNPREVDU1lTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3NjVfTUZHU1lTIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ09NTU9OX0NMS19NVDY3NjVfTUlQSTBBU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09NTU9OX0NMS19NVDY3NjVfTUlQSTBCU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9O
X0NMS19NVDY3NjVfTUlQSTFBU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19N
VDY3NjVfTUlQSTFCU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3NjVf
TUlQSTJBU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3NjVfTUlQSTJC
U1lTIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtfTVQ2Nzc5PXkKIyBDT05GSUdfQ09N
TU9OX0NMS19NVDY3NzlfTU1TWVMgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01U
Njc3OV9JTUdTWVMgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UNjc3OV9JUEVT
WVMgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UNjc3OV9DQU1TWVMgaXMgbm90
IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UNjc3OV9WREVDU1lTIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ09NTU9OX0NMS19NVDY3NzlfVkVOQ1NZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfTVQ2Nzc5X01GR0NGRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtf
TVQ2Nzc5X0FVRFNZUyBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX01UNjc5NT15CkNP
TkZJR19DT01NT05fQ0xLX01UNjc5NV9NRkdDRkc9eQpDT05GSUdfQ09NTU9OX0NMS19NVDY3
OTVfTU1TWVM9eQpDT05GSUdfQ09NTU9OX0NMS19NVDY3OTVfVkRFQ1NZUz15CkNPTkZJR19D
T01NT05fQ0xLX01UNjc5NV9WRU5DU1lTPXkKQ09ORklHX0NPTU1PTl9DTEtfTVQ2Nzk3PXkK
IyBDT05GSUdfQ09NTU9OX0NMS19NVDY3OTdfTU1TWVMgaXMgbm90IHNldAojIENPTkZJR19D
T01NT05fQ0xLX01UNjc5N19JTUdTWVMgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xL
X01UNjc5N19WREVDU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3OTdf
VkVOQ1NZUyBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX01UNzYyMj15CiMgQ09ORklH
X0NPTU1PTl9DTEtfTVQ3NjIyX0VUSFNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9D
TEtfTVQ3NjIyX0hJRlNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ3NjIy
X0FVRFNZUyBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX01UNzk4Nj15CkNPTkZJR19D
T01NT05fQ0xLX01UNzk4Nl9FVEhTWVM9eQpDT05GSUdfQ09NTU9OX0NMS19NVDgxNjc9eQpD
T05GSUdfQ09NTU9OX0NMS19NVDgxNjdfQVVEU1lTPXkKQ09ORklHX0NPTU1PTl9DTEtfTVQ4
MTY3X0lNR1NZUz15CkNPTkZJR19DT01NT05fQ0xLX01UODE2N19NRkdDRkc9eQpDT05GSUdf
Q09NTU9OX0NMS19NVDgxNjdfTU1TWVM9eQpDT05GSUdfQ09NTU9OX0NMS19NVDgxNjdfVkRF
Q1NZUz15CkNPTkZJR19DT01NT05fQ0xLX01UODE3Mz15CkNPTkZJR19DT01NT05fQ0xLX01U
ODE3M19NTVNZUz15CkNPTkZJR19DT01NT05fQ0xLX01UODE4Mz15CkNPTkZJR19DT01NT05f
Q0xLX01UODE4M19BVURJT1NZUz15CkNPTkZJR19DT01NT05fQ0xLX01UODE4M19DQU1TWVM9
eQpDT05GSUdfQ09NTU9OX0NMS19NVDgxODNfSU1HU1lTPXkKQ09ORklHX0NPTU1PTl9DTEtf
TVQ4MTgzX0lQVV9DT1JFMD15CkNPTkZJR19DT01NT05fQ0xLX01UODE4M19JUFVfQ09SRTE9
eQpDT05GSUdfQ09NTU9OX0NMS19NVDgxODNfSVBVX0FETD15CkNPTkZJR19DT01NT05fQ0xL
X01UODE4M19JUFVfQ09OTj15CkNPTkZJR19DT01NT05fQ0xLX01UODE4M19NRkdDRkc9eQpD
T05GSUdfQ09NTU9OX0NMS19NVDgxODNfTU1TWVM9eQpDT05GSUdfQ09NTU9OX0NMS19NVDgx
ODNfVkRFQ1NZUz15CkNPTkZJR19DT01NT05fQ0xLX01UODE4M19WRU5DU1lTPXkKQ09ORklH
X0NPTU1PTl9DTEtfTVQ4MTg2PXkKQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTkyPXkKIyBDT05G
SUdfQ09NTU9OX0NMS19NVDgxOTJfQVVEU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9O
X0NMS19NVDgxOTJfQ0FNU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgx
OTJfSU1HU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfSU1QX0lJ
Q19XUkFQIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfSVBFU1lTIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfTURQU1lTIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfTUZHQ0ZHIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09NTU9OX0NMS19NVDgxOTJfTU1TWVMgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xL
X01UODE5Ml9NU0RDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfU0NQ
X0FEU1AgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UODE5Ml9WREVDU1lTIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfVkVOQ1NZUyBpcyBub3Qgc2V0
CkNPTkZJR19DT01NT05fQ0xLX01UODE5NT15CkNPTkZJR19DT01NT05fQ0xLX01UODM2NT15
CkNPTkZJR19DT01NT05fQ0xLX01UODM2NV9BUFU9eQpDT05GSUdfQ09NTU9OX0NMS19NVDgz
NjVfQ0FNPXkKQ09ORklHX0NPTU1PTl9DTEtfTVQ4MzY1X01GRz15CkNPTkZJR19DT01NT05f
Q0xLX01UODM2NV9NTVNZUz15CkNPTkZJR19DT01NT05fQ0xLX01UODM2NV9WREVDPXkKQ09O
RklHX0NPTU1PTl9DTEtfTVQ4MzY1X1ZFTkM9eQpDT05GSUdfQ09NTU9OX0NMS19NVDg1MTY9
eQojIENPTkZJR19DT01NT05fQ0xLX01UODUxNl9BVURTWVMgaXMgbm90IHNldAojIGVuZCBv
ZiBDbG9jayBkcml2ZXIgZm9yIE1lZGlhVGVrIFNvQwoKIwojIENsb2NrIHN1cHBvcnQgZm9y
IEFtbG9naWMgcGxhdGZvcm1zCiMKQ09ORklHX0NPTU1PTl9DTEtfTUVTT05fUkVHTUFQPXkK
Q09ORklHX0NPTU1PTl9DTEtfTUVTT05fRFVBTERJVj15CkNPTkZJR19DT01NT05fQ0xLX01F
U09OX01QTEw9eQpDT05GSUdfQ09NTU9OX0NMS19NRVNPTl9QSEFTRT1tCkNPTkZJR19DT01N
T05fQ0xLX01FU09OX1BMTD15CkNPTkZJR19DT01NT05fQ0xLX01FU09OX1NDTEtfRElWPW0K
Q09ORklHX0NPTU1PTl9DTEtfTUVTT05fVklEX1BMTF9ESVY9eQpDT05GSUdfQ09NTU9OX0NM
S19NRVNPTl9BT19DTEtDPXkKQ09ORklHX0NPTU1PTl9DTEtfTUVTT05fRUVfQ0xLQz15CkNP
TkZJR19DT01NT05fQ0xLX01FU09OX0NQVV9EWU5ESVY9eQpDT05GSUdfQ09NTU9OX0NMS19H
WEJCPXkKQ09ORklHX0NPTU1PTl9DTEtfQVhHPXkKQ09ORklHX0NPTU1PTl9DTEtfQVhHX0FV
RElPPW0KQ09ORklHX0NPTU1PTl9DTEtfRzEyQT15CiMgZW5kIG9mIENsb2NrIHN1cHBvcnQg
Zm9yIEFtbG9naWMgcGxhdGZvcm1zCgpDT05GSUdfQVJNQURBX0FQX0NQX0hFTFBFUj15CkNP
TkZJR19BUk1BREFfMzdYWF9DTEs9eQpDT05GSUdfQVJNQURBX0FQODA2X1NZU0NPTj15CkNP
TkZJR19BUk1BREFfQ1AxMTBfU1lTQ09OPXkKQ09ORklHX1FDT01fR0RTQz15CkNPTkZJR19R
Q09NX1JQTUNDPXkKQ09ORklHX0NPTU1PTl9DTEtfUUNPTT15CkNPTkZJR19RQ09NX0E1M1BM
TD15CiMgQ09ORklHX1FDT01fQTdQTEwgaXMgbm90IHNldApDT05GSUdfUUNPTV9DTEtfQVBD
U19NU004OTE2PXkKQ09ORklHX1FDT01fQ0xLX0FQQ0NfTVNNODk5Nj15CiMgQ09ORklHX1FD
T01fQ0xLX0FQQ1NfU0RYNTUgaXMgbm90IHNldApDT05GSUdfUUNPTV9DTEtfU01EX1JQTT15
CkNPTkZJR19RQ09NX0NMS19SUE1IPXkKIyBDT05GSUdfQVBRX0dDQ184MDg0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVBRX01NQ0NfODA4NCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQUV9BUFNT
X1BMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQUV9BUFNTXzYwMTggaXMgbm90IHNldAojIENP
TkZJR19JUFFfR0NDXzQwMTkgaXMgbm90IHNldApDT05GSUdfSVBRX0dDQ182MDE4PXkKIyBD
T05GSUdfSVBRX0dDQ184MDZYIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBRX0xDQ184MDZYIGlz
IG5vdCBzZXQKQ09ORklHX0lQUV9HQ0NfODA3ND15CiMgQ09ORklHX01TTV9HQ0NfODY2MCBp
cyBub3Qgc2V0CiMgQ09ORklHX01TTV9HQ0NfODkwOSBpcyBub3Qgc2V0CkNPTkZJR19NU01f
R0NDXzg5MTY9eQojIENPTkZJR19NU01fR0NDXzg5MzkgaXMgbm90IHNldAojIENPTkZJR19N
U01fR0NDXzg5NjAgaXMgbm90IHNldAojIENPTkZJR19NU01fTENDXzg5NjAgaXMgbm90IHNl
dAojIENPTkZJR19NRE1fR0NDXzk2MDcgaXMgbm90IHNldAojIENPTkZJR19NRE1fR0NDXzk2
MTUgaXMgbm90IHNldAojIENPTkZJR19NRE1fTENDXzk2MTUgaXMgbm90IHNldAojIENPTkZJ
R19NU01fTU1DQ184OTYwIGlzIG5vdCBzZXQKIyBDT05GSUdfTVNNX0dDQ184OTUzIGlzIG5v
dCBzZXQKIyBDT05GSUdfTVNNX0dDQ184OTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfTVNNX01N
Q0NfODk3NCBpcyBub3Qgc2V0CiMgQ09ORklHX01TTV9HQ0NfODk3NiBpcyBub3Qgc2V0CiMg
Q09ORklHX01TTV9NTUNDXzg5OTQgaXMgbm90IHNldApDT05GSUdfTVNNX0dDQ184OTk0PXkK
Q09ORklHX01TTV9HQ0NfODk5Nj15CkNPTkZJR19NU01fTU1DQ184OTk2PXkKQ09ORklHX01T
TV9HQ0NfODk5OD15CiMgQ09ORklHX01TTV9HUFVDQ184OTk4IGlzIG5vdCBzZXQKIyBDT05G
SUdfTVNNX01NQ0NfODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX1FDTV9HQ0NfMjI5MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1FDTV9ESVNQQ0NfMjI5MCBpcyBub3Qgc2V0CkNPTkZJR19RQ1Nf
R0NDXzQwND15CiMgQ09ORklHX1NDX0NBTUNDXzcxODAgaXMgbm90IHNldAojIENPTkZJR19T
Q19DQU1DQ183MjgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NfRElTUENDXzcxODAgaXMgbm90
IHNldAojIENPTkZJR19TQ19ESVNQQ0NfNzI4MCBpcyBub3Qgc2V0CkNPTkZJR19TQ19HQ0Nf
NzE4MD15CkNPTkZJR19TQ19HQ0NfNzI4MD15CkNPTkZJR19TQ19HQ0NfODE4MFg9eQpDT05G
SUdfU0NfR0NDXzgyODBYUD15CiMgQ09ORklHX1NDX0dQVUNDXzcxODAgaXMgbm90IHNldAoj
IENPTkZJR19TQ19HUFVDQ183MjgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NfR1BVQ0NfODI4
MFhQIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NfTFBBU1NDQ183MjgwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NfTFBBU1NfQ09SRUNDXzcxODAgaXMgbm90IHNldAojIENPTkZJR19TQ19MUEFT
U19DT1JFQ0NfNzI4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDX01TU183MTgwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NfVklERU9DQ183MTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NfVklE
RU9DQ183MjgwIGlzIG5vdCBzZXQKQ09ORklHX1NETV9DQU1DQ184NDU9bQojIENPTkZJR19T
RE1fR0NDXzY2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NETV9NTUNDXzY2MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NETV9HUFVDQ182NjAgaXMgbm90IHNldAojIENPTkZJR19RQ1NfVFVSSU5H
XzQwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1FDU19RNlNTVE9QXzQwNCBpcyBub3Qgc2V0CkNP
TkZJR19TRE1fR0NDXzg0NT15CkNPTkZJR19TRE1fR1BVQ0NfODQ1PXkKQ09ORklHX1NETV9W
SURFT0NDXzg0NT15CkNPTkZJR19TRE1fRElTUENDXzg0NT15CiMgQ09ORklHX1NETV9MUEFT
U0NDXzg0NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NEWF9HQ0NfNTUgaXMgbm90IHNldAojIENP
TkZJR19TRFhfR0NDXzY1IGlzIG5vdCBzZXQKIyBDT05GSUdfU01fQ0FNQ0NfODI1MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NNX0NBTUNDXzg0NTAgaXMgbm90IHNldApDT05GSUdfU01fRElT
UENDXzgyNTA9eQojIENPTkZJR19TTV9ESVNQQ0NfODQ1MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NNX0dDQ182MTE1IGlzIG5vdCBzZXQKIyBDT05GSUdfU01fR0NDXzYxMjUgaXMgbm90IHNl
dAojIENPTkZJR19TTV9HQ0NfNjM1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NNX0dDQ182Mzc1
IGlzIG5vdCBzZXQKQ09ORklHX1NNX0dDQ184MTUwPXkKQ09ORklHX1NNX0dDQ184MjUwPXkK
Q09ORklHX1NNX0dDQ184MzUwPXkKQ09ORklHX1NNX0dDQ184NDUwPXkKIyBDT05GSUdfU01f
R1BVQ0NfNjM1MCBpcyBub3Qgc2V0CkNPTkZJR19TTV9HUFVDQ184MTUwPXkKQ09ORklHX1NN
X0dQVUNDXzgyNTA9eQojIENPTkZJR19TTV9HUFVDQ184MzUwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU01fVklERU9DQ184MTUwIGlzIG5vdCBzZXQKQ09ORklHX1NNX1ZJREVPQ0NfODI1MD15
CiMgQ09ORklHX1NQTUlfUE1JQ19DTEtESVYgaXMgbm90IHNldApDT05GSUdfUUNPTV9IRlBM
TD15CiMgQ09ORklHX0tQU1NfWENDIGlzIG5vdCBzZXQKQ09ORklHX0NMS19HRk1fTFBBU1Nf
U004MjUwPW0KQ09ORklHX0NMS19SRU5FU0FTPXkKQ09ORklHX0NMS19SOEE3NzRBMT15CkNP
TkZJR19DTEtfUjhBNzc0QjE9eQpDT05GSUdfQ0xLX1I4QTc3NEMwPXkKQ09ORklHX0NMS19S
OEE3NzRFMT15CkNPTkZJR19DTEtfUjhBNzc5NT15CkNPTkZJR19DTEtfUjhBNzc5NjA9eQpD
T05GSUdfQ0xLX1I4QTc3OTYxPXkKQ09ORklHX0NMS19SOEE3Nzk2NT15CkNPTkZJR19DTEtf
UjhBNzc5NzA9eQpDT05GSUdfQ0xLX1I4QTc3OTgwPXkKQ09ORklHX0NMS19SOEE3Nzk5MD15
CkNPTkZJR19DTEtfUjhBNzc5OTU9eQpDT05GSUdfQ0xLX1I4QTc3OUEwPXkKQ09ORklHX0NM
S19SOEE3NzlGMD15CkNPTkZJR19DTEtfUjhBNzc5RzA9eQpDT05GSUdfQ0xLX1I5QTA3RzA0
Mz15CkNPTkZJR19DTEtfUjlBMDdHMDQ0PXkKQ09ORklHX0NMS19SOUEwN0cwNTQ9eQpDT05G
SUdfQ0xLX1I5QTA5RzAxMT15CkNPTkZJR19DTEtfUkNBUl9DUEdfTElCPXkKQ09ORklHX0NM
S19SQ0FSX0dFTjNfQ1BHPXkKQ09ORklHX0NMS19SQ0FSX0dFTjRfQ1BHPXkKQ09ORklHX0NM
S19SQ0FSX1VTQjJfQ0xPQ0tfU0VMPXkKQ09ORklHX0NMS19SWkcyTD15CkNPTkZJR19DTEtf
UkVORVNBU19DUEdfTVNTUj15CkNPTkZJR19DTEtfUkVORVNBU19ESVY2PXkKQ09ORklHX0NP
TU1PTl9DTEtfUk9DS0NISVA9eQpDT05GSUdfQ0xLX1BYMzA9eQpDT05GSUdfQ0xLX1JLMzMw
OD15CkNPTkZJR19DTEtfUkszMzI4PXkKQ09ORklHX0NMS19SSzMzNjg9eQpDT05GSUdfQ0xL
X1JLMzM5OT15CkNPTkZJR19DTEtfUkszNTY4PXkKQ09ORklHX0NPTU1PTl9DTEtfU0FNU1VO
Rz15CkNPTkZJR19FWFlOT1NfQVJNNjRfQ09NTU9OX0NMSz15CkNPTkZJR19FWFlOT1NfQVVE
U1NfQ0xLX0NPTj15CkNPTkZJR19FWFlOT1NfQ0xLT1VUPXkKQ09ORklHX1RFU0xBX0ZTRF9D
T01NT05fQ0xLPXkKQ09ORklHX0NMS19JTlRFTF9TT0NGUEdBPXkKQ09ORklHX0NMS19JTlRF
TF9TT0NGUEdBNjQ9eQpDT05GSUdfU1BSRF9DT01NT05fQ0xLPXkKQ09ORklHX1NQUkRfU0M5
ODYwX0NMSz15CkNPTkZJR19TUFJEX1NDOTg2M0FfQ0xLPXkKIyBDT05GSUdfU1BSRF9VTVM1
MTJfQ0xLIGlzIG5vdCBzZXQKQ09ORklHX1NVTlhJX0NDVT15CkNPTkZJR19TVU41MElfQTY0
X0NDVT15CkNPTkZJR19TVU41MElfQTEwMF9DQ1U9eQpDT05GSUdfU1VONTBJX0ExMDBfUl9D
Q1U9eQpDT05GSUdfU1VONTBJX0g2X0NDVT15CkNPTkZJR19TVU41MElfSDYxNl9DQ1U9eQpD
T05GSUdfU1VONTBJX0g2X1JfQ0NVPXkKQ09ORklHX1NVTjZJX1JUQ19DQ1U9eQpDT05GSUdf
U1VOOElfSDNfQ0NVPXkKQ09ORklHX1NVTjhJX0RFMl9DQ1U9eQpDT05GSUdfU1VOOElfUl9D
Q1U9eQpDT05GSUdfQ0xLX1RFR1JBX0JQTVA9eQpDT05GSUdfVEVHUkFfQ0xLX0RGTEw9eQpD
T05GSUdfQ0xLX1VOSVBISUVSPXkKQ09ORklHX0NPTU1PTl9DTEtfVklTQ09OVEk9eQojIENP
TkZJR19YSUxJTlhfVkNVIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19YTE5YX0NM
S1daUkQgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19aWU5RTVA9eQpDT05GSUdfSFdT
UElOTE9DSz15CiMgQ09ORklHX0hXU1BJTkxPQ0tfT01BUCBpcyBub3Qgc2V0CkNPTkZJR19I
V1NQSU5MT0NLX1FDT009eQojIENPTkZJR19IV1NQSU5MT0NLX1NQUkQgaXMgbm90IHNldAoj
IENPTkZJR19IV1NQSU5MT0NLX1NVTjZJIGlzIG5vdCBzZXQKCiMKIyBDbG9jayBTb3VyY2Ug
ZHJpdmVycwojCkNPTkZJR19USU1FUl9PRj15CkNPTkZJR19USU1FUl9BQ1BJPXkKQ09ORklH
X1RJTUVSX1BST0JFPXkKQ09ORklHX0NMS1NSQ19NTUlPPXkKQ09ORklHX09NQVBfRE1fVElN
RVI9eQpDT05GSUdfRFdfQVBCX1RJTUVSPXkKQ09ORklHX0RXX0FQQl9USU1FUl9PRj15CkNP
TkZJR19ST0NLQ0hJUF9USU1FUj15CkNPTkZJR19PV0xfVElNRVI9eQpDT05GSUdfU1VONElf
VElNRVI9eQpDT05GSUdfVEVHUkFfVElNRVI9eQojIENPTkZJR19URUdSQTE4Nl9USU1FUiBp
cyBub3Qgc2V0CkNPTkZJR19OUENNN1hYX1RJTUVSPXkKQ09ORklHX0FSTV9BUkNIX1RJTUVS
PXkKQ09ORklHX0FSTV9BUkNIX1RJTUVSX0VWVFNUUkVBTT15CkNPTkZJR19BUk1fQVJDSF9U
SU1FUl9PT0xfV09SS0FST1VORD15CkNPTkZJR19GU0xfRVJSQVRVTV9BMDA4NTg1PXkKQ09O
RklHX0hJU0lMSUNPTl9FUlJBVFVNXzE2MTAxMDEwMT15CkNPTkZJR19BUk02NF9FUlJBVFVN
Xzg1ODkyMT15CkNPTkZJR19TVU41MElfRVJSQVRVTV9VTktOT1dOMT15CkNPTkZJR19BUk1f
VElNRVJfU1A4MDQ9eQpDT05GSUdfQ0xLU1JDX0VYWU5PU19NQ1Q9eQpDT05GSUdfU1lTX1NV
UFBPUlRTX1NIX0NNVD15CkNPTkZJR19NVEtfVElNRVI9eQpDT05GSUdfU1BSRF9USU1FUj15
CkNPTkZJR19TWVNfU1VQUE9SVFNfU0hfVE1VPXkKQ09ORklHX1NIX1RJTUVSX0NNVD15CkNP
TkZJR19SRU5FU0FTX09TVE09eQpDT05GSUdfU0hfVElNRVJfVE1VPXkKQ09ORklHX1RJTUVS
X0lNWF9TWVNfQ1RSPXkKIyBDT05GSUdfTUlDUk9DSElQX1BJVDY0QiBpcyBub3Qgc2V0CiMg
ZW5kIG9mIENsb2NrIFNvdXJjZSBkcml2ZXJzCgpDT05GSUdfTUFJTEJPWD15CkNPTkZJR19B
UFBMRV9NQUlMQk9YPXkKQ09ORklHX0FSTV9NSFU9eQojIENPTkZJR19BUk1fTUhVX1YyIGlz
IG5vdCBzZXQKQ09ORklHX0lNWF9NQk9YPXkKQ09ORklHX1BMQVRGT1JNX01IVT15CiMgQ09O
RklHX1BMMzIwX01CT1ggaXMgbm90IHNldAojIENPTkZJR19BUk1BREFfMzdYWF9SV1RNX01C
T1ggaXMgbm90IHNldAojIENPTkZJR19PTUFQMlBMVVNfTUJPWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JPQ0tDSElQX01CT1ggaXMgbm90IHNldApDT05GSUdfUENDPXkKIyBDT05GSUdfQUxU
RVJBX01CT1ggaXMgbm90IHNldApDT05GSUdfQkNNMjgzNV9NQk9YPXkKQ09ORklHX1RJX01F
U1NBR0VfTUFOQUdFUj15CkNPTkZJR19ISTM2NjBfTUJPWD15CkNPTkZJR19ISTYyMjBfTUJP
WD15CiMgQ09ORklHX01BSUxCT1hfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19RQ09NX0FQQ1Nf
SVBDPXkKQ09ORklHX1RFR1JBX0hTUF9NQk9YPXkKIyBDT05GSUdfWEdFTkVfU0xJTVBST19N
Qk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNX1BEQ19NQk9YIGlzIG5vdCBzZXQKQ09ORklH
X0JDTV9GTEVYUk1fTUJPWD1tCiMgQ09ORklHX01US19BRFNQX01CT1ggaXMgbm90IHNldAoj
IENPTkZJR19NVEtfQ01EUV9NQk9YIGlzIG5vdCBzZXQKQ09ORklHX1pZTlFNUF9JUElfTUJP
WD15CkNPTkZJR19TVU42SV9NU0dCT1g9eQojIENPTkZJR19TUFJEX01CT1ggaXMgbm90IHNl
dApDT05GSUdfUUNPTV9JUENDPXkKQ09ORklHX0lPTU1VX0lPVkE9eQpDT05GSUdfSU9NTVVf
QVBJPXkKQ09ORklHX0lPTU1VX1NVUFBPUlQ9eQoKIwojIEdlbmVyaWMgSU9NTVUgUGFnZXRh
YmxlIFN1cHBvcnQKIwpDT05GSUdfSU9NTVVfSU9fUEdUQUJMRT15CkNPTkZJR19JT01NVV9J
T19QR1RBQkxFX0xQQUU9eQojIENPTkZJR19JT01NVV9JT19QR1RBQkxFX0xQQUVfU0VMRlRF
U1QgaXMgbm90IHNldApDT05GSUdfSU9NTVVfSU9fUEdUQUJMRV9BUk1WN1M9eQojIENPTkZJ
R19JT01NVV9JT19QR1RBQkxFX0FSTVY3U19TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19J
T01NVV9JT19QR1RBQkxFX0RBUlQ9eQojIGVuZCBvZiBHZW5lcmljIElPTU1VIFBhZ2V0YWJs
ZSBTdXBwb3J0CgojIENPTkZJR19JT01NVV9ERUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0lP
TU1VX0RFRkFVTFRfRE1BX1NUUklDVD15CiMgQ09ORklHX0lPTU1VX0RFRkFVTFRfRE1BX0xB
WlkgaXMgbm90IHNldAojIENPTkZJR19JT01NVV9ERUZBVUxUX1BBU1NUSFJPVUdIIGlzIG5v
dCBzZXQKQ09ORklHX09GX0lPTU1VPXkKQ09ORklHX0lPTU1VX0RNQT15CkNPTkZJR19ST0NL
Q0hJUF9JT01NVT15CiMgQ09ORklHX1NVTjUwSV9JT01NVSBpcyBub3Qgc2V0CkNPTkZJR19U
RUdSQV9JT01NVV9TTU1VPXkKIyBDT05GSUdfRVhZTk9TX0lPTU1VIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBNTVVfVk1TQSBpcyBub3Qgc2V0CkNPTkZJR19BUFBMRV9EQVJUPXkKQ09ORklH
X0FSTV9TTU1VPXkKIyBDT05GSUdfQVJNX1NNTVVfTEVHQUNZX0RUX0JJTkRJTkdTIGlzIG5v
dCBzZXQKQ09ORklHX0FSTV9TTU1VX0RJU0FCTEVfQllQQVNTX0JZX0RFRkFVTFQ9eQpDT05G
SUdfQVJNX1NNTVVfUUNPTT15CiMgQ09ORklHX0FSTV9TTU1VX1FDT01fREVCVUcgaXMgbm90
IHNldApDT05GSUdfQVJNX1NNTVVfVjM9eQojIENPTkZJR19BUk1fU01NVV9WM19TVkEgaXMg
bm90IHNldApDT05GSUdfTVRLX0lPTU1VPXkKQ09ORklHX1FDT01fSU9NTVU9eQojIENPTkZJ
R19WSVJUSU9fSU9NTVUgaXMgbm90IHNldAojIENPTkZJR19TUFJEX0lPTU1VIGlzIG5vdCBz
ZXQKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwpDT05GSUdfUkVNT1RFUFJPQz15CiMgQ09O
RklHX1JFTU9URVBST0NfQ0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX0lNWF9SRU1PVEVQUk9D
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU1YX0RTUF9SRU1PVEVQUk9DIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVRLX1NDUCBpcyBub3Qgc2V0CkNPTkZJR19RQ09NX1BJTF9JTkZPPW0KQ09ORklH
X1FDT01fUlBST0NfQ09NTU9OPW0KQ09ORklHX1FDT01fUTZWNV9DT01NT049bQpDT05GSUdf
UUNPTV9RNlY1X0FEU1A9bQpDT05GSUdfUUNPTV9RNlY1X01TUz1tCkNPTkZJR19RQ09NX1E2
VjVfUEFTPW0KIyBDT05GSUdfUUNPTV9RNlY1X1dDU1MgaXMgbm90IHNldApDT05GSUdfUUNP
TV9TWVNNT049bQpDT05GSUdfUUNPTV9XQ05TU19QSUw9bQojIENPTkZJR19SQ0FSX1JFTU9U
RVBST0MgaXMgbm90IHNldAojIENPTkZJR19USV9LM19EU1BfUkVNT1RFUFJPQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RJX0szX1I1X1JFTU9URVBST0MgaXMgbm90IHNldAojIGVuZCBvZiBS
ZW1vdGVwcm9jIGRyaXZlcnMKCiMKIyBScG1zZyBkcml2ZXJzCiMKQ09ORklHX1JQTVNHPXkK
Q09ORklHX1JQTVNHX0NIQVI9bQpDT05GSUdfUlBNU0dfQ1RSTD1tCiMgQ09ORklHX1JQTVNH
X05TIGlzIG5vdCBzZXQKQ09ORklHX1JQTVNHX1FDT01fR0xJTks9eQpDT05GSUdfUlBNU0df
UUNPTV9HTElOS19SUE09eQpDT05GSUdfUlBNU0dfUUNPTV9HTElOS19TTUVNPW0KQ09ORklH
X1JQTVNHX1FDT01fU01EPXkKIyBDT05GSUdfUlBNU0dfVklSVElPIGlzIG5vdCBzZXQKIyBl
bmQgb2YgUnBtc2cgZHJpdmVycwoKQ09ORklHX1NPVU5EV0lSRT1tCgojCiMgU291bmRXaXJl
IERldmljZXMKIwojIENPTkZJR19TT1VORFdJUkVfSU5URUwgaXMgbm90IHNldApDT05GSUdf
U09VTkRXSVJFX1FDT009bQoKIwojIFNPQyAoU3lzdGVtIE9uIENoaXApIHNwZWNpZmljIERy
aXZlcnMKIwpDT05GSUdfT1dMX1BNX0RPTUFJTlNfSEVMUEVSPXkKQ09ORklHX09XTF9QTV9E
T01BSU5TPXkKCiMKIyBBbWxvZ2ljIFNvQyBkcml2ZXJzCiMKQ09ORklHX01FU09OX0NBTlZB
Uz1tCkNPTkZJR19NRVNPTl9DTEtfTUVBU1VSRT15CkNPTkZJR19NRVNPTl9HWF9TT0NJTkZP
PXkKQ09ORklHX01FU09OX0dYX1BNX0RPTUFJTlM9eQpDT05GSUdfTUVTT05fRUVfUE1fRE9N
QUlOUz15CkNPTkZJR19NRVNPTl9TRUNVUkVfUE1fRE9NQUlOUz15CiMgZW5kIG9mIEFtbG9n
aWMgU29DIGRyaXZlcnMKCiMKIyBBcHBsZSBTb0MgZHJpdmVycwojCkNPTkZJR19BUFBMRV9Q
TUdSX1BXUlNUQVRFPXkKQ09ORklHX0FQUExFX1JUS0lUPXkKQ09ORklHX0FQUExFX1NBUlQ9
eQojIGVuZCBvZiBBcHBsZSBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29tIFNvQyBkcml2ZXJz
CiMKQ09ORklHX0JDTTI4MzVfUE9XRVI9eQpDT05GSUdfUkFTUEJFUlJZUElfUE9XRVI9eQpD
T05GSUdfU09DX0JSQ01TVEI9eQpDT05GSUdfQkNNX1BNQj15CkNPTkZJR19CUkNNU1RCX1BN
PXkKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJlZXNjYWxlIFFv
cklRIFNvQyBkcml2ZXJzCiMKQ09ORklHX0ZTTF9EUEFBPXkKIyBDT05GSUdfRlNMX0RQQUFf
Q0hFQ0tJTkcgaXMgbm90IHNldAojIENPTkZJR19GU0xfQk1BTl9URVNUIGlzIG5vdCBzZXQK
IyBDT05GSUdfRlNMX1FNQU5fVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1FVSUNDX0VOR0lO
RSBpcyBub3Qgc2V0CkNPTkZJR19GU0xfR1VUUz15CkNPTkZJR19GU0xfTUNfRFBJTz15CkNP
TkZJR19EUEFBMl9DT05TT0xFPXkKQ09ORklHX0ZTTF9SQ1BNPXkKIyBlbmQgb2YgTlhQL0Zy
ZWVzY2FsZSBRb3JJUSBTb0MgZHJpdmVycwoKIwojIGZ1aml0c3UgU29DIGRyaXZlcnMKIwoj
IENPTkZJR19BNjRGWF9ESUFHIGlzIG5vdCBzZXQKIyBlbmQgb2YgZnVqaXRzdSBTb0MgZHJp
dmVycwoKIwojIGkuTVggU29DIGRyaXZlcnMKIwpDT05GSUdfSU1YX0dQQ1YyX1BNX0RPTUFJ
TlM9eQpDT05GSUdfU09DX0lNWDhNPXkKQ09ORklHX1NPQ19JTVg5PXkKIyBlbmQgb2YgaS5N
WCBTb0MgZHJpdmVycwoKIwojIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBk
cml2ZXJzCiMKIyBDT05GSUdfTElURVhfU09DX0NPTlRST0xMRVIgaXMgbm90IHNldAojIGVu
ZCBvZiBFbmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJpdmVycwoKIwojIE1l
ZGlhVGVrIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfTVRLX0NNRFEgaXMgbm90IHNldApDT05G
SUdfTVRLX0RFVkFQQz1tCkNPTkZJR19NVEtfSU5GUkFDRkc9eQpDT05GSUdfTVRLX1BNSUNf
V1JBUD15CkNPTkZJR19NVEtfU0NQU1lTPXkKQ09ORklHX01US19TQ1BTWVNfUE1fRE9NQUlO
Uz15CkNPTkZJR19NVEtfTU1TWVM9eQojIENPTkZJR19NVEtfU1ZTIGlzIG5vdCBzZXQKIyBl
bmQgb2YgTWVkaWFUZWsgU29DIGRyaXZlcnMKCiMKIyBRdWFsY29tbSBTb0MgZHJpdmVycwoj
CkNPTkZJR19RQ09NX0FPU1NfUU1QPXkKQ09ORklHX1FDT01fQ09NTUFORF9EQj15CkNPTkZJ
R19RQ09NX0NQUj15CkNPTkZJR19RQ09NX0dFTklfU0U9eQojIENPTkZJR19RQ09NX0dTQkkg
aXMgbm90IHNldApDT05GSUdfUUNPTV9MTENDPW0KQ09ORklHX1FDT01fS1JZT19MMl9BQ0NF
U1NPUlM9eQpDT05GSUdfUUNPTV9NRFRfTE9BREVSPW0KQ09ORklHX1FDT01fT0NNRU09bQpD
T05GSUdfUUNPTV9QRFJfSEVMUEVSUz1tCkNPTkZJR19RQ09NX1FNSV9IRUxQRVJTPW0KQ09O
RklHX1FDT01fUk1URlNfTUVNPW0KQ09ORklHX1FDT01fUlBNSD15CkNPTkZJR19RQ09NX1JQ
TUhQRD15CkNPTkZJR19RQ09NX1JQTVBEPXkKQ09ORklHX1FDT01fU01FTT15CkNPTkZJR19R
Q09NX1NNRF9SUE09eQpDT05GSUdfUUNPTV9TTUVNX1NUQVRFPXkKQ09ORklHX1FDT01fU01Q
MlA9eQpDT05GSUdfUUNPTV9TTVNNPXkKQ09ORklHX1FDT01fU09DSU5GTz1tCkNPTkZJR19R
Q09NX1NQTT1tCkNPTkZJR19RQ09NX1NUQVRTPW0KQ09ORklHX1FDT01fV0NOU1NfQ1RSTD1t
CkNPTkZJR19RQ09NX0FQUj1tCkNPTkZJR19RQ09NX0lDQ19CV01PTj1tCiMgZW5kIG9mIFF1
YWxjb21tIFNvQyBkcml2ZXJzCgpDT05GSUdfU09DX1JFTkVTQVM9eQpDT05GSUdfQVJDSF9S
Q0FSX0dFTjM9eQpDT05GSUdfQVJDSF9SWkcyTD15CkNPTkZJR19BUkNIX1I4QTc3OTk1PXkK
Q09ORklHX0FSQ0hfUjhBNzc5OTA9eQpDT05GSUdfQVJDSF9SOEE3Nzk1MD15CkNPTkZJR19B
UkNIX1I4QTc3OTUxPXkKQ09ORklHX0FSQ0hfUjhBNzc5NjU9eQpDT05GSUdfQVJDSF9SOEE3
Nzk2MD15CkNPTkZJR19BUkNIX1I4QTc3OTYxPXkKQ09ORklHX0FSQ0hfUjhBNzc5RjA9eQpD
T05GSUdfQVJDSF9SOEE3Nzk4MD15CkNPTkZJR19BUkNIX1I4QTc3OTcwPXkKQ09ORklHX0FS
Q0hfUjhBNzc5QTA9eQpDT05GSUdfQVJDSF9SOEE3NzlHMD15CkNPTkZJR19BUkNIX1I4QTc3
NEMwPXkKQ09ORklHX0FSQ0hfUjhBNzc0RTE9eQpDT05GSUdfQVJDSF9SOEE3NzRBMT15CkNP
TkZJR19BUkNIX1I4QTc3NEIxPXkKQ09ORklHX0FSQ0hfUjlBMDdHMDQzPXkKQ09ORklHX0FS
Q0hfUjlBMDdHMDQ0PXkKQ09ORklHX0FSQ0hfUjlBMDdHMDU0PXkKQ09ORklHX0FSQ0hfUjlB
MDlHMDExPXkKQ09ORklHX1JTVF9SQ0FSPXkKQ09ORklHX1NZU0NfUkNBUj15CkNPTkZJR19T
WVNDX1JDQVJfR0VOND15CkNPTkZJR19TWVNDX1I4QTc3OTk1PXkKQ09ORklHX1NZU0NfUjhB
Nzc5OTA9eQpDT05GSUdfU1lTQ19SOEE3Nzk1PXkKQ09ORklHX1NZU0NfUjhBNzc5NjU9eQpD
T05GSUdfU1lTQ19SOEE3Nzk2MD15CkNPTkZJR19TWVNDX1I4QTc3OTYxPXkKQ09ORklHX1NZ
U0NfUjhBNzc5RjA9eQpDT05GSUdfU1lTQ19SOEE3Nzk4MD15CkNPTkZJR19TWVNDX1I4QTc3
OTcwPXkKQ09ORklHX1NZU0NfUjhBNzc5QTA9eQpDT05GSUdfU1lTQ19SOEE3NzlHMD15CkNP
TkZJR19TWVNDX1I4QTc3NEMwPXkKQ09ORklHX1NZU0NfUjhBNzc0RTE9eQpDT05GSUdfU1lT
Q19SOEE3NzRBMT15CkNPTkZJR19TWVNDX1I4QTc3NEIxPXkKQ09ORklHX1JPQ0tDSElQX0dS
Rj15CkNPTkZJR19ST0NLQ0hJUF9JT0RPTUFJTj15CkNPTkZJR19ST0NLQ0hJUF9QTV9ET01B
SU5TPXkKQ09ORklHX1NPQ19TQU1TVU5HPXkKQ09ORklHX0VYWU5PU19DSElQSUQ9eQpDT05G
SUdfRVhZTk9TX1VTST15CkNPTkZJR19FWFlOT1NfUE1VPXkKQ09ORklHX0VYWU5PU19QTV9E
T01BSU5TPXkKQ09ORklHX1NVTlhJX01CVVM9eQpDT05GSUdfU1VOWElfU1JBTT15CkNPTkZJ
R19BUkNIX1RFR1JBXzEzMl9TT0M9eQpDT05GSUdfQVJDSF9URUdSQV8yMTBfU09DPXkKQ09O
RklHX0FSQ0hfVEVHUkFfMTg2X1NPQz15CkNPTkZJR19BUkNIX1RFR1JBXzE5NF9TT0M9eQpD
T05GSUdfQVJDSF9URUdSQV8yMzRfU09DPXkKQ09ORklHX1NPQ19URUdSQV9GVVNFPXkKQ09O
RklHX1NPQ19URUdSQV9GTE9XQ1RSTD15CkNPTkZJR19TT0NfVEVHUkFfUE1DPXkKQ09ORklH
X1NPQ19URUdSQV9QT1dFUkdBVEVfQlBNUD15CkNPTkZJR19TT0NfVEVHUkFfQ0JCPXkKQ09O
RklHX1NPQ19UST15CkNPTkZJR19USV9TQ0lfUE1fRE9NQUlOUz15CkNPTkZJR19USV9LM19S
SU5HQUNDPXkKQ09ORklHX1RJX0szX1NPQ0lORk89eQojIENPTkZJR19USV9QUlVTUyBpcyBu
b3Qgc2V0CkNPTkZJR19USV9TQ0lfSU5UQV9NU0lfRE9NQUlOPXkKCiMKIyBYaWxpbnggU29D
IGRyaXZlcnMKIwpDT05GSUdfWllOUU1QX1BPV0VSPXkKQ09ORklHX1pZTlFNUF9QTV9ET01B
SU5TPXkKQ09ORklHX1hMTlhfRVZFTlRfTUFOQUdFUj15CiMgZW5kIG9mIFhpbGlueCBTb0Mg
ZHJpdmVycwojIGVuZCBvZiBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJz
CgpDT05GSUdfUE1fREVWRlJFUT15CgojCiMgREVWRlJFUSBHb3Zlcm5vcnMKIwpDT05GSUdf
REVWRlJFUV9HT1ZfU0lNUExFX09OREVNQU5EPXkKIyBDT05GSUdfREVWRlJFUV9HT1ZfUEVS
Rk9STUFOQ0UgaXMgbm90IHNldAojIENPTkZJR19ERVZGUkVRX0dPVl9QT1dFUlNBVkUgaXMg
bm90IHNldApDT05GSUdfREVWRlJFUV9HT1ZfVVNFUlNQQUNFPW0KIyBDT05GSUdfREVWRlJF
UV9HT1ZfUEFTU0lWRSBpcyBub3Qgc2V0CgojCiMgREVWRlJFUSBEcml2ZXJzCiMKIyBDT05G
SUdfQVJNX0VYWU5PU19CVVNfREVWRlJFUSBpcyBub3Qgc2V0CkNPTkZJR19BUk1fSU1YX0JV
U19ERVZGUkVRPW0KQ09ORklHX0FSTV9JTVg4TV9ERFJDX0RFVkZSRVE9bQojIENPTkZJR19B
Uk1fVEVHUkFfREVWRlJFUSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9NRURJQVRFS19DQ0lf
REVWRlJFUSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9SSzMzOTlfRE1DX0RFVkZSRVEgaXMg
bm90IHNldAojIENPTkZJR19BUk1fU1VOOElfQTMzX01CVVNfREVWRlJFUSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BNX0RFVkZSRVFfRVZFTlQgaXMgbm90IHNldApDT05GSUdfRVhUQ09OPXkK
CiMKIyBFeHRjb24gRGV2aWNlIERyaXZlcnMKIwojIENPTkZJR19FWFRDT05fQURDX0pBQ0sg
aXMgbm90IHNldAojIENPTkZJR19FWFRDT05fRlNBOTQ4MCBpcyBub3Qgc2V0CiMgQ09ORklH
X0VYVENPTl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX01BWDMzNTUgaXMgbm90
IHNldApDT05GSUdfRVhUQ09OX1BUTjUxNTA9bQojIENPTkZJR19FWFRDT05fUUNPTV9TUE1J
X01JU0MgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fUlQ4OTczQSBpcyBub3Qgc2V0CiMg
Q09ORklHX0VYVENPTl9TTTU1MDIgaXMgbm90IHNldApDT05GSUdfRVhUQ09OX1VTQl9HUElP
PXkKQ09ORklHX0VYVENPTl9VU0JDX0NST1NfRUM9eQojIENPTkZJR19FWFRDT05fVVNCQ19U
VVNCMzIwIGlzIG5vdCBzZXQKQ09ORklHX01FTU9SWT15CiMgQ09ORklHX0FSTV9QTDE3Ml9N
UE1DIGlzIG5vdCBzZXQKQ09ORklHX0JSQ01TVEJfRFBGRT15CkNPTkZJR19CUkNNU1RCX01F
TUM9eQojIENPTkZJR19PTUFQX0dQTUMgaXMgbm90IHNldApDT05GSUdfRlNMX0lGQz15CkNP
TkZJR19NVEtfU01JPXkKQ09ORklHX1JFTkVTQVNfUlBDSUY9bQpDT05GSUdfVEVHUkFfTUM9
eQojIENPTkZJR19URUdSQTIxMF9FTUMgaXMgbm90IHNldApDT05GSUdfSUlPPXkKQ09ORklH
X0lJT19CVUZGRVI9eQojIENPTkZJR19JSU9fQlVGRkVSX0NCIGlzIG5vdCBzZXQKIyBDT05G
SUdfSUlPX0JVRkZFUl9ETUEgaXMgbm90IHNldAojIENPTkZJR19JSU9fQlVGRkVSX0RNQUVO
R0lORSBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19CVUZGRVJfSFdfQ09OU1VNRVIgaXMgbm90
IHNldApDT05GSUdfSUlPX0tGSUZPX0JVRj1tCkNPTkZJR19JSU9fVFJJR0dFUkVEX0JVRkZF
Uj1tCiMgQ09ORklHX0lJT19DT05GSUdGUyBpcyBub3Qgc2V0CkNPTkZJR19JSU9fVFJJR0dF
Uj15CkNPTkZJR19JSU9fQ09OU1VNRVJTX1BFUl9UUklHR0VSPTIKIyBDT05GSUdfSUlPX1NX
X0RFVklDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19TV19UUklHR0VSIGlzIG5vdCBzZXQK
IyBDT05GSUdfSUlPX1RSSUdHRVJFRF9FVkVOVCBpcyBub3Qgc2V0CgojCiMgQWNjZWxlcm9t
ZXRlcnMKIwojIENPTkZJR19BRElTMTYyMDEgaXMgbm90IHNldAojIENPTkZJR19BRElTMTYy
MDkgaXMgbm90IHNldAojIENPTkZJR19BRFhMMzEzX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0FEWEwzMTNfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfQURYTDM0NV9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19BRFhMMzQ1X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FEWEwzNTVfSTJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfQURYTDM1NV9TUEkgaXMgbm90IHNldAojIENPTkZJR19B
RFhMMzY3X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FEWEwzNjdfSTJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfQURYTDM3Ml9TUEkgaXMgbm90IHNldAojIENPTkZJR19BRFhMMzcyX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0JNQTE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JNQTIyMCBp
cyBub3Qgc2V0CiMgQ09ORklHX0JNQTQwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0JNQzE1MF9B
Q0NFTCBpcyBub3Qgc2V0CiMgQ09ORklHX0JNSTA4OF9BQ0NFTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RBMjgwIGlzIG5vdCBzZXQKIyBDT05GSUdfREEzMTEgaXMgbm90IHNldAojIENPTkZJ
R19ETUFSRDA2IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BUkQwOSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RNQVJEMTAgaXMgbm90IHNldAojIENPTkZJR19GWExTODk2MkFGX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZYTFM4OTYyQUZfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX0NS
T1NfRUNfQUNDRUxfTEVHQUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX1NUX0FDQ0VMXzNB
WElTIGlzIG5vdCBzZXQKIyBDT05GSUdfS1hTRDkgaXMgbm90IHNldAojIENPTkZJR19LWENK
SzEwMTMgaXMgbm90IHNldAojIENPTkZJR19NQzMyMzAgaXMgbm90IHNldAojIENPTkZJR19N
TUE3NDU1X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01NQTc0NTVfU1BJIGlzIG5vdCBzZXQK
IyBDT05GSUdfTU1BNzY2MCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQTg0NTIgaXMgbm90IHNl
dAojIENPTkZJR19NTUE5NTUxIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1BOTU1MyBpcyBub3Qg
c2V0CiMgQ09ORklHX01TQTMxMSBpcyBub3Qgc2V0CiMgQ09ORklHX01YQzQwMDUgaXMgbm90
IHNldAojIENPTkZJR19NWEM2MjU1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NBMzAwMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDQTMzMDAgaXMgbm90IHNldAojIENPTkZJR19TVEs4MzEyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1RLOEJBNTAgaXMgbm90IHNldAojIGVuZCBvZiBBY2NlbGVy
b21ldGVycwoKIwojIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwojIENPTkZJR19B
RDcwOTFSNSBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzEyNCBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzE5MiBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzI2NiBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzI4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzI5MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzI5MiBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzI5OCBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzQ3NiBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzYwNl9JRkFDRV9QQVJBTExFTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FENzYwNl9JRkFDRV9TUEkgaXMgbm90IHNldAojIENPTkZJR19B
RDc3NjYgaXMgbm90IHNldAojIENPTkZJR19BRDc3NjhfMSBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzc4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzc5MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzc5MyBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzg4NyBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzkyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzk0OSBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENzk5WCBpcyBub3Qgc2V0CiMgQ09ORklHX0FESV9BWElfQURDIGlzIG5vdCBzZXQKIyBD
T05GSUdfQVhQMjBYX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FYUDI4OF9BREMgaXMgbm90
IHNldAojIENPTkZJR19CQ01fSVBST0NfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfQkVSTElO
Ml9BREMgaXMgbm90IHNldAojIENPTkZJR19DQzEwMDAxX0FEQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0VOVkVMT1BFX0RFVEVDVE9SIGlzIG5vdCBzZXQKQ09ORklHX0VYWU5PU19BREM9eQoj
IENPTkZJR19ISTg0MzUgaXMgbm90IHNldAojIENPTkZJR19IWDcxMSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOQTJYWF9BREMgaXMgbm90IHNldAojIENPTkZJR19JTVg3RF9BREMgaXMgbm90
IHNldAojIENPTkZJR19JTVg4UVhQX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX0xUQzI0NzEg
aXMgbm90IHNldAojIENPTkZJR19MVEMyNDg1IGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMjQ5
NiBpcyBub3Qgc2V0CiMgQ09ORklHX0xUQzI0OTcgaXMgbm90IHNldAojIENPTkZJR19NQVgx
MDI3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFYMTExMDAgaXMgbm90IHNldAojIENPTkZJR19N
QVgxMTE4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFYMTEyMDUgaXMgbm90IHNldAojIENPTkZJ
R19NQVgxMjQxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFYMTM2MyBpcyBub3Qgc2V0CkNPTkZJ
R19NQVg5NjExPW0KIyBDT05GSUdfTUNQMzIwWCBpcyBub3Qgc2V0CiMgQ09ORklHX01DUDM0
MjIgaXMgbm90IHNldAojIENPTkZJR19NQ1AzOTExIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVE
SUFURUtfTVQ2MzYwX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBVEVLX01UNjU3N19B
VVhBREMgaXMgbm90IHNldApDT05GSUdfTUVTT05fU0FSQURDPXkKIyBDT05GSUdfTkFVNzgw
MiBpcyBub3Qgc2V0CiMgQ09ORklHX05QQ01fQURDIGlzIG5vdCBzZXQKQ09ORklHX1FDT01f
VkFEQ19DT01NT049bQojIENPTkZJR19RQ09NX1NQTUlfUlJBREMgaXMgbm90IHNldAojIENP
TkZJR19RQ09NX1NQTUlfSUFEQyBpcyBub3Qgc2V0CkNPTkZJR19RQ09NX1NQTUlfVkFEQz1t
CkNPTkZJR19RQ09NX1NQTUlfQURDNT1tCkNPTkZJR19ST0NLQ0hJUF9TQVJBREM9bQojIENP
TkZJR19SSUNIVEVLX1JUUTYwNTYgaXMgbm90IHNldApDT05GSUdfUlpHMkxfQURDPW0KIyBD
T05GSUdfU0RfQURDX01PRFVMQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEQzA4MUMg
aXMgbm90IHNldAojIENPTkZJR19USV9BREMwODMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVElf
QURDMDg0UzAyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEQzEyMTM4IGlzIG5vdCBzZXQK
IyBDT05GSUdfVElfQURDMTA4UzEwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEQzEyOFMw
NTIgaXMgbm90IHNldAojIENPTkZJR19USV9BREMxNjFTNjI2IGlzIG5vdCBzZXQKQ09ORklH
X1RJX0FEUzEwMTU9bQojIENPTkZJR19USV9BRFM3OTUwIGlzIG5vdCBzZXQKIyBDT05GSUdf
VElfQURTODM0NCBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEUzg2ODggaXMgbm90IHNldAoj
IENPTkZJR19USV9BRFMxMjRTMDggaXMgbm90IHNldAojIENPTkZJR19USV9BRFMxMzFFMDgg
aXMgbm90IHNldAojIENPTkZJR19USV9UTEM0NTQxIGlzIG5vdCBzZXQKIyBDT05GSUdfVElf
VFNDMjA0NiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZGNjEwX0FEQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1hJTElOWF9YQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX0FNUyBpcyBub3Qg
c2V0CiMgZW5kIG9mIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBBbmFsb2cg
dG8gZGlnaXRhbCBhbmQgZGlnaXRhbCB0byBhbmFsb2cgY29udmVydGVycwojCiMgQ09ORklH
X0FENzQ0MTNSIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5hbG9nIHRvIGRpZ2l0YWwgYW5kIGRp
Z2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBBbmFsb2cgRnJvbnQgRW5kcwojCiMg
Q09ORklHX0lJT19SRVNDQUxFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5hbG9nIEZyb250IEVu
ZHMKCiMKIyBBbXBsaWZpZXJzCiMKIyBDT05GSUdfQUQ4MzY2IGlzIG5vdCBzZXQKIyBDT05G
SUdfQURBNDI1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0hNQzQyNSBpcyBub3Qgc2V0CiMgZW5k
IG9mIEFtcGxpZmllcnMKCiMKIyBDYXBhY2l0YW5jZSB0byBkaWdpdGFsIGNvbnZlcnRlcnMK
IwojIENPTkZJR19BRDcxNTAgaXMgbm90IHNldAojIENPTkZJR19BRDc3NDYgaXMgbm90IHNl
dAojIGVuZCBvZiBDYXBhY2l0YW5jZSB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBDaGVt
aWNhbCBTZW5zb3JzCiMKIyBDT05GSUdfQVRMQVNfUEhfU0VOU09SIGlzIG5vdCBzZXQKIyBD
T05GSUdfQVRMQVNfRVpPX1NFTlNPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0JNRTY4MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NDUzgxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0lBUUNPUkUgaXMg
bm90IHNldAojIENPTkZJR19QTVM3MDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NEMzBfQ09S
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDRDRYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU0lS
SU9OX1NHUDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU0lSSU9OX1NHUDQwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1BTMzBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BTMzBfU0VSSUFM
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU0VBSVJfU1VOUklTRV9DTzIgaXMgbm90IHNldAoj
IENPTkZJR19WWjg5WCBpcyBub3Qgc2V0CiMgZW5kIG9mIENoZW1pY2FsIFNlbnNvcnMKCkNP
TkZJR19JSU9fQ1JPU19FQ19TRU5TT1JTX0NPUkU9bQpDT05GSUdfSUlPX0NST1NfRUNfU0VO
U09SUz1tCiMgQ09ORklHX0lJT19DUk9TX0VDX1NFTlNPUlNfTElEX0FOR0xFIGlzIG5vdCBz
ZXQKCiMKIyBIaWQgU2Vuc29yIElJTyBDb21tb24KIwojIGVuZCBvZiBIaWQgU2Vuc29yIElJ
TyBDb21tb24KCiMKIyBJSU8gU0NNSSBTZW5zb3JzCiMKIyBDT05GSUdfSUlPX1NDTUkgaXMg
bm90IHNldAojIGVuZCBvZiBJSU8gU0NNSSBTZW5zb3JzCgojCiMgU1NQIFNlbnNvciBDb21t
b24KIwojIENPTkZJR19JSU9fU1NQX1NFTlNPUkhVQiBpcyBub3Qgc2V0CiMgZW5kIG9mIFNT
UCBTZW5zb3IgQ29tbW9uCgpDT05GSUdfSUlPX1NUX1NFTlNPUlNfSTJDPW0KQ09ORklHX0lJ
T19TVF9TRU5TT1JTX1NQST1tCkNPTkZJR19JSU9fU1RfU0VOU09SU19DT1JFPW0KCiMKIyBE
aWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCiMKIyBDT05GSUdfQUQzNTUyUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0FENTA2NCBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTM2MCBpcyBub3Qg
c2V0CiMgQ09ORklHX0FENTM4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTQyMSBpcyBub3Qg
c2V0CiMgQ09ORklHX0FENTQ0NiBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTQ0OSBpcyBub3Qg
c2V0CiMgQ09ORklHX0FENTU5MlIgaXMgbm90IHNldAojIENPTkZJR19BRDU1OTNSIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUQ1NTA0IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NjI0Ul9TUEkg
aXMgbm90IHNldAojIENPTkZJR19MVEMyNjg4IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1Njg2
X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTY5Nl9JMkMgaXMgbm90IHNldAojIENPTkZJ
R19BRDU3NTUgaXMgbm90IHNldAojIENPTkZJR19BRDU3NTggaXMgbm90IHNldAojIENPTkZJ
R19BRDU3NjEgaXMgbm90IHNldAojIENPTkZJR19BRDU3NjQgaXMgbm90IHNldAojIENPTkZJ
R19BRDU3NjYgaXMgbm90IHNldAojIENPTkZJR19BRDU3NzBSIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUQ1NzkxIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MjkzIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUQ3MzAzIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ4ODAxIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFBPVF9EQUMgaXMgbm90IHNldAojIENPTkZJR19EUzQ0MjQgaXMgbm90IHNldAojIENP
TkZJR19MVEMxNjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMjYzMiBpcyBub3Qgc2V0CiMg
Q09ORklHX002MjMzMiBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDUxNyBpcyBub3Qgc2V0CiMg
Q09ORklHX01BWDU4MjEgaXMgbm90IHNldAojIENPTkZJR19NQ1A0NzI1IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUNQNDkyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0RBQzA4MlMwODUgaXMg
bm90IHNldAojIENPTkZJR19USV9EQUM1NTcxIGlzIG5vdCBzZXQKIyBDT05GSUdfVElfREFD
NzMxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0RBQzc2MTIgaXMgbm90IHNldAojIENPTkZJ
R19WRjYxMF9EQUMgaXMgbm90IHNldAojIGVuZCBvZiBEaWdpdGFsIHRvIGFuYWxvZyBjb252
ZXJ0ZXJzCgojCiMgSUlPIGR1bW15IGRyaXZlcgojCiMgZW5kIG9mIElJTyBkdW1teSBkcml2
ZXIKCiMKIyBGaWx0ZXJzCiMKIyBDT05GSUdfQURNVjg4MTggaXMgbm90IHNldAojIGVuZCBv
ZiBGaWx0ZXJzCgojCiMgRnJlcXVlbmN5IFN5bnRoZXNpemVycyBERFMvUExMCiMKCiMKIyBD
bG9jayBHZW5lcmF0b3IvRGlzdHJpYnV0aW9uCiMKIyBDT05GSUdfQUQ5NTIzIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgQ2xvY2sgR2VuZXJhdG9yL0Rpc3RyaWJ1dGlvbgoKIwojIFBoYXNlLUxv
Y2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIwojIENPTkZJR19BREY0
MzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURGNDM3MSBpcyBub3Qgc2V0CiMgQ09ORklHX0FE
TVYxMDEzIGlzIG5vdCBzZXQKIyBDT05GSUdfQURNVjEwMTQgaXMgbm90IHNldAojIENPTkZJ
R19BRE1WNDQyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FEUkY2NzgwIGlzIG5vdCBzZXQKIyBl
bmQgb2YgUGhhc2UtTG9ja2VkIExvb3AgKFBMTCkgZnJlcXVlbmN5IHN5bnRoZXNpemVycwoj
IGVuZCBvZiBGcmVxdWVuY3kgU3ludGhlc2l6ZXJzIEREUy9QTEwKCiMKIyBEaWdpdGFsIGd5
cm9zY29wZSBzZW5zb3JzCiMKIyBDT05GSUdfQURJUzE2MDgwIGlzIG5vdCBzZXQKIyBDT05G
SUdfQURJUzE2MTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURJUzE2MTM2IGlzIG5vdCBzZXQK
IyBDT05GSUdfQURJUzE2MjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURYUlMyOTAgaXMgbm90
IHNldAojIENPTkZJR19BRFhSUzQ1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JNRzE2MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZYQVMyMTAwMkMgaXMgbm90IHNldAojIENPTkZJR19NUFUzMDUw
X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19TVF9HWVJPXzNBWElTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVRHMzIwMCBpcyBub3Qgc2V0CiMgZW5kIG9mIERpZ2l0YWwgZ3lyb3Njb3Bl
IHNlbnNvcnMKCiMKIyBIZWFsdGggU2Vuc29ycwojCgojCiMgSGVhcnQgUmF0ZSBNb25pdG9y
cwojCiMgQ09ORklHX0FGRTQ0MDMgaXMgbm90IHNldAojIENPTkZJR19BRkU0NDA0IGlzIG5v
dCBzZXQKIyBDT05GSUdfTUFYMzAxMDAgaXMgbm90IHNldAojIENPTkZJR19NQVgzMDEwMiBp
cyBub3Qgc2V0CiMgZW5kIG9mIEhlYXJ0IFJhdGUgTW9uaXRvcnMKIyBlbmQgb2YgSGVhbHRo
IFNlbnNvcnMKCiMKIyBIdW1pZGl0eSBzZW5zb3JzCiMKIyBDT05GSUdfQU0yMzE1IGlzIG5v
dCBzZXQKIyBDT05GSUdfREhUMTEgaXMgbm90IHNldAojIENPTkZJR19IREMxMDBYIGlzIG5v
dCBzZXQKIyBDT05GSUdfSERDMjAxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0hUUzIyMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hUVTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0k3MDA1IGlzIG5v
dCBzZXQKIyBDT05GSUdfU0k3MDIwIGlzIG5vdCBzZXQKIyBlbmQgb2YgSHVtaWRpdHkgc2Vu
c29ycwoKIwojIEluZXJ0aWFsIG1lYXN1cmVtZW50IHVuaXRzCiMKIyBDT05GSUdfQURJUzE2
NDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURJUzE2NDYwIGlzIG5vdCBzZXQKIyBDT05GSUdf
QURJUzE2NDc1IGlzIG5vdCBzZXQKIyBDT05GSUdfQURJUzE2NDgwIGlzIG5vdCBzZXQKIyBD
T05GSUdfQk1JMTYwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0JNSTE2MF9TUEkgaXMgbm90
IHNldAojIENPTkZJR19CT1NDSF9CTk8wNTVfU0VSSUFMIGlzIG5vdCBzZXQKIyBDT05GSUdf
Qk9TQ0hfQk5PMDU1X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZYT1M4NzAwX0kyQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZYT1M4NzAwX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0tNWDYx
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5WX0lDTTQyNjAwX0kyQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOVl9JQ000MjYwMF9TUEkgaXMgbm90IHNldAojIENPTkZJR19JTlZfTVBVNjA1MF9J
MkMgaXMgbm90IHNldAojIENPTkZJR19JTlZfTVBVNjA1MF9TUEkgaXMgbm90IHNldApDT05G
SUdfSUlPX1NUX0xTTTZEU1g9bQpDT05GSUdfSUlPX1NUX0xTTTZEU1hfSTJDPW0KQ09ORklH
X0lJT19TVF9MU002RFNYX1NQST1tCiMgQ09ORklHX0lJT19TVF9MU005RFMwIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgSW5lcnRpYWwgbWVhc3VyZW1lbnQgdW5pdHMKCiMKIyBMaWdodCBzZW5z
b3JzCiMKIyBDT05GSUdfQUNQSV9BTFMgaXMgbm90IHNldAojIENPTkZJR19BREpEX1MzMTEg
aXMgbm90IHNldAojIENPTkZJR19BRFVYMTAyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FMMzAx
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FMMzMyMEEgaXMgbm90IHNldAojIENPTkZJR19BUERT
OTMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FQRFM5OTYwIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVM3MzIxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0JIMTc1MCBpcyBub3Qgc2V0CiMgQ09ORklH
X0JIMTc4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NNMzIxODEgaXMgbm90IHNldAojIENPTkZJ
R19DTTMyMzIgaXMgbm90IHNldAojIENPTkZJR19DTTMzMjMgaXMgbm90IHNldAojIENPTkZJ
R19DTTM2MDUgaXMgbm90IHNldAojIENPTkZJR19DTTM2NjUxIGlzIG5vdCBzZXQKQ09ORklH
X0lJT19DUk9TX0VDX0xJR0hUX1BST1g9bQojIENPTkZJR19HUDJBUDAwMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0dQMkFQMDIwQTAwRiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0lTTDI5
MDE4PW0KIyBDT05GSUdfU0VOU09SU19JU0wyOTAyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0lT
TDI5MTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfSlNBMTIxMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1JQUjA1MjEgaXMgbm90IHNldAojIENPTkZJR19MVFI1MDEgaXMgbm90IHNldAojIENPTkZJ
R19MVFJGMjE2QSBpcyBub3Qgc2V0CiMgQ09ORklHX0xWMDEwNENTIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUFYNDQwMDAgaXMgbm90IHNldAojIENPTkZJR19NQVg0NDAwOSBpcyBub3Qgc2V0
CiMgQ09ORklHX05PQTEzMDUgaXMgbm90IHNldAojIENPTkZJR19PUFQzMDAxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEExMjIwMzAwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NJMTEzMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NJMTE0NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NUSzMzMTAgaXMg
bm90IHNldAojIENPTkZJR19TVF9VVklTMjUgaXMgbm90IHNldAojIENPTkZJR19UQ1MzNDE0
IGlzIG5vdCBzZXQKIyBDT05GSUdfVENTMzQ3MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfVFNMMjU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1RTTDI1ODMgaXMgbm90IHNldAojIENP
TkZJR19UU0wyNTkxIGlzIG5vdCBzZXQKIyBDT05GSUdfVFNMMjc3MiBpcyBub3Qgc2V0CiMg
Q09ORklHX1RTTDQ1MzEgaXMgbm90IHNldAojIENPTkZJR19VUzUxODJEIGlzIG5vdCBzZXQK
Q09ORklHX1ZDTkw0MDAwPW0KIyBDT05GSUdfVkNOTDQwMzUgaXMgbm90IHNldAojIENPTkZJ
R19WRU1MNjAzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZFTUw2MDcwIGlzIG5vdCBzZXQKIyBD
T05GSUdfVkw2MTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfWk9QVDIyMDEgaXMgbm90IHNldAoj
IGVuZCBvZiBMaWdodCBzZW5zb3JzCgojCiMgTWFnbmV0b21ldGVyIHNlbnNvcnMKIwojIENP
TkZJR19BSzg5NzQgaXMgbm90IHNldAojIENPTkZJR19BSzg5NzUgaXMgbm90IHNldAojIENP
TkZJR19BSzA5OTExIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1DMTUwX01BR05fSTJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfQk1DMTUwX01BR05fU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFH
MzExMCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQzM1MjQwIGlzIG5vdCBzZXQKQ09ORklHX0lJ
T19TVF9NQUdOXzNBWElTPW0KQ09ORklHX0lJT19TVF9NQUdOX0kyQ18zQVhJUz1tCkNPTkZJ
R19JSU9fU1RfTUFHTl9TUElfM0FYSVM9bQojIENPTkZJR19TRU5TT1JTX0hNQzU4NDNfSTJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19ITUM1ODQzX1NQSSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfUk0zMTAwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
Uk0zMTAwX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1lBTUFIQV9ZQVM1MzAgaXMgbm90IHNl
dAojIGVuZCBvZiBNYWduZXRvbWV0ZXIgc2Vuc29ycwoKIwojIE11bHRpcGxleGVycwojCiMg
Q09ORklHX0lJT19NVVggaXMgbm90IHNldAojIGVuZCBvZiBNdWx0aXBsZXhlcnMKCiMKIyBJ
bmNsaW5vbWV0ZXIgc2Vuc29ycwojCiMgZW5kIG9mIEluY2xpbm9tZXRlciBzZW5zb3JzCgoj
CiMgVHJpZ2dlcnMgLSBzdGFuZGFsb25lCiMKIyBDT05GSUdfSUlPX0lOVEVSUlVQVF9UUklH
R0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX1NZU0ZTX1RSSUdHRVIgaXMgbm90IHNldAoj
IGVuZCBvZiBUcmlnZ2VycyAtIHN0YW5kYWxvbmUKCiMKIyBMaW5lYXIgYW5kIGFuZ3VsYXIg
cG9zaXRpb24gc2Vuc29ycwojCiMgZW5kIG9mIExpbmVhciBhbmQgYW5ndWxhciBwb3NpdGlv
biBzZW5zb3JzCgojCiMgRGlnaXRhbCBwb3RlbnRpb21ldGVycwojCiMgQ09ORklHX0FENTEx
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTI3MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RTMTgw
MyBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDU0MzIgaXMgbm90IHNldAojIENPTkZJR19NQVg1
NDgxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFYNTQ4NyBpcyBub3Qgc2V0CiMgQ09ORklHX01D
UDQwMTggaXMgbm90IHNldAojIENPTkZJR19NQ1A0MTMxIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUNQNDUzMSBpcyBub3Qgc2V0CiMgQ09ORklHX01DUDQxMDEwIGlzIG5vdCBzZXQKIyBDT05G
SUdfVFBMMDEwMiBpcyBub3Qgc2V0CiMgZW5kIG9mIERpZ2l0YWwgcG90ZW50aW9tZXRlcnMK
CiMKIyBEaWdpdGFsIHBvdGVudGlvc3RhdHMKIwojIENPTkZJR19MTVA5MTAwMCBpcyBub3Qg
c2V0CiMgZW5kIG9mIERpZ2l0YWwgcG90ZW50aW9zdGF0cwoKIwojIFByZXNzdXJlIHNlbnNv
cnMKIwojIENPTkZJR19BQlAwNjBNRyBpcyBub3Qgc2V0CiMgQ09ORklHX0JNUDI4MCBpcyBu
b3Qgc2V0CkNPTkZJR19JSU9fQ1JPU19FQ19CQVJPPW0KIyBDT05GSUdfRExITDYwRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RQUzMxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0hQMDMgaXMgbm90
IHNldAojIENPTkZJR19JQ1AxMDEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX01QTDExNV9JMkMg
aXMgbm90IHNldAojIENPTkZJR19NUEwxMTVfU1BJIGlzIG5vdCBzZXQKQ09ORklHX01QTDMx
MTU9bQojIENPTkZJR19NUzU2MTEgaXMgbm90IHNldAojIENPTkZJR19NUzU2MzcgaXMgbm90
IHNldAojIENPTkZJR19JSU9fU1RfUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19UNTQwMyBp
cyBub3Qgc2V0CiMgQ09ORklHX0hQMjA2QyBpcyBub3Qgc2V0CiMgQ09ORklHX1pQQTIzMjYg
aXMgbm90IHNldAojIGVuZCBvZiBQcmVzc3VyZSBzZW5zb3JzCgojCiMgTGlnaHRuaW5nIHNl
bnNvcnMKIwojIENPTkZJR19BUzM5MzUgaXMgbm90IHNldAojIGVuZCBvZiBMaWdodG5pbmcg
c2Vuc29ycwoKIwojIFByb3hpbWl0eSBhbmQgZGlzdGFuY2Ugc2Vuc29ycwojCiMgQ09ORklH
X0NST1NfRUNfTUtCUF9QUk9YSU1JVFkgaXMgbm90IHNldAojIENPTkZJR19JU0wyOTUwMSBp
cyBub3Qgc2V0CiMgQ09ORklHX0xJREFSX0xJVEVfVjIgaXMgbm90IHNldAojIENPTkZJR19N
QjEyMzIgaXMgbm90IHNldAojIENPTkZJR19QSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfUkZE
Nzc0MDIgaXMgbm90IHNldAojIENPTkZJR19TUkYwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NY
OTMxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NYOTMyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NY
OTM2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NYOTUwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NS
RjA4IGlzIG5vdCBzZXQKIyBDT05GSUdfVkNOTDMwMjAgaXMgbm90IHNldAojIENPTkZJR19W
TDUzTDBYX0kyQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFByb3hpbWl0eSBhbmQgZGlzdGFuY2Ug
c2Vuc29ycwoKIwojIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojCiMgQ09ORklH
X0FEMlM5MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FEMlMxMjAwIGlzIG5vdCBzZXQKIyBlbmQg
b2YgUmVzb2x2ZXIgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCgojCiMgVGVtcGVyYXR1cmUgc2Vu
c29ycwojCiMgQ09ORklHX0xUQzI5ODMgaXMgbm90IHNldAojIENPTkZJR19NQVhJTV9USEVS
TU9DT1VQTEUgaXMgbm90IHNldAojIENPTkZJR19NTFg5MDYxNCBpcyBub3Qgc2V0CiMgQ09O
RklHX01MWDkwNjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVE1QMDA2IGlzIG5vdCBzZXQKIyBD
T05GSUdfVE1QMDA3IGlzIG5vdCBzZXQKIyBDT05GSUdfVE1QMTE3IGlzIG5vdCBzZXQKIyBD
T05GSUdfVFNZUzAxIGlzIG5vdCBzZXQKIyBDT05GSUdfVFNZUzAyRCBpcyBub3Qgc2V0CiMg
Q09ORklHX01BWDMxODU2IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFYMzE4NjUgaXMgbm90IHNl
dAojIGVuZCBvZiBUZW1wZXJhdHVyZSBzZW5zb3JzCgojIENPTkZJR19OVEIgaXMgbm90IHNl
dApDT05GSUdfUFdNPXkKQ09ORklHX1BXTV9TWVNGUz15CiMgQ09ORklHX1BXTV9ERUJVRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1BXTV9BVE1FTF9UQ0IgaXMgbm90IHNldApDT05GSUdfUFdN
X0JDTV9JUFJPQz15CkNPTkZJR19QV01fQkNNMjgzNT1tCiMgQ09ORklHX1BXTV9CRVJMSU4g
aXMgbm90IHNldApDT05GSUdfUFdNX0JSQ01TVEI9bQojIENPTkZJR19QV01fQ0xLIGlzIG5v
dCBzZXQKQ09ORklHX1BXTV9DUk9TX0VDPW0KIyBDT05GSUdfUFdNX0RXQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BXTV9GU0xfRlRNIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX0hJQlZUIGlz
IG5vdCBzZXQKIyBDT05GSUdfUFdNX0lNWDEgaXMgbm90IHNldApDT05GSUdfUFdNX0lNWDI3
PW0KIyBDT05GSUdfUFdNX0lNWF9UUE0gaXMgbm90IHNldAojIENPTkZJR19QV01fS0VFTUJB
WSBpcyBub3Qgc2V0CkNPTkZJR19QV01fTUVTT049bQpDT05GSUdfUFdNX01US19ESVNQPW0K
Q09ORklHX1BXTV9NRURJQVRFSz1tCiMgQ09ORklHX1BXTV9PTUFQX0RNVElNRVIgaXMgbm90
IHNldAojIENPTkZJR19QV01fUENBOTY4NSBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9SQVNQ
QkVSUllQSV9QT0UgaXMgbm90IHNldApDT05GSUdfUFdNX1JDQVI9bQpDT05GSUdfUFdNX1JF
TkVTQVNfVFBVPW0KQ09ORklHX1BXTV9ST0NLQ0hJUD15CkNPTkZJR19QV01fU0FNU1VORz15
CkNPTkZJR19QV01fU0wyOENQTEQ9bQojIENPTkZJR19QV01fU1BSRCBpcyBub3Qgc2V0CkNP
TkZJR19QV01fU1VONEk9bQpDT05GSUdfUFdNX1RFR1JBPW0KIyBDT05GSUdfUFdNX1RJRUNB
UCBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9USUVIUlBXTSBpcyBub3Qgc2V0CkNPTkZJR19Q
V01fVklTQ09OVEk9bQojIENPTkZJR19QV01fWElMSU5YIGlzIG5vdCBzZXQKCiMKIyBJUlEg
Y2hpcCBzdXBwb3J0CiMKQ09ORklHX0lSUUNISVA9eQpDT05GSUdfQVJNX0dJQz15CkNPTkZJ
R19BUk1fR0lDX1BNPXkKQ09ORklHX0FSTV9HSUNfTUFYX05SPTEKQ09ORklHX0FSTV9HSUNf
VjJNPXkKQ09ORklHX0FSTV9HSUNfVjM9eQpDT05GSUdfQVJNX0dJQ19WM19JVFM9eQpDT05G
SUdfQVJNX0dJQ19WM19JVFNfUENJPXkKQ09ORklHX0FSTV9HSUNfVjNfSVRTX0ZTTF9NQz15
CkNPTkZJR19BTFBJTkVfTVNJPXkKIyBDT05GSUdfQUxfRklDIGlzIG5vdCBzZXQKQ09ORklH
X0JDTTcwMzhfTDFfSVJRPXkKQ09ORklHX0JDTTcxMjBfTDJfSVJRPXkKQ09ORklHX0JSQ01T
VEJfTDJfSVJRPXkKQ09ORklHX0RXX0FQQl9JQ1RMPXkKQ09ORklHX0hJU0lMSUNPTl9JUlFf
TUJJR0VOPXkKQ09ORklHX1JFTkVTQVNfSVJRQz15CkNPTkZJR19SRU5FU0FTX1JaRzJMX0lS
UUM9eQpDT05GSUdfU0wyOENQTERfSU5UQz15CkNPTkZJR19TVU42SV9SX0lOVEM9eQpDT05G
SUdfU1VOWElfTk1JX0lOVEM9eQojIENPTkZJR19YSUxJTlhfSU5UQyBpcyBub3Qgc2V0CkNP
TkZJR19JTVhfR1BDVjI9eQpDT05GSUdfTVZFQlVfR0lDUD15CkNPTkZJR19NVkVCVV9JQ1U9
eQpDT05GSUdfTVZFQlVfT0RNST15CkNPTkZJR19NVkVCVV9QSUM9eQpDT05GSUdfTVZFQlVf
U0VJPXkKQ09ORklHX0xTX0VYVElSUT15CkNPTkZJR19MU19TQ0ZHX01TST15CkNPTkZJR19Q
QVJUSVRJT05fUEVSQ1BVPXkKQ09ORklHX1FDT01fSVJRX0NPTUJJTkVSPXkKQ09ORklHX0lS
UV9VTklQSElFUl9BSURFVD15CkNPTkZJR19NRVNPTl9JUlFfR1BJTz15CkNPTkZJR19RQ09N
X1BEQz15CiMgQ09ORklHX1FDT01fTVBNIGlzIG5vdCBzZXQKQ09ORklHX0lNWF9JUlFTVEVF
Uj15CkNPTkZJR19JTVhfSU5UTVVYPXkKQ09ORklHX0lNWF9NVV9NU0k9bQpDT05GSUdfVElf
U0NJX0lOVFJfSVJRQ0hJUD15CkNPTkZJR19USV9TQ0lfSU5UQV9JUlFDSElQPXkKQ09ORklH
X01TVF9JUlE9eQpDT05GSUdfQVBQTEVfQUlDPXkKIyBlbmQgb2YgSVJRIGNoaXAgc3VwcG9y
dAoKIyBDT05GSUdfSVBBQ0tfQlVTIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1JFU0VU
X0NPTlRST0xMRVI9eQpDT05GSUdfUkVTRVRfQ09OVFJPTExFUj15CkNPTkZJR19SRVNFVF9C
RVJMSU49bQpDT05GSUdfUkVTRVRfQlJDTVNUQj15CkNPTkZJR19SRVNFVF9CUkNNU1RCX1JF
U0NBTD15CkNPTkZJR19SRVNFVF9JTVg3PXkKQ09ORklHX1JFU0VUX01FU09OPXkKQ09ORklH
X1JFU0VUX01FU09OX0FVRElPX0FSQj1tCkNPTkZJR19SRVNFVF9OUENNPXkKQ09ORklHX1JF
U0VUX1FDT01fQU9TUz15CkNPTkZJR19SRVNFVF9RQ09NX1BEQz1tCkNPTkZJR19SRVNFVF9S
QVNQQkVSUllQST1tCkNPTkZJR19SRVNFVF9SWkcyTF9VU0JQSFlfQ1RSTD15CkNPTkZJR19S
RVNFVF9TQ01JPXkKQ09ORklHX1JFU0VUX1NJTVBMRT15CkNPTkZJR19SRVNFVF9TVU5YST15
CkNPTkZJR19SRVNFVF9USV9TQ0k9eQojIENPTkZJR19SRVNFVF9USV9TWVNDT04gaXMgbm90
IHNldAojIENPTkZJR19SRVNFVF9USV9UUFMzODBYIGlzIG5vdCBzZXQKQ09ORklHX1JFU0VU
X1VOSVBISUVSPXkKQ09ORklHX1JFU0VUX1VOSVBISUVSX0dMVUU9eQpDT05GSUdfQ09NTU9O
X1JFU0VUX0hJMzY2MD15CkNPTkZJR19DT01NT05fUkVTRVRfSEk2MjIwPXkKQ09ORklHX1JF
U0VUX1RFR1JBX0JQTVA9eQoKIwojIFBIWSBTdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19Q
SFk9eQpDT05GSUdfR0VORVJJQ19QSFlfTUlQSV9EUEhZPXkKQ09ORklHX1BIWV9YR0VORT15
CiMgQ09ORklHX1BIWV9DQU5fVFJBTlNDRUlWRVIgaXMgbm90IHNldApDT05GSUdfUEhZX1NV
TjRJX1VTQj15CkNPTkZJR19QSFlfU1VONklfTUlQSV9EUEhZPW0KIyBDT05GSUdfUEhZX1NV
TjlJX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9TVU41MElfVVNCMyBpcyBub3Qgc2V0
CkNPTkZJR19QSFlfTUVTT044Ql9VU0IyPXkKQ09ORklHX1BIWV9NRVNPTl9HWExfVVNCMj15
CkNPTkZJR19QSFlfTUVTT05fRzEyQV9NSVBJX0RQSFlfQU5BTE9HPXkKQ09ORklHX1BIWV9N
RVNPTl9HMTJBX1VTQjI9eQpDT05GSUdfUEhZX01FU09OX0cxMkFfVVNCM19QQ0lFPXkKQ09O
RklHX1BIWV9NRVNPTl9BWEdfUENJRT15CkNPTkZJR19QSFlfTUVTT05fQVhHX01JUElfUENJ
RV9BTkFMT0c9eQpDT05GSUdfUEhZX01FU09OX0FYR19NSVBJX0RQSFk9eQoKIwojIFBIWSBk
cml2ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9ybXMKIwpDT05GSUdfUEhZX0JDTV9TUl9VU0I9
eQojIENPTkZJR19CQ01fS09OQV9VU0IyX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9C
Q01fTlNfVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9CQ01fTlNfVVNCMyBpcyBub3Qg
c2V0CkNPTkZJR19QSFlfTlMyX1BDSUU9eQpDT05GSUdfUEhZX05TMl9VU0JfRFJEPXkKQ09O
RklHX1BIWV9CUkNNX1NBVEE9eQpDT05GSUdfUEhZX0JSQ01fVVNCPXkKQ09ORklHX1BIWV9C
Q01fU1JfUENJRT15CiMgZW5kIG9mIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9y
bXMKCkNPTkZJR19QSFlfQ0FERU5DRV9UT1JSRU5UPW0KIyBDT05GSUdfUEhZX0NBREVOQ0Vf
RFBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DQURFTkNFX0RQSFlfUlggaXMgbm90IHNl
dApDT05GSUdfUEhZX0NBREVOQ0VfU0lFUlJBPW0KIyBDT05GSUdfUEhZX0NBREVOQ0VfU0FM
Vk8gaXMgbm90IHNldApDT05GSUdfUEhZX0ZTTF9JTVg4TVFfVVNCPXkKIyBDT05GSUdfUEhZ
X01JWEVMX0xWRFNfUEhZIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9NSVhFTF9NSVBJX0RQSFk9
bQpDT05GSUdfUEhZX0ZTTF9JTVg4TV9QQ0lFPXkKIyBDT05GSUdfUEhZX0ZTTF9MWU5YXzI4
RyBpcyBub3Qgc2V0CkNPTkZJR19QSFlfSEk2MjIwX1VTQj15CiMgQ09ORklHX1BIWV9ISTM2
NjBfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0hJMzY3MF9VU0IgaXMgbm90IHNldAoj
IENPTkZJR19QSFlfSEkzNjcwX1BDSUUgaXMgbm90IHNldApDT05GSUdfUEhZX0hJU1RCX0NP
TUJQSFk9eQpDT05GSUdfUEhZX0hJU0lfSU5OT19VU0IyPXkKIyBDT05GSUdfUEhZX0JFUkxJ
Tl9TQVRBIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0JFUkxJTl9VU0IgaXMgbm90IHNldApD
T05GSUdfUEhZX01WRUJVX0EzNzAwX0NPTVBIWT15CkNPTkZJR19QSFlfTVZFQlVfQTM3MDBf
VVRNST15CiMgQ09ORklHX1BIWV9NVkVCVV9BMzhYX0NPTVBIWSBpcyBub3Qgc2V0CkNPTkZJ
R19QSFlfTVZFQlVfQ1AxMTBfQ09NUEhZPXkKIyBDT05GSUdfUEhZX01WRUJVX0NQMTEwX1VU
TUkgaXMgbm90IHNldAojIENPTkZJR19QSFlfUFhBXzI4Tk1fSFNJQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9QWEFfMjhOTV9VU0IyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01US19Q
Q0lFIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9NVEtfVFBIWT15CiMgQ09ORklHX1BIWV9NVEtf
VUZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01US19YU1BIWSBpcyBub3Qgc2V0CkNPTkZJ
R19QSFlfTVRLX0hETUk9bQpDT05GSUdfUEhZX01US19NSVBJX0RTST1tCiMgQ09ORklHX1BI
WV9NVEtfRFAgaXMgbm90IHNldAojIENPTkZJR19QSFlfTEFOOTY2WF9TRVJERVMgaXMgbm90
IHNldAojIENPTkZJR19QSFlfQ1BDQVBfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01B
UFBIT05FX01ETTY2MDAgaXMgbm90IHNldAojIENPTkZJR19QSFlfT0NFTE9UX1NFUkRFUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1BIWV9RQ09NX0FQUTgwNjRfU0FUQSBpcyBub3Qgc2V0CkNP
TkZJR19QSFlfUUNPTV9FRFA9bQojIENPTkZJR19QSFlfUUNPTV9JUFE0MDE5X1VTQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BIWV9RQ09NX0lQUTgwNlhfU0FUQSBpcyBub3Qgc2V0CkNPTkZJ
R19QSFlfUUNPTV9QQ0lFMj1tCkNPTkZJR19QSFlfUUNPTV9RTVA9bQpDT05GSUdfUEhZX1FD
T01fUVVTQjI9bQpDT05GSUdfUEhZX1FDT01fVVNCX0hTPW0KQ09ORklHX1BIWV9RQ09NX1VT
Ql9TTlBTX0ZFTVRPX1YyPW0KIyBDT05GSUdfUEhZX1FDT01fVVNCX0hTSUMgaXMgbm90IHNl
dApDT05GSUdfUEhZX1FDT01fVVNCX0hTXzI4Tk09bQpDT05GSUdfUEhZX1FDT01fVVNCX1NT
PW0KIyBDT05GSUdfUEhZX1FDT01fSVBRODA2WF9VU0IgaXMgbm90IHNldAojIENPTkZJR19Q
SFlfUkNBUl9HRU4yIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9SQ0FSX0dFTjNfUENJRT15CkNP
TkZJR19QSFlfUkNBUl9HRU4zX1VTQjI9eQpDT05GSUdfUEhZX1JDQVJfR0VOM19VU0IzPW0K
IyBDT05GSUdfUEhZX1JPQ0tDSElQX0RQIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1JPQ0tD
SElQX0RQSFlfUlgwIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9ST0NLQ0hJUF9FTU1DPXkKQ09O
RklHX1BIWV9ST0NLQ0hJUF9JTk5PX0hETUk9bQpDT05GSUdfUEhZX1JPQ0tDSElQX0lOTk9f
VVNCMj15CiMgQ09ORklHX1BIWV9ST0NLQ0hJUF9JTk5PX0NTSURQSFkgaXMgbm90IHNldApD
T05GSUdfUEhZX1JPQ0tDSElQX0lOTk9fRFNJRFBIWT1tCiMgQ09ORklHX1BIWV9ST0NLQ0hJ
UF9OQU5FTkdfQ09NQk9fUEhZIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9ST0NLQ0hJUF9QQ0lF
PW0KIyBDT05GSUdfUEhZX1JPQ0tDSElQX1NOUFNfUENJRTMgaXMgbm90IHNldApDT05GSUdf
UEhZX1JPQ0tDSElQX1RZUEVDPXkKIyBDT05GSUdfUEhZX1JPQ0tDSElQX1VTQiBpcyBub3Qg
c2V0CkNPTkZJR19QSFlfRVhZTk9TX0RQX1ZJREVPPXkKQ09ORklHX1BIWV9FWFlOT1NfTUlQ
SV9WSURFTz15CiMgQ09ORklHX1BIWV9FWFlOT1NfUENJRSBpcyBub3Qgc2V0CkNPTkZJR19Q
SFlfU0FNU1VOR19VRlM9eQpDT05GSUdfUEhZX1NBTVNVTkdfVVNCMj15CkNPTkZJR19QSFlf
RVhZTk9TNV9VU0JEUkQ9eQpDT05GSUdfUEhZX1VOSVBISUVSX1VTQjI9eQpDT05GSUdfUEhZ
X1VOSVBISUVSX1VTQjM9eQojIENPTkZJR19QSFlfVU5JUEhJRVJfUENJRSBpcyBub3Qgc2V0
CkNPTkZJR19QSFlfVU5JUEhJRVJfQUhDST15CkNPTkZJR19QSFlfVEVHUkFfWFVTQj15CkNP
TkZJR19QSFlfVEVHUkExOTRfUDJVPW0KQ09ORklHX1BIWV9BTTY1NF9TRVJERVM9bQpDT05G
SUdfUEhZX0o3MjFFX1dJWj1tCiMgQ09ORklHX09NQVBfVVNCMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1BIWV9UVVNCMTIxMCBpcyBub3Qgc2V0CkNPTkZJR19QSFlfVElfR01JSV9TRUw9eQoj
IENPTkZJR19QSFlfSU5URUxfS0VFTUJBWV9FTU1DIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X0lOVEVMX0tFRU1CQVlfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1hJTElOWF9aWU5R
TVAgaXMgbm90IHNldAojIGVuZCBvZiBQSFkgU3Vic3lzdGVtCgojIENPTkZJR19QT1dFUkNB
UCBpcyBub3Qgc2V0CiMgQ09ORklHX01DQiBpcyBub3Qgc2V0CgojCiMgUGVyZm9ybWFuY2Ug
bW9uaXRvciBzdXBwb3J0CiMKQ09ORklHX0FSTV9DQ0lfUE1VPW0KQ09ORklHX0FSTV9DQ0k0
MDBfUE1VPXkKQ09ORklHX0FSTV9DQ0k1eHhfUE1VPXkKQ09ORklHX0FSTV9DQ049bQpDT05G
SUdfQVJNX0NNTj1tCkNPTkZJR19BUk1fUE1VPXkKQ09ORklHX0FSTV9QTVVfQUNQST15CkNP
TkZJR19BUk1fU01NVV9WM19QTVU9bQpDT05GSUdfQVJNX0RTVV9QTVU9bQpDT05GSUdfRlNM
X0lNWDhfRERSX1BNVT1tCkNPTkZJR19RQ09NX0wyX1BNVT15CkNPTkZJR19RQ09NX0wzX1BN
VT15CkNPTkZJR19USFVOREVSWDJfUE1VPW0KIyBDT05GSUdfWEdFTkVfUE1VIGlzIG5vdCBz
ZXQKQ09ORklHX0FSTV9TUEVfUE1VPW0KQ09ORklHX0FSTV9ETUM2MjBfUE1VPW0KIyBDT05G
SUdfTUFSVkVMTF9DTjEwS19UQURfUE1VIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBQTEVfTTFf
Q1BVX1BNVSBpcyBub3Qgc2V0CiMgQ09ORklHX0FMSUJBQkFfVU5DT1JFX0RSV19QTVUgaXMg
bm90IHNldApDT05GSUdfSElTSV9QTVU9eQojIENPTkZJR19ISVNJX1BDSUVfUE1VIGlzIG5v
dCBzZXQKIyBDT05GSUdfSE5TM19QTVUgaXMgbm90IHNldAojIENPTkZJR19NQVJWRUxMX0NO
MTBLX0REUl9QTVUgaXMgbm90IHNldAojIGVuZCBvZiBQZXJmb3JtYW5jZSBtb25pdG9yIHN1
cHBvcnQKCkNPTkZJR19SQVM9eQojIENPTkZJR19VU0I0IGlzIG5vdCBzZXQKCiMKIyBBbmRy
b2lkCiMKIyBDT05GSUdfQU5EUk9JRF9CSU5ERVJfSVBDIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
QW5kcm9pZAoKIyBDT05GSUdfTElCTlZESU1NIGlzIG5vdCBzZXQKIyBDT05GSUdfREFYIGlz
IG5vdCBzZXQKQ09ORklHX05WTUVNPXkKQ09ORklHX05WTUVNX1NZU0ZTPXkKQ09ORklHX05W
TUVNX0FQUExFX0VGVVNFUz15CkNPTkZJR19OVk1FTV9CQ01fT0NPVFA9eQojIENPTkZJR19O
Vk1FTV9JTVhfSUlNIGlzIG5vdCBzZXQKQ09ORklHX05WTUVNX0lNWF9PQ09UUD15CkNPTkZJ
R19OVk1FTV9JTVhfT0NPVFBfU0NVPXkKQ09ORklHX05WTUVNX0xBWUVSU0NBUEVfU0ZQPW0K
Q09ORklHX05WTUVNX01FU09OX0VGVVNFPW0KIyBDT05GSUdfTlZNRU1fTUVTT05fTVhfRUZV
U0UgaXMgbm90IHNldApDT05GSUdfTlZNRU1fTVRLX0VGVVNFPXkKQ09ORklHX05WTUVNX1FD
T01fUUZQUk9NPXkKQ09ORklHX05WTUVNX1JNRU09bQpDT05GSUdfTlZNRU1fUk9DS0NISVBf
RUZVU0U9eQojIENPTkZJR19OVk1FTV9ST0NLQ0hJUF9PVFAgaXMgbm90IHNldAojIENPTkZJ
R19OVk1FTV9TTlZTX0xQR1BSIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fU1BNSV9TREFN
IGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fU1BSRF9FRlVTRSBpcyBub3Qgc2V0CkNPTkZJ
R19OVk1FTV9TVU5YSV9TSUQ9eQojIENPTkZJR19OVk1FTV9VX0JPT1RfRU5WIGlzIG5vdCBz
ZXQKQ09ORklHX05WTUVNX1VOSVBISUVSX0VGVVNFPXkKIyBDT05GSUdfTlZNRU1fWllOUU1Q
IGlzIG5vdCBzZXQKCiMKIyBIVyB0cmFjaW5nIHN1cHBvcnQKIwpDT05GSUdfU1RNPW0KIyBD
T05GSUdfU1RNX1BST1RPX0JBU0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RNX1BST1RPX1NZ
U19UIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RNX0RVTU1ZIGlzIG5vdCBzZXQKIyBDT05GSUdf
U1RNX1NPVVJDRV9DT05TT0xFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RNX1NPVVJDRV9IRUFS
VEJFQVQgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9USCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJU0lfUFRUIGlzIG5vdCBzZXQKIyBlbmQgb2YgSFcgdHJhY2luZyBzdXBwb3J0CgpDT05G
SUdfRlBHQT15CiMgQ09ORklHX0ZQR0FfTUdSX1NPQ0ZQR0EgaXMgbm90IHNldAojIENPTkZJ
R19GUEdBX01HUl9TT0NGUEdBX0ExMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FMVEVSQV9QUl9J
UF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfRlBHQV9NR1JfQUxURVJBX1BTX1NQSSBpcyBu
b3Qgc2V0CkNPTkZJR19GUEdBX01HUl9BTFRFUkFfQ1ZQPW0KQ09ORklHX0ZQR0FfTUdSX1NU
UkFUSVgxMF9TT0M9bQojIENPTkZJR19GUEdBX01HUl9YSUxJTlhfU1BJIGlzIG5vdCBzZXQK
IyBDT05GSUdfRlBHQV9NR1JfSUNFNDBfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfRlBHQV9N
R1JfTUFDSFhPMl9TUEkgaXMgbm90IHNldApDT05GSUdfRlBHQV9CUklER0U9bQojIENPTkZJ
R19TT0NGUEdBX0ZQR0FfQlJJREdFIGlzIG5vdCBzZXQKQ09ORklHX0FMVEVSQV9GUkVFWkVf
QlJJREdFPW0KIyBDT05GSUdfWElMSU5YX1BSX0RFQ09VUExFUiBpcyBub3Qgc2V0CkNPTkZJ
R19GUEdBX1JFR0lPTj1tCkNPTkZJR19PRl9GUEdBX1JFR0lPTj1tCiMgQ09ORklHX0ZQR0Ff
REZMIGlzIG5vdCBzZXQKIyBDT05GSUdfRlBHQV9NR1JfWllOUU1QX0ZQR0EgaXMgbm90IHNl
dAojIENPTkZJR19GUEdBX01HUl9WRVJTQUxfRlBHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZQ
R0FfTUdSX01JQ1JPQ0hJUF9TUEkgaXMgbm90IHNldAojIENPTkZJR19GU0kgaXMgbm90IHNl
dApDT05GSUdfVEVFPXkKQ09ORklHX09QVEVFPXkKQ09ORklHX01VTFRJUExFWEVSPXkKCiMK
IyBNdWx0aXBsZXhlciBkcml2ZXJzCiMKIyBDT05GSUdfTVVYX0FERzc5MkEgaXMgbm90IHNl
dAojIENPTkZJR19NVVhfQURHUzE0MDggaXMgbm90IHNldAojIENPTkZJR19NVVhfR1BJTyBp
cyBub3Qgc2V0CkNPTkZJR19NVVhfTU1JTz15CiMgZW5kIG9mIE11bHRpcGxleGVyIGRyaXZl
cnMKCkNPTkZJR19QTV9PUFA9eQojIENPTkZJR19TSU9YIGlzIG5vdCBzZXQKQ09ORklHX1NM
SU1CVVM9bQpDT05GSUdfU0xJTV9RQ09NX0NUUkw9bQpDT05GSUdfU0xJTV9RQ09NX05HRF9D
VFJMPW0KQ09ORklHX0lOVEVSQ09OTkVDVD15CkNPTkZJR19JTlRFUkNPTk5FQ1RfSU1YPW0K
Q09ORklHX0lOVEVSQ09OTkVDVF9JTVg4TU09bQpDT05GSUdfSU5URVJDT05ORUNUX0lNWDhN
Tj1tCkNPTkZJR19JTlRFUkNPTk5FQ1RfSU1YOE1RPW0KIyBDT05GSUdfSU5URVJDT05ORUNU
X0lNWDhNUCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTT15CkNPTkZJR19J
TlRFUkNPTk5FQ1RfUUNPTV9CQ01fVk9URVI9eQpDT05GSUdfSU5URVJDT05ORUNUX1FDT01f
TVNNODkxNj1tCiMgQ09ORklHX0lOVEVSQ09OTkVDVF9RQ09NX01TTTg5MzkgaXMgbm90IHNl
dAojIENPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9NU004OTc0IGlzIG5vdCBzZXQKQ09ORklH
X0lOVEVSQ09OTkVDVF9RQ09NX01TTTg5OTY9bQpDT05GSUdfSU5URVJDT05ORUNUX1FDT01f
T1NNX0wzPW0KIyBDT05GSUdfSU5URVJDT05ORUNUX1FDT01fUUNNMjI5MCBpcyBub3Qgc2V0
CkNPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9RQ1M0MDQ9bQpDT05GSUdfSU5URVJDT05ORUNU
X1FDT01fUlBNSF9QT1NTSUJMRT15CkNPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9SUE1IPXkK
Q09ORklHX0lOVEVSQ09OTkVDVF9RQ09NX1NDNzE4MD1tCkNPTkZJR19JTlRFUkNPTk5FQ1Rf
UUNPTV9TQzcyODA9eQpDT05GSUdfSU5URVJDT05ORUNUX1FDT01fU0M4MTgwWD15CkNPTkZJ
R19JTlRFUkNPTk5FQ1RfUUNPTV9TQzgyODBYUD15CiMgQ09ORklHX0lOVEVSQ09OTkVDVF9R
Q09NX1NETTY2MCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9TRE04NDU9
eQojIENPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9TRFg1NSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOVEVSQ09OTkVDVF9RQ09NX1NEWDY1IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URVJDT05O
RUNUX1FDT01fU002MzUwIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVSQ09OTkVDVF9RQ09NX1NN
ODE1MD1tCkNPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9TTTgyNTA9bQpDT05GSUdfSU5URVJD
T05ORUNUX1FDT01fU004MzUwPW0KQ09ORklHX0lOVEVSQ09OTkVDVF9RQ09NX1NNODQ1MD1t
CkNPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9TTURfUlBNPW0KIyBDT05GSUdfSU5URVJDT05O
RUNUX1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19DT1VOVEVSIGlzIG5vdCBzZXQKIyBD
T05GSUdfTU9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BFQ0kgaXMgbm90IHNldAojIENPTkZJ
R19IVEUgaXMgbm90IHNldAojIGVuZCBvZiBEZXZpY2UgRHJpdmVycwoKIwojIEZpbGUgc3lz
dGVtcwojCkNPTkZJR19EQ0FDSEVfV09SRF9BQ0NFU1M9eQojIENPTkZJR19WQUxJREFURV9G
U19QQVJTRVIgaXMgbm90IHNldApDT05GSUdfRlNfSU9NQVA9eQpDT05GSUdfRVhUMl9GUz15
CiMgQ09ORklHX0VYVDJfRlNfWEFUVFIgaXMgbm90IHNldApDT05GSUdfRVhUM19GUz15CiMg
Q09ORklHX0VYVDNfRlNfUE9TSVhfQUNMIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUM19GU19T
RUNVUklUWSBpcyBub3Qgc2V0CkNPTkZJR19FWFQ0X0ZTPXkKQ09ORklHX0VYVDRfRlNfUE9T
SVhfQUNMPXkKIyBDT05GSUdfRVhUNF9GU19TRUNVUklUWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0VYVDRfREVCVUcgaXMgbm90IHNldApDT05GSUdfSkJEMj15CiMgQ09ORklHX0pCRDJfREVC
VUcgaXMgbm90IHNldApDT05GSUdfRlNfTUJDQUNIRT15CiMgQ09ORklHX1JFSVNFUkZTX0ZT
IGlzIG5vdCBzZXQKIyBDT05GSUdfSkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX0ZT
IGlzIG5vdCBzZXQKIyBDT05GSUdfR0ZTMl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09DRlMy
X0ZTIGlzIG5vdCBzZXQKQ09ORklHX0JUUkZTX0ZTPW0KQ09ORklHX0JUUkZTX0ZTX1BPU0lY
X0FDTD15CiMgQ09ORklHX0JUUkZTX0ZTX0NIRUNLX0lOVEVHUklUWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JUUkZTX0ZTX1JVTl9TQU5JVFlfVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19C
VFJGU19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0FTU0VSVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0JUUkZTX0ZTX1JFRl9WRVJJRlkgaXMgbm90IHNldAojIENPTkZJR19OSUxG
UzJfRlMgaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0ZT
X1BPU0lYX0FDTD15CkNPTkZJR19FWFBPUlRGUz15CiMgQ09ORklHX0VYUE9SVEZTX0JMT0NL
X09QUyBpcyBub3Qgc2V0CkNPTkZJR19GSUxFX0xPQ0tJTkc9eQojIENPTkZJR19GU19FTkNS
WVBUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRlNfVkVSSVRZIGlzIG5vdCBzZXQKQ09ORklH
X0ZTTk9USUZZPXkKQ09ORklHX0ROT1RJRlk9eQpDT05GSUdfSU5PVElGWV9VU0VSPXkKQ09O
RklHX0ZBTk9USUZZPXkKQ09ORklHX0ZBTk9USUZZX0FDQ0VTU19QRVJNSVNTSU9OUz15CkNP
TkZJR19RVU9UQT15CiMgQ09ORklHX1FVT1RBX05FVExJTktfSU5URVJGQUNFIGlzIG5vdCBz
ZXQKQ09ORklHX1BSSU5UX1FVT1RBX1dBUk5JTkc9eQojIENPTkZJR19RVU9UQV9ERUJVRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1FGTVRfVjEgaXMgbm90IHNldAojIENPTkZJR19RRk1UX1Yy
IGlzIG5vdCBzZXQKQ09ORklHX1FVT1RBQ1RMPXkKQ09ORklHX0FVVE9GUzRfRlM9eQpDT05G
SUdfQVVUT0ZTX0ZTPXkKQ09ORklHX0ZVU0VfRlM9bQpDT05GSUdfQ1VTRT1tCiMgQ09ORklH
X1ZJUlRJT19GUyBpcyBub3Qgc2V0CkNPTkZJR19PVkVSTEFZX0ZTPW0KIyBDT05GSUdfT1ZF
UkxBWV9GU19SRURJUkVDVF9ESVIgaXMgbm90IHNldApDT05GSUdfT1ZFUkxBWV9GU19SRURJ
UkVDVF9BTFdBWVNfRk9MTE9XPXkKIyBDT05GSUdfT1ZFUkxBWV9GU19JTkRFWCBpcyBub3Qg
c2V0CiMgQ09ORklHX09WRVJMQVlfRlNfWElOT19BVVRPIGlzIG5vdCBzZXQKIyBDT05GSUdf
T1ZFUkxBWV9GU19NRVRBQ09QWSBpcyBub3Qgc2V0CgojCiMgQ2FjaGVzCiMKQ09ORklHX05F
VEZTX1NVUFBPUlQ9eQojIENPTkZJR19ORVRGU19TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZTQ0FDSEUgaXMgbm90IHNldAojIGVuZCBvZiBDYWNoZXMKCiMKIyBDRC1ST00vRFZEIEZp
bGVzeXN0ZW1zCiMKIyBDT05GSUdfSVNPOTY2MF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VE
Rl9GUyBpcyBub3Qgc2V0CiMgZW5kIG9mIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKCiMKIyBE
T1MvRkFUL0VYRkFUL05UIEZpbGVzeXN0ZW1zCiMKQ09ORklHX0ZBVF9GUz15CiMgQ09ORklH
X01TRE9TX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1ZGQVRfRlM9eQpDT05GSUdfRkFUX0RFRkFV
TFRfQ09ERVBBR0U9NDM3CkNPTkZJR19GQVRfREVGQVVMVF9JT0NIQVJTRVQ9Imlzbzg4NTkt
MSIKIyBDT05GSUdfRkFUX0RFRkFVTFRfVVRGOCBpcyBub3Qgc2V0CiMgQ09ORklHX0VYRkFU
X0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTlRGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX05U
RlMzX0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgRE9TL0ZBVC9FWEZBVC9OVCBGaWxlc3lzdGVt
cwoKIwojIFBzZXVkbyBmaWxlc3lzdGVtcwojCkNPTkZJR19QUk9DX0ZTPXkKIyBDT05GSUdf
UFJPQ19LQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19QUk9DX1ZNQ09SRT15CiMgQ09ORklHX1BS
T0NfVk1DT1JFX0RFVklDRV9EVU1QIGlzIG5vdCBzZXQKQ09ORklHX1BST0NfU1lTQ1RMPXkK
Q09ORklHX1BST0NfUEFHRV9NT05JVE9SPXkKIyBDT05GSUdfUFJPQ19DSElMRFJFTiBpcyBu
b3Qgc2V0CkNPTkZJR19LRVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05GSUdfVE1QRlM9eQpD
T05GSUdfVE1QRlNfUE9TSVhfQUNMPXkKQ09ORklHX1RNUEZTX1hBVFRSPXkKIyBDT05GSUdf
VE1QRlNfSU5PREU2NCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1NVUFBPUlRTX0hVR0VUTEJG
Uz15CkNPTkZJR19IVUdFVExCRlM9eQpDT05GSUdfSFVHRVRMQl9QQUdFPXkKQ09ORklHX0FS
Q0hfV0FOVF9IVUdFVExCX1BBR0VfT1BUSU1JWkVfVk1FTU1BUD15CkNPTkZJR19IVUdFVExC
X1BBR0VfT1BUSU1JWkVfVk1FTU1BUD15CiMgQ09ORklHX0hVR0VUTEJfUEFHRV9PUFRJTUla
RV9WTUVNTUFQX0RFRkFVTFRfT04gaXMgbm90IHNldApDT05GSUdfTUVNRkRfQ1JFQVRFPXkK
Q09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0U9eQpDT05GSUdfQ09ORklHRlNfRlM9eQpD
T05GSUdfRUZJVkFSX0ZTPXkKIyBlbmQgb2YgUHNldWRvIGZpbGVzeXN0ZW1zCgpDT05GSUdf
TUlTQ19GSUxFU1lTVEVNUz15CiMgQ09ORklHX09SQU5HRUZTX0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfQURGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGRlNfRlMgaXMgbm90IHNldAoj
IENPTkZJR19FQ1JZUFRfRlMgaXMgbm90IHNldAojIENPTkZJR19IRlNfRlMgaXMgbm90IHNl
dAojIENPTkZJR19IRlNQTFVTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkVGU19GUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VGU19GUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0pGRlMyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JBTUZTIGlz
IG5vdCBzZXQKQ09ORklHX1NRVUFTSEZTPXkKQ09ORklHX1NRVUFTSEZTX0ZJTEVfQ0FDSEU9
eQojIENPTkZJR19TUVVBU0hGU19GSUxFX0RJUkVDVCBpcyBub3Qgc2V0CkNPTkZJR19TUVVB
U0hGU19ERUNPTVBfU0lOR0xFPXkKIyBDT05GSUdfU1FVQVNIRlNfREVDT01QX01VTFRJIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1FVQVNIRlNfREVDT01QX01VTFRJX1BFUkNQVSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NRVUFTSEZTX1hBVFRSIGlzIG5vdCBzZXQKQ09ORklHX1NRVUFTSEZT
X1pMSUI9eQojIENPTkZJR19TUVVBU0hGU19MWjQgaXMgbm90IHNldAojIENPTkZJR19TUVVB
U0hGU19MWk8gaXMgbm90IHNldAojIENPTkZJR19TUVVBU0hGU19YWiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NRVUFTSEZTX1pTVEQgaXMgbm90IHNldAojIENPTkZJR19TUVVBU0hGU180S19E
RVZCTEtfU0laRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFTSEZTX0VNQkVEREVEIGlzIG5v
dCBzZXQKQ09ORklHX1NRVUFTSEZTX0ZSQUdNRU5UX0NBQ0hFX1NJWkU9MwojIENPTkZJR19W
WEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlOSVhfRlMgaXMgbm90IHNldAojIENPTkZJ
R19PTUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBGU19GUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1FOWDRGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1FOWDZGU19GUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1JPTUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1BTVE9SRT15CkNPTkZJR19Q
U1RPUkVfREVGQVVMVF9LTVNHX0JZVEVTPTEwMjQwCkNPTkZJR19QU1RPUkVfREVGTEFURV9D
T01QUkVTUz15CiMgQ09ORklHX1BTVE9SRV9MWk9fQ09NUFJFU1MgaXMgbm90IHNldAojIENP
TkZJR19QU1RPUkVfTFo0X0NPTVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX0xa
NEhDX0NPTVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFXzg0Ml9DT01QUkVTUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9aU1REX0NPTVBSRVNTIGlzIG5vdCBzZXQKQ09O
RklHX1BTVE9SRV9DT01QUkVTUz15CkNPTkZJR19QU1RPUkVfREVGTEFURV9DT01QUkVTU19E
RUZBVUxUPXkKQ09ORklHX1BTVE9SRV9DT01QUkVTU19ERUZBVUxUPSJkZWZsYXRlIgojIENP
TkZJR19QU1RPUkVfQ09OU09MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9QTVNHIGlz
IG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX1JBTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9S
RV9CTEsgaXMgbm90IHNldAojIENPTkZJR19TWVNWX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdf
VUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVJPRlNfRlMgaXMgbm90IHNldApDT05GSUdf
TkVUV09SS19GSUxFU1lTVEVNUz15CkNPTkZJR19ORlNfRlM9eQpDT05GSUdfTkZTX1YyPXkK
Q09ORklHX05GU19WMz15CiMgQ09ORklHX05GU19WM19BQ0wgaXMgbm90IHNldApDT05GSUdf
TkZTX1Y0PXkKIyBDT05GSUdfTkZTX1NXQVAgaXMgbm90IHNldApDT05GSUdfTkZTX1Y0XzE9
eQpDT05GSUdfTkZTX1Y0XzI9eQpDT05GSUdfUE5GU19GSUxFX0xBWU9VVD15CkNPTkZJR19Q
TkZTX0JMT0NLPW0KQ09ORklHX1BORlNfRkxFWEZJTEVfTEFZT1VUPXkKQ09ORklHX05GU19W
NF8xX0lNUExFTUVOVEFUSU9OX0lEX0RPTUFJTj0ia2VybmVsLm9yZyIKIyBDT05GSUdfTkZT
X1Y0XzFfTUlHUkFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX05GU19WNF9TRUNVUklUWV9MQUJF
TD15CkNPTkZJR19ST09UX05GUz15CiMgQ09ORklHX05GU19VU0VfTEVHQUNZX0ROUyBpcyBu
b3Qgc2V0CkNPTkZJR19ORlNfVVNFX0tFUk5FTF9ETlM9eQpDT05GSUdfTkZTX0RJU0FCTEVf
VURQX1NVUFBPUlQ9eQojIENPTkZJR19ORlNfVjRfMl9SRUFEX1BMVVMgaXMgbm90IHNldAoj
IENPTkZJR19ORlNEIGlzIG5vdCBzZXQKQ09ORklHX0dSQUNFX1BFUklPRD15CkNPTkZJR19M
T0NLRD15CkNPTkZJR19MT0NLRF9WND15CkNPTkZJR19ORlNfQ09NTU9OPXkKQ09ORklHX05G
U19WNF8yX1NTQ19IRUxQRVI9eQpDT05GSUdfU1VOUlBDPXkKQ09ORklHX1NVTlJQQ19HU1M9
eQpDT05GSUdfU1VOUlBDX0JBQ0tDSEFOTkVMPXkKIyBDT05GSUdfU1VOUlBDX0RFQlVHIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0VQSF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NJRlMgaXMg
bm90IHNldAojIENPTkZJR19TTUJfU0VSVkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09EQV9G
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGU19GUyBpcyBub3Qgc2V0CkNPTkZJR185UF9GUz15
CiMgQ09ORklHXzlQX0ZTX1BPU0lYX0FDTCBpcyBub3Qgc2V0CiMgQ09ORklHXzlQX0ZTX1NF
Q1VSSVRZIGlzIG5vdCBzZXQKQ09ORklHX05MUz15CkNPTkZJR19OTFNfREVGQVVMVD0iaXNv
ODg1OS0xIgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz15CiMgQ09ORklHX05MU19DT0RFUEFH
RV83MzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfNzc1IGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0NPREVQQUdFXzg1MCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RF
UEFHRV84NTIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODU1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1NyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19D
T0RFUEFHRV84NjAgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYxIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MiBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19DT0RFUEFHRV84NjMgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY0IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NSBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19DT0RFUEFHRV84NjYgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY5
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzkzNiBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19DT0RFUEFHRV85NTAgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0Vf
OTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzk0OSBpcyBub3Qgc2V0CiMg
Q09ORklHX05MU19DT0RFUEFHRV84NzQgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1
OV84IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzEyNTAgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfQ09ERVBBR0VfMTI1MSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19BU0NJ
SSBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV8xPXkKIyBDT05GSUdfTkxTX0lTTzg4
NTlfMiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzMgaXMgbm90IHNldAojIENP
TkZJR19OTFNfSVNPODg1OV80IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNSBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzYgaXMgbm90IHNldAojIENPTkZJR19O
TFNfSVNPODg1OV83IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfOSBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19JU084ODU5XzEzIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lT
Tzg4NTlfMTQgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8xNSBpcyBub3Qgc2V0
CiMgQ09ORklHX05MU19LT0k4X1IgaXMgbm90IHNldAojIENPTkZJR19OTFNfS09JOF9VIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19ST01BTiBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19NQUNfQ0VMVElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DRU5URVVSTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05MU19NQUNfQ1JPQVRJQU4gaXMgbm90IHNldAojIENPTkZJR19O
TFNfTUFDX0NZUklMTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19HQUVMSUMgaXMg
bm90IHNldAojIENPTkZJR19OTFNfTUFDX0dSRUVLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X01BQ19JQ0VMQU5EIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19JTlVJVCBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19NQUNfUk9NQU5JQU4gaXMgbm90IHNldAojIENPTkZJR19OTFNf
TUFDX1RVUktJU0ggaXMgbm90IHNldAojIENPTkZJR19OTFNfVVRGOCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RMTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VOSUNPREUgaXMgbm90IHNldApDT05G
SUdfSU9fV1E9eQojIGVuZCBvZiBGaWxlIHN5c3RlbXMKCiMKIyBTZWN1cml0eSBvcHRpb25z
CiMKQ09ORklHX0tFWVM9eQojIENPTkZJR19LRVlTX1JFUVVFU1RfQ0FDSEUgaXMgbm90IHNl
dAojIENPTkZJR19QRVJTSVNURU5UX0tFWVJJTkdTIGlzIG5vdCBzZXQKIyBDT05GSUdfVFJV
U1RFRF9LRVlTIGlzIG5vdCBzZXQKIyBDT05GSUdfRU5DUllQVEVEX0tFWVMgaXMgbm90IHNl
dAojIENPTkZJR19LRVlfREhfT1BFUkFUSU9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VS
SVRZX0RNRVNHX1JFU1RSSUNUIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VSSVRZPXkKQ09ORklH
X1NFQ1VSSVRZRlM9eQojIENPTkZJR19TRUNVUklUWV9ORVRXT1JLIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VDVVJJVFlfUEFUSCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0hBUkRFTkVEX1VT
RVJDT1BZX0FMTE9DQVRPUj15CiMgQ09ORklHX0hBUkRFTkVEX1VTRVJDT1BZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRk9SVElGWV9TT1VSQ0UgaXMgbm90IHNldAojIENPTkZJR19TVEFUSUNf
VVNFUk1PREVIRUxQRVIgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TTUFDSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
Q1VSSVRZX0FQUEFSTU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9BRFBJTiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1lBTUEgaXMgbm90IHNldAojIENPTkZJR19T
RUNVUklUWV9TQUZFU0VUSUQgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9MT0NLRE9X
Tl9MU00gaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9MQU5ETE9DSyBpcyBub3Qgc2V0
CkNPTkZJR19JTlRFR1JJVFk9eQojIENPTkZJR19JTlRFR1JJVFlfU0lHTkFUVVJFIGlzIG5v
dCBzZXQKQ09ORklHX0lOVEVHUklUWV9BVURJVD15CiMgQ09ORklHX0lNQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lNQV9TRUNVUkVfQU5EX09SX1RSVVNURURfQk9PVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0VWTSBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1NFQ1VSSVRZX0RBQz15CkNP
TkZJR19MU009ImxhbmRsb2NrLGxvY2tkb3duLHlhbWEsbG9hZHBpbixzYWZlc2V0aWQsaW50
ZWdyaXR5LGJwZiIKCiMKIyBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIwoKIwojIE1lbW9y
eSBpbml0aWFsaXphdGlvbgojCkNPTkZJR19JTklUX1NUQUNLX05PTkU9eQojIENPTkZJR19J
TklUX09OX0FMTE9DX0RFRkFVTFRfT04gaXMgbm90IHNldAojIENPTkZJR19JTklUX09OX0ZS
RUVfREVGQVVMVF9PTiBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFsaXphdGlv
bgoKQ09ORklHX1JBTkRTVFJVQ1RfTk9ORT15CiMgZW5kIG9mIEtlcm5lbCBoYXJkZW5pbmcg
b3B0aW9ucwojIGVuZCBvZiBTZWN1cml0eSBvcHRpb25zCgpDT05GSUdfWE9SX0JMT0NLUz1t
CkNPTkZJR19BU1lOQ19UWF9ESVNBQkxFX1BRX1ZBTF9ETUE9eQpDT05GSUdfQVNZTkNfVFhf
RElTQUJMRV9YT1JfVkFMX0RNQT15CkNPTkZJR19DUllQVE89eQoKIwojIENyeXB0byBjb3Jl
IG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9fQUxHQVBJPXkKQ09ORklHX0NSWVBUT19BTEdB
UEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPXkKQ09ORklHX0NSWVBUT19BRUFEMj15CkNPTkZJ
R19DUllQVE9fU0tDSVBIRVI9eQpDT05GSUdfQ1JZUFRPX1NLQ0lQSEVSMj15CkNPTkZJR19D
UllQVE9fSEFTSD15CkNPTkZJR19DUllQVE9fSEFTSDI9eQpDT05GSUdfQ1JZUFRPX1JORz15
CkNPTkZJR19DUllQVE9fUk5HMj15CkNPTkZJR19DUllQVE9fUk5HX0RFRkFVTFQ9eQpDT05G
SUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fQUtDSVBIRVI9eQpDT05GSUdf
Q1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZUFRPX0tQUD1tCkNPTkZJR19DUllQVE9fQUNPTVAy
PXkKQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSMj15CiMg
Q09ORklHX0NSWVBUT19VU0VSIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19NQU5BR0VSX0RJ
U0FCTEVfVEVTVFM9eQpDT05GSUdfQ1JZUFRPX0dGMTI4TVVMPXkKQ09ORklHX0NSWVBUT19O
VUxMPXkKQ09ORklHX0NSWVBUT19OVUxMMj15CiMgQ09ORklHX0NSWVBUT19QQ1JZUFQgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fQ1JZUFREIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBU
T19BVVRIRU5DPW0KIyBDT05GSUdfQ1JZUFRPX1RFU1QgaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX0VOR0lORT1tCiMgZW5kIG9mIENyeXB0byBjb3JlIG9yIGhlbHBlcgoKIwojIFB1Ymxp
Yy1rZXkgY3J5cHRvZ3JhcGh5CiMKQ09ORklHX0NSWVBUT19SU0E9eQpDT05GSUdfQ1JZUFRP
X0RIPW0KIyBDT05GSUdfQ1JZUFRPX0RIX1JGQzc5MTlfR1JPVVBTIGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19FQ0M9bQpDT05GSUdfQ1JZUFRPX0VDREg9bQojIENPTkZJR19DUllQVE9f
RUNEU0EgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRUNSRFNBIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX1NNMiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ1VSVkUyNTUxOT1t
CiMgZW5kIG9mIFB1YmxpYy1rZXkgY3J5cHRvZ3JhcGh5CgojCiMgQmxvY2sgY2lwaGVycwoj
CkNPTkZJR19DUllQVE9fQUVTPXkKIyBDT05GSUdfQ1JZUFRPX0FFU19USSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19BTlVCSVMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQVJJ
QSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19CTE9XRklTSCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NSWVBUT19DQU1FTExJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DQVNUNSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DQVNUNiBpcyBub3Qgc2V0CkNPTkZJR19DUllQ
VE9fREVTPW0KIyBDT05GSUdfQ1JZUFRPX0ZDUllQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19LSEFaQUQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU0VFRCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TTTQ9
bQojIENPTkZJR19DUllQVE9fU000X0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fVEVBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1RXT0ZJU0ggaXMgbm90IHNldAoj
IGVuZCBvZiBCbG9jayBjaXBoZXJzCgojCiMgTGVuZ3RoLXByZXNlcnZpbmcgY2lwaGVycyBh
bmQgbW9kZXMKIwojIENPTkZJR19DUllQVE9fQURJQU5UVU0gaXMgbm90IHNldAojIENPTkZJ
R19DUllQVE9fQVJDNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DSEFDSEEyMCBpcyBu
b3Qgc2V0CkNPTkZJR19DUllQVE9fQ0JDPW0KIyBDT05GSUdfQ1JZUFRPX0NGQiBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fQ1RSPW0KIyBDT05GSUdfQ1JZUFRPX0NUUyBpcyBub3Qgc2V0
CkNPTkZJR19DUllQVE9fRUNCPW0KIyBDT05GSUdfQ1JZUFRPX0hDVFIyIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX0tFWVdSQVAgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTFJX
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX09GQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19QQ0JDIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19YVFM9bQojIGVuZCBvZiBMZW5n
dGgtcHJlc2VydmluZyBjaXBoZXJzIGFuZCBtb2RlcwoKIwojIEFFQUQgKGF1dGhlbnRpY2F0
ZWQgZW5jcnlwdGlvbiB3aXRoIGFzc29jaWF0ZWQgZGF0YSkgY2lwaGVycwojCiMgQ09ORklH
X0NSWVBUT19BRUdJUzEyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DSEFDSEEyMFBP
TFkxMzA1IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DQ009bQpDT05GSUdfQ1JZUFRPX0dD
TT1tCiMgQ09ORklHX0NSWVBUT19TRVFJViBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRUNI
QUlOSVY9eQojIENPTkZJR19DUllQVE9fRVNTSVYgaXMgbm90IHNldAojIGVuZCBvZiBBRUFE
IChhdXRoZW50aWNhdGVkIGVuY3J5cHRpb24gd2l0aCBhc3NvY2lhdGVkIGRhdGEpIGNpcGhl
cnMKCiMKIyBIYXNoZXMsIGRpZ2VzdHMsIGFuZCBNQUNzCiMKQ09ORklHX0NSWVBUT19CTEFL
RTJCPW0KQ09ORklHX0NSWVBUT19DTUFDPW0KQ09ORklHX0NSWVBUT19HSEFTSD1tCkNPTkZJ
R19DUllQVE9fSE1BQz15CiMgQ09ORklHX0NSWVBUT19NRDQgaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX01ENT1tCkNPTkZJR19DUllQVE9fTUlDSEFFTF9NSUM9bQojIENPTkZJR19DUllQ
VE9fUE9MWTEzMDUgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fUk1EMTYwIGlzIG5vdCBz
ZXQKQ09ORklHX0NSWVBUT19TSEExPXkKQ09ORklHX0NSWVBUT19TSEEyNTY9bQpDT05GSUdf
Q1JZUFRPX1NIQTUxMj15CkNPTkZJR19DUllQVE9fU0hBMz1tCkNPTkZJR19DUllQVE9fU00z
PW0KIyBDT05GSUdfQ1JZUFRPX1NNM19HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX1NUUkVFQk9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1ZNQUMgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fV1A1MTIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fWENC
QyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fWFhIQVNIPW0KIyBlbmQgb2YgSGFzaGVzLCBk
aWdlc3RzLCBhbmQgTUFDcwoKIwojIENSQ3MgKGN5Y2xpYyByZWR1bmRhbmN5IGNoZWNrcykK
IwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CiMgQ09ORklHX0NSWVBUT19DUkMzMiBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fQ1JDVDEwRElGPXkKQ09ORklHX0NSWVBUT19DUkM2NF9ST0NL
U09GVD15CiMgZW5kIG9mIENSQ3MgKGN5Y2xpYyByZWR1bmRhbmN5IGNoZWNrcykKCiMKIyBD
b21wcmVzc2lvbgojCkNPTkZJR19DUllQVE9fREVGTEFURT15CiMgQ09ORklHX0NSWVBUT19M
Wk8gaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fODQyIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX0xaNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19MWjRIQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19aU1REIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29tcHJlc3Npb24K
CiMKIyBSYW5kb20gbnVtYmVyIGdlbmVyYXRpb24KIwpDT05GSUdfQ1JZUFRPX0FOU0lfQ1BS
Tkc9eQpDT05GSUdfQ1JZUFRPX0RSQkdfTUVOVT15CkNPTkZJR19DUllQVE9fRFJCR19ITUFD
PXkKIyBDT05GSUdfQ1JZUFRPX0RSQkdfSEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBU
T19EUkJHX0NUUiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRFJCRz15CkNPTkZJR19DUllQ
VE9fSklUVEVSRU5UUk9QWT15CiMgZW5kIG9mIFJhbmRvbSBudW1iZXIgZ2VuZXJhdGlvbgoK
IwojIFVzZXJzcGFjZSBpbnRlcmZhY2UKIwpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJPW0KIyBD
T05GSUdfQ1JZUFRPX1VTRVJfQVBJX0hBU0ggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
VVNFUl9BUElfU0tDSVBIRVIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1JO
Rz1tCiMgQ09ORklHX0NSWVBUT19VU0VSX0FQSV9STkdfQ0FWUCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NSWVBUT19VU0VSX0FQSV9BRUFEIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19VU0VS
X0FQSV9FTkFCTEVfT0JTT0xFVEU9eQojIGVuZCBvZiBVc2Vyc3BhY2UgaW50ZXJmYWNlCgpD
T05GSUdfQ1JZUFRPX0hBU0hfSU5GTz15CiMgQ09ORklHX0NSWVBUT19OSFBPTFkxMzA1X05F
T04gaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NIQUNIQTIwX05FT049bQoKIwojIEFjY2Vs
ZXJhdGVkIENyeXB0b2dyYXBoaWMgQWxnb3JpdGhtcyBmb3IgQ1BVIChhcm02NCkKIwpDT05G
SUdfQ1JZUFRPX0dIQVNIX0FSTTY0X0NFPXkKIyBDT05GSUdfQ1JZUFRPX1BPTFkxMzA1X05F
T04gaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NIQTFfQVJNNjRfQ0U9eQpDT05GSUdfQ1JZ
UFRPX1NIQTI1Nl9BUk02ND15CkNPTkZJR19DUllQVE9fU0hBMl9BUk02NF9DRT15CkNPTkZJ
R19DUllQVE9fU0hBNTEyX0FSTTY0PW0KQ09ORklHX0NSWVBUT19TSEE1MTJfQVJNNjRfQ0U9
bQpDT05GSUdfQ1JZUFRPX1NIQTNfQVJNNjQ9bQpDT05GSUdfQ1JZUFRPX1NNM19BUk02NF9D
RT1tCiMgQ09ORklHX0NSWVBUT19QT0xZVkFMX0FSTTY0X0NFIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX0FFU19BUk02NCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQUVTX0FSTTY0
X0NFPXkKQ09ORklHX0NSWVBUT19BRVNfQVJNNjRfQ0VfQkxLPXkKQ09ORklHX0NSWVBUT19B
RVNfQVJNNjRfTkVPTl9CTEs9bQpDT05GSUdfQ1JZUFRPX0FFU19BUk02NF9CUz1tCiMgQ09O
RklHX0NSWVBUT19TTTRfQVJNNjRfQ0UgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU000
X0FSTTY0X0NFX0JMSyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TTTRfQVJNNjRfTkVP
Tl9CTEsgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0FFU19BUk02NF9DRV9DQ009eQpDT05G
SUdfQ1JZUFRPX0NSQ1QxMERJRl9BUk02NF9DRT1tCiMgZW5kIG9mIEFjY2VsZXJhdGVkIENy
eXB0b2dyYXBoaWMgQWxnb3JpdGhtcyBmb3IgQ1BVIChhcm02NCkKCkNPTkZJR19DUllQVE9f
SFc9eQpDT05GSUdfQ1JZUFRPX0RFVl9BTExXSU5ORVI9eQojIENPTkZJR19DUllQVE9fREVW
X1NVTjRJX1NTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVZfU1VOOElfQ0U9bQojIENP
TkZJR19DUllQVE9fREVWX1NVTjhJX0NFX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0RFVl9TVU44SV9DRV9IQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9T
VU44SV9DRV9QUk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9TVU44SV9DRV9U
Uk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9TVU44SV9TUyBpcyBub3Qgc2V0
CkNPTkZJR19DUllQVE9fREVWX0ZTTF9DQUFNX0NPTU1PTj1tCkNPTkZJR19DUllQVE9fREVW
X0ZTTF9DQUFNX0NSWVBUT19BUElfREVTQz1tCkNPTkZJR19DUllQVE9fREVWX0ZTTF9DQUFN
X0FIQVNIX0FQSV9ERVNDPW0KQ09ORklHX0NSWVBUT19ERVZfRlNMX0NBQU09bQojIENPTkZJ
R19DUllQVE9fREVWX0ZTTF9DQUFNX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19E
RVZfRlNMX0NBQU1fSlI9bQpDT05GSUdfQ1JZUFRPX0RFVl9GU0xfQ0FBTV9SSU5HU0laRT05
CiMgQ09ORklHX0NSWVBUT19ERVZfRlNMX0NBQU1fSU5UQyBpcyBub3Qgc2V0CkNPTkZJR19D
UllQVE9fREVWX0ZTTF9DQUFNX0NSWVBUT19BUEk9eQpDT05GSUdfQ1JZUFRPX0RFVl9GU0xf
Q0FBTV9DUllQVE9fQVBJX1FJPXkKQ09ORklHX0NSWVBUT19ERVZfRlNMX0NBQU1fQUhBU0hf
QVBJPXkKQ09ORklHX0NSWVBUT19ERVZfRlNMX0NBQU1fUEtDX0FQST15CkNPTkZJR19DUllQ
VE9fREVWX0ZTTF9DQUFNX1JOR19BUEk9eQpDT05GSUdfQ1JZUFRPX0RFVl9GU0xfQ0FBTV9Q
Uk5HX0FQST15CkNPTkZJR19DUllQVE9fREVWX0ZTTF9EUEFBMl9DQUFNPW0KIyBDT05GSUdf
Q1JZUFRPX0RFVl9TQUhBUkEgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0VYWU5P
U19STkcgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1M1UCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19ERVZfQVRNRUxfRUNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X0RFVl9BVE1FTF9TSEEyMDRBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9DQ1Ag
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX01YU19EQ1AgaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fREVWX1FBVF9ESDg5NXhDQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBU
T19ERVZfUUFUX0MzWFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfQzYy
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFUXzRYWFggaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fREVWX1FBVF9ESDg5NXhDQ1ZGIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX0RFVl9RQVRfQzNYWFhWRiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZf
UUFUX0M2MlhWRiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBVklVTV9DUFQgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fREVWX05JVFJPWF9DTk41NVhYIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX0RFVl9NQVJWRUxMX0NFU0EgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVW
X09DVEVPTlRYX0NQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfT0NURU9OVFgy
X0NQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQ0FWSVVNX1pJUCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUNFIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19E
RVZfUUNPTV9STkc9bQojIENPTkZJR19DUllQVE9fREVWX1JPQ0tDSElQIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX0RFVl9aWU5RTVBfQUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0RFVl9aWU5RTVBfU0hBMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfVklS
VElPIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVZfQkNNX1NQVT1tCiMgQ09ORklHX0NS
WVBUT19ERVZfU0FGRVhDRUwgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RFVl9DQ1JFRT1t
CiMgQ09ORklHX0NSWVBUT19ERVZfSElTSV9TRUMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRP
X0RFVl9ISVNJX1NFQzI9bQpDT05GSUdfQ1JZUFRPX0RFVl9ISVNJX1FNPW0KQ09ORklHX0NS
WVBUT19ERVZfSElTSV9aSVA9bQpDT05GSUdfQ1JZUFRPX0RFVl9ISVNJX0hQUkU9bQpDT05G
SUdfQ1JZUFRPX0RFVl9ISVNJX1RSTkc9bQpDT05GSUdfQ1JZUFRPX0RFVl9BTUxPR0lDX0dY
TD1tCiMgQ09ORklHX0NSWVBUT19ERVZfQU1MT0dJQ19HWExfREVCVUcgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fREVWX1NBMlVMIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RF
Vl9LRUVNQkFZX09DU19BRVNfU000IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9L
RUVNQkFZX09DU19FQ0MgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0tFRU1CQVlf
T0NTX0hDVSBpcyBub3Qgc2V0CkNPTkZJR19BU1lNTUVUUklDX0tFWV9UWVBFPXkKQ09ORklH
X0FTWU1NRVRSSUNfUFVCTElDX0tFWV9TVUJUWVBFPXkKQ09ORklHX1g1MDlfQ0VSVElGSUNB
VEVfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzhfUFJJVkFURV9LRVlfUEFSU0VSIGlzIG5vdCBz
ZXQKQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzdfVEVTVF9L
RVkgaXMgbm90IHNldAojIENPTkZJR19TSUdORURfUEVfRklMRV9WRVJJRklDQVRJT04gaXMg
bm90IHNldAojIENPTkZJR19GSVBTX1NJR05BVFVSRV9TRUxGVEVTVCBpcyBub3Qgc2V0Cgoj
CiMgQ2VydGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKIwpDT05GSUdfU1lTVEVN
X1RSVVNURURfS0VZUklORz15CkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPSIiCiMgQ09O
RklHX1NZU1RFTV9FWFRSQV9DRVJUSUZJQ0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ09O
REFSWV9UUlVTVEVEX0tFWVJJTkcgaXMgbm90IHNldAojIENPTkZJR19TWVNURU1fQkxBQ0tM
SVNUX0tFWVJJTkcgaXMgbm90IHNldAojIGVuZCBvZiBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25h
dHVyZSBjaGVja2luZwoKQ09ORklHX0JJTkFSWV9QUklOVEY9eQoKIwojIExpYnJhcnkgcm91
dGluZXMKIwpDT05GSUdfUkFJRDZfUFE9bQpDT05GSUdfUkFJRDZfUFFfQkVOQ0hNQVJLPXkK
Q09ORklHX0xJTkVBUl9SQU5HRVM9eQpDT05GSUdfUEFDS0lORz15CkNPTkZJR19CSVRSRVZF
UlNFPXkKQ09ORklHX0hBVkVfQVJDSF9CSVRSRVZFUlNFPXkKQ09ORklHX0dFTkVSSUNfU1RS
TkNQWV9GUk9NX1VTRVI9eQpDT05GSUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQpDT05GSUdf
R0VORVJJQ19ORVRfVVRJTFM9eQojIENPTkZJR19DT1JESUMgaXMgbm90IHNldAojIENPTkZJ
R19QUklNRV9OVU1CRVJTIGlzIG5vdCBzZXQKQ09ORklHX1JBVElPTkFMPXkKQ09ORklHX0dF
TkVSSUNfUENJX0lPTUFQPXkKQ09ORklHX0FSQ0hfVVNFX0NNUFhDSEdfTE9DS1JFRj15CkNP
TkZJR19BUkNIX0hBU19GQVNUX01VTFRJUExJRVI9eQpDT05GSUdfQVJDSF9VU0VfU1lNX0FO
Tk9UQVRJT05TPXkKQ09ORklHX0lORElSRUNUX1BJTz15CgojCiMgQ3J5cHRvIGxpYnJhcnkg
cm91dGluZXMKIwpDT05GSUdfQ1JZUFRPX0xJQl9VVElMUz15CkNPTkZJR19DUllQVE9fTElC
X0FFUz15CkNPTkZJR19DUllQVE9fTElCX0FSQzQ9bQpDT05GSUdfQ1JZUFRPX0xJQl9CTEFL
RTJTX0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0FSQ0hfSEFWRV9MSUJfQ0hBQ0hBPW0KQ09O
RklHX0NSWVBUT19MSUJfQ0hBQ0hBX0dFTkVSSUM9bQojIENPTkZJR19DUllQVE9fTElCX0NI
QUNIQSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTElCX0NVUlZFMjU1MTlfR0VORVJJQz1t
CiMgQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUxOSBpcyBub3Qgc2V0CkNPTkZJR19DUllQ
VE9fTElCX0RFUz1tCkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1X1JTSVpFPTkKIyBDT05G
SUdfQ1JZUFRPX0xJQl9QT0xZMTMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19MSUJf
Q0hBQ0hBMjBQT0xZMTMwNSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTElCX1NIQTE9eQpD
T05GSUdfQ1JZUFRPX0xJQl9TSEEyNTY9bQojIGVuZCBvZiBDcnlwdG8gbGlicmFyeSByb3V0
aW5lcwoKQ09ORklHX0NSQ19DQ0lUVD1tCkNPTkZJR19DUkMxNj15CkNPTkZJR19DUkNfVDEw
RElGPXkKQ09ORklHX0NSQzY0X1JPQ0tTT0ZUPXkKQ09ORklHX0NSQ19JVFVfVD15CkNPTkZJ
R19DUkMzMj15CiMgQ09ORklHX0NSQzMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0NS
QzMyX1NMSUNFQlk4PXkKIyBDT05GSUdfQ1JDMzJfU0xJQ0VCWTQgaXMgbm90IHNldAojIENP
TkZJR19DUkMzMl9TQVJXQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJfQklUIGlzIG5v
dCBzZXQKQ09ORklHX0NSQzY0PXkKIyBDT05GSUdfQ1JDNCBpcyBub3Qgc2V0CkNPTkZJR19D
UkM3PXkKQ09ORklHX0xJQkNSQzMyQz1tCkNPTkZJR19DUkM4PXkKQ09ORklHX1hYSEFTSD15
CkNPTkZJR19BVURJVF9HRU5FUklDPXkKQ09ORklHX0FVRElUX0FSQ0hfQ09NUEFUX0dFTkVS
SUM9eQpDT05GSUdfQVVESVRfQ09NUEFUX0dFTkVSSUM9eQojIENPTkZJR19SQU5ET00zMl9T
RUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19aTElCX0lORkxBVEU9eQpDT05GSUdfWkxJQl9E
RUZMQVRFPXkKQ09ORklHX0xaT19DT01QUkVTUz15CkNPTkZJR19MWk9fREVDT01QUkVTUz15
CkNPTkZJR19MWjRfREVDT01QUkVTUz15CkNPTkZJR19aU1REX0NPTU1PTj15CkNPTkZJR19a
U1REX0NPTVBSRVNTPW0KQ09ORklHX1pTVERfREVDT01QUkVTUz15CkNPTkZJR19YWl9ERUM9
eQpDT05GSUdfWFpfREVDX1g4Nj15CkNPTkZJR19YWl9ERUNfUE9XRVJQQz15CkNPTkZJR19Y
Wl9ERUNfSUE2ND15CkNPTkZJR19YWl9ERUNfQVJNPXkKQ09ORklHX1haX0RFQ19BUk1USFVN
Qj15CkNPTkZJR19YWl9ERUNfU1BBUkM9eQojIENPTkZJR19YWl9ERUNfTUlDUk9MWk1BIGlz
IG5vdCBzZXQKQ09ORklHX1haX0RFQ19CQ0o9eQojIENPTkZJR19YWl9ERUNfVEVTVCBpcyBu
b3Qgc2V0CkNPTkZJR19ERUNPTVBSRVNTX0daSVA9eQpDT05GSUdfREVDT01QUkVTU19CWklQ
Mj15CkNPTkZJR19ERUNPTVBSRVNTX0xaTUE9eQpDT05GSUdfREVDT01QUkVTU19YWj15CkNP
TkZJR19ERUNPTVBSRVNTX0xaTz15CkNPTkZJR19ERUNPTVBSRVNTX0xaND15CkNPTkZJR19E
RUNPTVBSRVNTX1pTVEQ9eQpDT05GSUdfR0VORVJJQ19BTExPQ0FUT1I9eQpDT05GSUdfSU5U
RVJWQUxfVFJFRT15CkNPTkZJR19YQVJSQVlfTVVMVEk9eQpDT05GSUdfQVNTT0NJQVRJVkVf
QVJSQVk9eQpDT05GSUdfSEFTX0lPTUVNPXkKQ09ORklHX0hBU19JT1BPUlRfTUFQPXkKQ09O
RklHX0hBU19ETUE9eQpDT05GSUdfRE1BX09QUz15CkNPTkZJR19ORUVEX1NHX0RNQV9MRU5H
VEg9eQpDT05GSUdfTkVFRF9ETUFfTUFQX1NUQVRFPXkKQ09ORklHX0FSQ0hfRE1BX0FERFJf
VF82NEJJVD15CkNPTkZJR19ETUFfREVDTEFSRV9DT0hFUkVOVD15CkNPTkZJR19BUkNIX0hB
U19TRVRVUF9ETUFfT1BTPXkKQ09ORklHX0FSQ0hfSEFTX1RFQVJET1dOX0RNQV9PUFM9eQpD
T05GSUdfQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0RFVklDRT15CkNPTkZJR19BUkNIX0hBU19T
WU5DX0RNQV9GT1JfQ1BVPXkKQ09ORklHX0FSQ0hfSEFTX0RNQV9QUkVQX0NPSEVSRU5UPXkK
Q09ORklHX1NXSU9UTEI9eQojIENPTkZJR19ETUFfUkVTVFJJQ1RFRF9QT09MIGlzIG5vdCBz
ZXQKQ09ORklHX0RNQV9OT05DT0hFUkVOVF9NTUFQPXkKQ09ORklHX0RNQV9DT0hFUkVOVF9Q
T09MPXkKQ09ORklHX0RNQV9ESVJFQ1RfUkVNQVA9eQpDT05GSUdfRE1BX0NNQT15CkNPTkZJ
R19ETUFfUEVSTlVNQV9DTUE9eQoKIwojIERlZmF1bHQgY29udGlndW91cyBtZW1vcnkgYXJl
YSBzaXplOgojCkNPTkZJR19DTUFfU0laRV9NQllURVM9MzIKQ09ORklHX0NNQV9TSVpFX1NF
TF9NQllURVM9eQojIENPTkZJR19DTUFfU0laRV9TRUxfUEVSQ0VOVEFHRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9NSU4gaXMgbm90IHNldAojIENPTkZJR19DTUFfU0la
RV9TRUxfTUFYIGlzIG5vdCBzZXQKQ09ORklHX0NNQV9BTElHTk1FTlQ9OAojIENPTkZJR19E
TUFfQVBJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BX01BUF9CRU5DSE1BUksgaXMg
bm90IHNldApDT05GSUdfU0dMX0FMTE9DPXkKIyBDT05GSUdfRk9SQ0VfTlJfQ1BVUyBpcyBu
b3Qgc2V0CkNPTkZJR19DUFVfUk1BUD15CkNPTkZJR19EUUw9eQpDT05GSUdfR0xPQj15CiMg
Q09ORklHX0dMT0JfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfTkxBVFRSPXkKQ09ORklH
X0NMWl9UQUI9eQpDT05GSUdfSVJRX1BPTEw9eQpDT05GSUdfTVBJTElCPXkKQ09ORklHX0RJ
TUxJQj15CkNPTkZJR19MSUJGRFQ9eQpDT05GSUdfT0lEX1JFR0lTVFJZPXkKQ09ORklHX1VD
UzJfU1RSSU5HPXkKQ09ORklHX0hBVkVfR0VORVJJQ19WRFNPPXkKQ09ORklHX0dFTkVSSUNf
R0VUVElNRU9GREFZPXkKQ09ORklHX0dFTkVSSUNfVkRTT19USU1FX05TPXkKQ09ORklHX0ZP
TlRfU1VQUE9SVD15CiMgQ09ORklHX0ZPTlRTIGlzIG5vdCBzZXQKQ09ORklHX0ZPTlRfOHg4
PXkKQ09ORklHX0ZPTlRfOHgxNj15CkNPTkZJR19TR19QT09MPXkKQ09ORklHX01FTVJFR0lP
Tj15CkNPTkZJR19BUkNIX1NUQUNLV0FMSz15CkNPTkZJR19TVEFDS0RFUE9UPXkKQ09ORklH
X1NCSVRNQVA9eQojIGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVzCgpDT05GSUdfR0VORVJJQ19J
T1JFTUFQPXkKQ09ORklHX0dFTkVSSUNfTElCX0RFVk1FTV9JU19BTExPV0VEPXkKCiMKIyBL
ZXJuZWwgaGFja2luZwojCgojCiMgcHJpbnRrIGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklH
X1BSSU5US19USU1FPXkKIyBDT05GSUdfUFJJTlRLX0NBTExFUiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NUQUNLVFJBQ0VfQlVJTERfSUQgaXMgbm90IHNldApDT05GSUdfQ09OU09MRV9MT0dM
RVZFTF9ERUZBVUxUPTcKQ09ORklHX0NPTlNPTEVfTE9HTEVWRUxfUVVJRVQ9NApDT05GSUdf
TUVTU0FHRV9MT0dMRVZFTF9ERUZBVUxUPTQKIyBDT05GSUdfQk9PVF9QUklOVEtfREVMQVkg
aXMgbm90IHNldAojIENPTkZJR19EWU5BTUlDX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFlOQU1JQ19ERUJVR19DT1JFIGlzIG5vdCBzZXQKQ09ORklHX1NZTUJPTElDX0VSUk5BTUU9
eQpDT05GSUdfREVCVUdfQlVHVkVSQk9TRT15CiMgZW5kIG9mIHByaW50ayBhbmQgZG1lc2cg
b3B0aW9ucwoKQ09ORklHX0RFQlVHX0tFUk5FTD15CkNPTkZJR19ERUJVR19NSVNDPXkKCiMK
IyBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCiMKQ09ORklHX0RF
QlVHX0lORk89eQpDT05GSUdfQVNfSEFTX05PTl9DT05TVF9MRUIxMjg9eQojIENPTkZJR19E
RUJVR19JTkZPX05PTkUgaXMgbm90IHNldApDT05GSUdfREVCVUdfSU5GT19EV0FSRl9UT09M
Q0hBSU5fREVGQVVMVD15CiMgQ09ORklHX0RFQlVHX0lORk9fRFdBUkY0IGlzIG5vdCBzZXQK
IyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjUgaXMgbm90IHNldApDT05GSUdfREVCVUdfSU5G
T19SRURVQ0VEPXkKIyBDT05GSUdfREVCVUdfSU5GT19DT01QUkVTU0VEIGlzIG5vdCBzZXQK
IyBDT05GSUdfREVCVUdfSU5GT19TUExJVCBpcyBub3Qgc2V0CiMgQ09ORklHX0dEQl9TQ1JJ
UFRTIGlzIG5vdCBzZXQKQ09ORklHX0ZSQU1FX1dBUk49MjA0OAojIENPTkZJR19TVFJJUF9B
U01fU1lNUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFQURBQkxFX0FTTSBpcyBub3Qgc2V0CiMg
Q09ORklHX0hFQURFUlNfSU5TVEFMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NFQ1RJ
T05fTUlTTUFUQ0ggaXMgbm90IHNldApDT05GSUdfU0VDVElPTl9NSVNNQVRDSF9XQVJOX09O
TFk9eQpDT05GSUdfQVJDSF9XQU5UX0ZSQU1FX1BPSU5URVJTPXkKQ09ORklHX0ZSQU1FX1BP
SU5URVI9eQojIENPTkZJR19ERUJVR19GT1JDRV9XRUFLX1BFUl9DUFUgaXMgbm90IHNldAoj
IGVuZCBvZiBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCgojCiMg
R2VuZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCiMKQ09ORklHX01BR0lDX1NZ
U1JRPXkKQ09ORklHX01BR0lDX1NZU1JRX0RFRkFVTFRfRU5BQkxFPTB4MQpDT05GSUdfTUFH
SUNfU1lTUlFfU0VSSUFMPXkKQ09ORklHX01BR0lDX1NZU1JRX1NFUklBTF9TRVFVRU5DRT0i
IgpDT05GSUdfREVCVUdfRlM9eQpDT05GSUdfREVCVUdfRlNfQUxMT1dfQUxMPXkKIyBDT05G
SUdfREVCVUdfRlNfRElTQUxMT1dfTU9VTlQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19G
U19BTExPV19OT05FIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LR0RCPXkKIyBDT05G
SUdfS0dEQiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEw9
eQojIENPTkZJR19VQlNBTiBpcyBub3Qgc2V0CiMgZW5kIG9mIEdlbmVyaWMgS2VybmVsIERl
YnVnZ2luZyBJbnN0cnVtZW50cwoKIwojIE5ldHdvcmtpbmcgRGVidWdnaW5nCiMKIyBDT05G
SUdfTkVUX0RFVl9SRUZDTlRfVFJBQ0tFUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OU19S
RUZDTlRfVFJBQ0tFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX05FVCBpcyBub3Qgc2V0
CiMgZW5kIG9mIE5ldHdvcmtpbmcgRGVidWdnaW5nCgojCiMgTWVtb3J5IERlYnVnZ2luZwoj
CiMgQ09ORklHX1BBR0VfRVhURU5TSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUEFH
RUFMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1NMVUJfREVCVUc9eQojIENPTkZJR19TTFVCX0RF
QlVHX09OIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFHRV9PV05FUiBpcyBub3Qgc2V0CiMgQ09O
RklHX1BBR0VfVEFCTEVfQ0hFQ0sgaXMgbm90IHNldAojIENPTkZJR19QQUdFX1BPSVNPTklO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JPREFUQV9URVNUIGlzIG5vdCBzZXQKQ09O
RklHX0FSQ0hfSEFTX0RFQlVHX1dYPXkKIyBDT05GSUdfREVCVUdfV1ggaXMgbm90IHNldApD
T05GSUdfR0VORVJJQ19QVERVTVA9eQojIENPTkZJR19QVERVTVBfREVCVUdGUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFQlVHX09CSkVDVFMgaXMgbm90IHNldAojIENPTkZJR19TSFJJTktF
Ul9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0RFQlVHX0tNRU1MRUFLPXkKIyBDT05G
SUdfREVCVUdfS01FTUxFQUsgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TVEFDS19VU0FH
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDSEVEX1NUQUNLX0VORF9DSEVDSyBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFPXkKIyBDT05GSUdfREVCVUdfVk0g
aXMgbm90IHNldAojIENPTkZJR19ERUJVR19WTV9QR1RBQkxFIGlzIG5vdCBzZXQKQ09ORklH
X0FSQ0hfSEFTX0RFQlVHX1ZJUlRVQUw9eQojIENPTkZJR19ERUJVR19WSVJUVUFMIGlzIG5v
dCBzZXQKQ09ORklHX0RFQlVHX01FTU9SWV9JTklUPXkKIyBDT05GSUdfREVCVUdfUEVSX0NQ
VV9NQVBTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LQVNBTj15CkNPTkZJR19IQVZF
X0FSQ0hfS0FTQU5fU1dfVEFHUz15CkNPTkZJR19IQVZFX0FSQ0hfS0FTQU5fVk1BTExPQz15
CkNPTkZJR19DQ19IQVNfS0FTQU5fR0VORVJJQz15CkNPTkZJR19IQVZFX0FSQ0hfS0ZFTkNF
PXkKIyBDT05GSUdfS0ZFTkNFIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVtb3J5IERlYnVnZ2lu
ZwoKIyBDT05GSUdfREVCVUdfU0hJUlEgaXMgbm90IHNldAoKIwojIERlYnVnIE9vcHMsIExv
Y2t1cHMgYW5kIEhhbmdzCiMKIyBDT05GSUdfUEFOSUNfT05fT09QUyBpcyBub3Qgc2V0CkNP
TkZJR19QQU5JQ19PTl9PT1BTX1ZBTFVFPTAKQ09ORklHX1BBTklDX1RJTUVPVVQ9MAojIENP
TkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfREVURUNUX0hV
TkdfVEFTSyBpcyBub3Qgc2V0CiMgQ09ORklHX1dRX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEVTVF9MT0NLVVAgaXMgbm90IHNldAojIGVuZCBvZiBEZWJ1ZyBPb3BzLCBMb2Nr
dXBzIGFuZCBIYW5ncwoKIwojIFNjaGVkdWxlciBEZWJ1Z2dpbmcKIwojIENPTkZJR19TQ0hF
RF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TQ0hFRF9JTkZPPXkKIyBDT05GSUdfU0NIRURT
VEFUUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNjaGVkdWxlciBEZWJ1Z2dpbmcKCiMgQ09ORklH
X0RFQlVHX1RJTUVLRUVQSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUFJFRU1QVCBp
cyBub3Qgc2V0CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRj
Li4uKQojCkNPTkZJR19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkKIyBDT05GSUdfUFJPVkVf
TE9DS0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFQlVHX1JUX01VVEVYRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TUElOTE9D
SyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX01VVEVYRVMgaXMgbm90IHNldAojIENPTkZJ
R19ERUJVR19XV19NVVRFWF9TTE9XUEFUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JX
U0VNUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0xPQ0tfQUxMT0MgaXMgbm90IHNldAoj
IENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19M
T0NLSU5HX0FQSV9TRUxGVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19MT0NLX1RPUlRVUkVf
VEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1dXX01VVEVYX1NFTEZURVNUIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NGX1RPUlRVUkVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NTRF9MT0NL
X1dBSVRfREVCVUcgaXMgbm90IHNldAojIGVuZCBvZiBMb2NrIERlYnVnZ2luZyAoc3Bpbmxv
Y2tzLCBtdXRleGVzLCBldGMuLi4pCgojIENPTkZJR19ERUJVR19JUlFGTEFHUyBpcyBub3Qg
c2V0CkNPTkZJR19TVEFDS1RSQUNFPXkKIyBDT05GSUdfV0FSTl9BTExfVU5TRUVERURfUkFO
RE9NIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfS09CSkVDVCBpcyBub3Qgc2V0CgojCiMg
RGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwojCiMgQ09ORklHX0RFQlVHX0xJU1QgaXMg
bm90IHNldAojIENPTkZJR19ERUJVR19QTElTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVH
X1NHIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTk9USUZJRVJTIGlzIG5vdCBzZXQKIyBD
T05GSUdfQlVHX09OX0RBVEFfQ09SUlVQVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVH
X01BUExFX1RSRUUgaXMgbm90IHNldAojIGVuZCBvZiBEZWJ1ZyBrZXJuZWwgZGF0YSBzdHJ1
Y3R1cmVzCgojIENPTkZJR19ERUJVR19DUkVERU5USUFMUyBpcyBub3Qgc2V0CgojCiMgUkNV
IERlYnVnZ2luZwojCiMgQ09ORklHX1JDVV9TQ0FMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkNVX1RPUlRVUkVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JDVV9SRUZfU0NBTEVf
VEVTVCBpcyBub3Qgc2V0CkNPTkZJR19SQ1VfQ1BVX1NUQUxMX1RJTUVPVVQ9MjEKQ09ORklH
X1JDVV9FWFBfQ1BVX1NUQUxMX1RJTUVPVVQ9MApDT05GSUdfUkNVX1RSQUNFPXkKIyBDT05G
SUdfUkNVX0VRU19ERUJVRyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJDVSBEZWJ1Z2dpbmcKCiMg
Q09ORklHX0RFQlVHX1dRX0ZPUkNFX1JSX0NQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9I
T1RQTFVHX1NUQVRFX0NPTlRST0wgaXMgbm90IHNldAojIENPTkZJR19MQVRFTkNZVE9QIGlz
IG5vdCBzZXQKQ09ORklHX0hBVkVfRlVOQ1RJT05fVFJBQ0VSPXkKQ09ORklHX0hBVkVfRlVO
Q1RJT05fR1JBUEhfVFJBQ0VSPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0U9eQpDT05G
SUdfSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJB
Q0VQT0lOVFM9eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNPTkZJR19UUkFDRV9D
TE9DSz15CkNPTkZJR19UUkFDSU5HX1NVUFBPUlQ9eQojIENPTkZJR19GVFJBQ0UgaXMgbm90
IHNldAojIENPTkZJR19TQU1QTEVTIGlzIG5vdCBzZXQKQ09ORklHX1NUUklDVF9ERVZNRU09
eQojIENPTkZJR19JT19TVFJJQ1RfREVWTUVNIGlzIG5vdCBzZXQKCiMKIyBhcm02NCBEZWJ1
Z2dpbmcKIwojIENPTkZJR19QSURfSU5fQ09OVEVYVElEUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX0VGSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTTY0X1JFTE9DX1RFU1QgaXMgbm90
IHNldApDT05GSUdfQ09SRVNJR0hUPW0KQ09ORklHX0NPUkVTSUdIVF9MSU5LU19BTkRfU0lO
S1M9bQpDT05GSUdfQ09SRVNJR0hUX0xJTktfQU5EX1NJTktfVE1DPW0KQ09ORklHX0NPUkVT
SUdIVF9DQVRVPW0KQ09ORklHX0NPUkVTSUdIVF9TSU5LX1RQSVU9bQpDT05GSUdfQ09SRVNJ
R0hUX1NJTktfRVRCVjEwPW0KIyBDT05GSUdfQ09SRVNJR0hUX1NPVVJDRV9FVE00WCBpcyBu
b3Qgc2V0CkNPTkZJR19DT1JFU0lHSFRfU1RNPW0KQ09ORklHX0NPUkVTSUdIVF9DUFVfREVC
VUc9bQojIENPTkZJR19DT1JFU0lHSFRfQ1BVX0RFQlVHX0RFRkFVTFRfT04gaXMgbm90IHNl
dApDT05GSUdfQ09SRVNJR0hUX0NUST1tCiMgQ09ORklHX0NPUkVTSUdIVF9DVElfSU5URUdS
QVRJT05fUkVHUyBpcyBub3Qgc2V0CiMgZW5kIG9mIGFybTY0IERlYnVnZ2luZwoKIwojIEtl
cm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojCiMgQ09ORklHX0tVTklUIGlzIG5vdCBzZXQK
IyBDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkFVTFRfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0tDT1Y9eQpDT05G
SUdfQ0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CkNPTkZJR19SVU5USU1FX1RFU1RJTkdfTUVO
VT15CiMgQ09ORklHX0xLRFRNIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9NSU5fSEVBUCBp
cyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfRElWNjQgaXMgbm90IHNldAojIENPTkZJR19CQUNL
VFJBQ0VfU0VMRl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9SRUZfVFJBQ0tFUiBp
cyBub3Qgc2V0CiMgQ09ORklHX1JCVFJFRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVF
RF9TT0xPTU9OX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19JTlRFUlZBTF9UUkVFX1RFU1Qg
aXMgbm90IHNldAojIENPTkZJR19QRVJDUFVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FU
T01JQzY0X1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9IRVhEVU1QIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1RSSU5HX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVT
VF9TVFJJTkdfSEVMUEVSUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1RSU0NQWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFU1RfS1NUUlRPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1Rf
UFJJTlRGIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9TQ0FORiBpcyBub3Qgc2V0CiMgQ09O
RklHX1RFU1RfQklUTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9VVUlEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEVTVF9YQVJSQVkgaXMgbm90IHNldAojIENPTkZJR19URVNUX1JIQVNI
VEFCTEUgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NJUEhBU0ggaXMgbm90IHNldAojIENP
TkZJR19URVNUX0lEQSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfTEtNIGlzIG5vdCBzZXQK
IyBDT05GSUdfVEVTVF9CSVRPUFMgaXMgbm90IHNldAojIENPTkZJR19URVNUX1ZNQUxMT0Mg
aXMgbm90IHNldAojIENPTkZJR19URVNUX1VTRVJfQ09QWSBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFU1RfQlBGIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9CTEFDS0hPTEVfREVWIGlzIG5v
dCBzZXQKIyBDT05GSUdfRklORF9CSVRfQkVOQ0hNQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVTVF9GSVJNV0FSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1lTQ1RMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEVTVF9VREVMQVkgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NUQVRJ
Q19LRVlTIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9LTU9EIGlzIG5vdCBzZXQKIyBDT05G
SUdfVEVTVF9NRU1DQVRfUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfTUVNSU5JVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFU1RfRlJFRV9QQUdFUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNI
X1VTRV9NRU1URVNUPXkKQ09ORklHX01FTVRFU1Q9eQojIGVuZCBvZiBLZXJuZWwgVGVzdGlu
ZyBhbmQgQ292ZXJhZ2UKCiMKIyBSdXN0IGhhY2tpbmcKIwojIGVuZCBvZiBSdXN0IGhhY2tp
bmcKIyBlbmQgb2YgS2VybmVsIGhhY2tpbmcK

--------------hECn0Gqn7zl1YaMJg36Sy4Qd--
