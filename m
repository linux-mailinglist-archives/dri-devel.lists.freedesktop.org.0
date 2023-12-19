Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9438192CA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7860B10E206;
	Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09D910E25E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B4DD614D5;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40287C4167D;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=jplkjx8KqxEm4GLkaXEG2Z4HbaFqY312HYZeES0ZtrE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=H3YyyvsxfiS6k44YxC/qRiEBp7u6VA6JILXBOBPtvDxC6pMp3O2eAkGMFHhtABWj3
 7s0iOY5MY/nS9YCsv6q3ozlTGTiYcZENEDdQt+3gMhSSExgtKdmMseMPgG2KnLN49f
 HJpXQxX/8NNPC2PycdPMEsXXS3j5KRYEBqdrTaMlUZil0juQz6Xrir3FCtVnluaEwb
 IvmSafv/WbiJVDE40QjtEvtzeMVBmatsdkIuJaNTXa9xgmDJVFSrrro1dRtQHjLLb2
 VkgxHP26d+0ffNPeloDk/8nE1Bb6YQ9VY0zeqw9U2Z6KMGvSylX8CpsaP2qBWNkkBM
 akaFxUS6vNhhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 31A33C41535;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:21 +0100
Subject: [PATCH 16/27] sparc32: Drop use of sparc_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-16-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=12280;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=towcWv/IYNk7Hr20WNSh7PMItPdPneNjwiK/fXzUXBw=; =?utf-8?q?b=3DV1cnAV/sOaE2?=
 =?utf-8?q?3j6mQAoXJ8XD3mN9KWAjrZjSKN6qIEqfPE6+95qYg6Iyd8Jljo/koYkJsy+p4Nfv?=
 5oWz9OgsBFCB9lJ/Rtpax43gJ1nkhx8t33AGEPrHUm/A+1ct60ek
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

sparc_config were used to handle the differences between the machines.
With only LEON supported sparc_config is no longer required.

Refactor the time code a litte as some parts are obsolete and other
parts are only used when SMP is not enabled.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/timer_32.h |  1 +
 arch/sparc/kernel/irq.h           | 37 +++-------------------
 arch/sparc/kernel/irq_32.c        |  3 --
 arch/sparc/kernel/leon_kernel.c   | 27 +++--------------
 arch/sparc/kernel/of_device_32.c  |  4 +--
 arch/sparc/kernel/time_32.c       | 64 +++++++++++++--------------------------
 6 files changed, 33 insertions(+), 103 deletions(-)

diff --git a/arch/sparc/include/asm/timer_32.h b/arch/sparc/include/asm/timer_32.h
index eecd2696922d..1cd89a99966f 100644
--- a/arch/sparc/include/asm/timer_32.h
+++ b/arch/sparc/include/asm/timer_32.h
@@ -17,6 +17,7 @@
 #include <asm/cpu_type.h>  /* For SUN4M_NCPUS */
 
 #define SBUS_CLOCK_RATE   2000000 /* 2MHz */
+#define LEON_CLOCK_RATE   1000000
 #define TIMER_VALUE_SHIFT 9
 #define TIMER_VALUE_MASK  0x3fffff
 #define TIMER_LIMIT_BIT   (1 << 31)  /* Bit 31 in Counter-Timer register */
diff --git a/arch/sparc/kernel/irq.h b/arch/sparc/kernel/irq.h
index 0d9b740725b4..8a0b314c8299 100644
--- a/arch/sparc/kernel/irq.h
+++ b/arch/sparc/kernel/irq.h
@@ -44,38 +44,6 @@ struct sun4m_irq_global {
 extern struct sun4m_irq_percpu __iomem *sun4m_irq_percpu[SUN4M_NCPUS];
 extern struct sun4m_irq_global __iomem *sun4m_irq_global;
 
-/* The following definitions describe the individual platform features: */
-#define FEAT_L10_CLOCKSOURCE (1 << 0) /* L10 timer is used as a clocksource */
-#define FEAT_L10_CLOCKEVENT  (1 << 1) /* L10 timer is used as a clockevent */
-#define FEAT_L14_ONESHOT     (1 << 2) /* L14 timer clockevent can oneshot */
-
-/*
- * Platform specific configuration
- * The individual platforms assign their platform
- * specifics in their init functions.
- */
-struct sparc_config {
-	void (*init_timers)(void);
-	unsigned int (*build_device_irq)(struct platform_device *op,
-	                                 unsigned int real_irq);
-
-	/* generic clockevent features - see FEAT_* above */
-	int features;
-
-	/* clock rate used for clock event timer */
-	int clock_rate;
-
-	/* one period for clock source timer */
-	unsigned int cs_period;
-
-	/* function to obtain offsett for cs period */
-	unsigned int (*get_cycles_offset)(void);
-
-	void (*clear_clock_irq)(void);
-	void (*load_profile_irq)(int cpu, unsigned int limit);
-};
-extern struct sparc_config sparc_config;
-
 unsigned int irq_alloc(unsigned int real_irq, unsigned int pil);
 void irq_link(unsigned int irq);
 void irq_unlink(unsigned int irq);
@@ -89,6 +57,11 @@ void sun4m_nmi(struct pt_regs *regs);
 /* sun4d_irq.c */
 void sun4d_handler_irq(unsigned int pil, struct pt_regs *regs);
 
+/* leon_kernel.c */
+void leon_clear_clock_irq(void);
+void leon_load_profile_irq(int cpu, unsigned int limit);
+u32 leon_cycles_offset(void);
+
 #ifdef CONFIG_SMP
 
 /* All SUN4D IPIs are sent on this IRQ, may be shared with hard IRQs */
diff --git a/arch/sparc/kernel/irq_32.c b/arch/sparc/kernel/irq_32.c
index a6af08fce796..f76f57073323 100644
--- a/arch/sparc/kernel/irq_32.c
+++ b/arch/sparc/kernel/irq_32.c
@@ -24,9 +24,6 @@
 #include "kernel.h"
 #include "irq.h"
 
-/* platform specific irq setup */
-struct sparc_config sparc_config;
-
 unsigned long arch_local_irq_save(void)
 {
 	unsigned long retval;
diff --git a/arch/sparc/kernel/leon_kernel.c b/arch/sparc/kernel/leon_kernel.c
index ea04bad6a118..fa9cdaffdc6b 100644
--- a/arch/sparc/kernel/leon_kernel.c
+++ b/arch/sparc/kernel/leon_kernel.c
@@ -237,12 +237,6 @@ unsigned int leon_build_device_irq(unsigned int real_irq,
 	return irq;
 }
 
-static unsigned int _leon_build_device_irq(struct platform_device *op,
-					   unsigned int real_irq)
-{
-	return leon_build_device_irq(real_irq, handle_simple_irq, "edge", 0);
-}
-
 void leon_update_virq_handling(unsigned int virq,
 			      irq_flow_handler_t flow_handler,
 			      const char *name, int do_ack)
@@ -258,7 +252,7 @@ void leon_update_virq_handling(unsigned int virq,
 	irq_set_chip_data(virq, (void *)mask);
 }
 
-static u32 leon_cycles_offset(void)
+u32 leon_cycles_offset(void)
 {
 	u32 rld, val, ctrl, off;
 
@@ -312,14 +306,6 @@ void __init leon_init_timers(void)
 	u32 config;
 	u32 ctrl;
 
-	sparc_config.get_cycles_offset = leon_cycles_offset;
-	sparc_config.cs_period = 1000000 / HZ;
-	sparc_config.features |= FEAT_L10_CLOCKSOURCE;
-
-#ifndef CONFIG_SMP
-	sparc_config.features |= FEAT_L10_CLOCKEVENT;
-#endif
-
 	leondebug_irq_disable = 0;
 	leon_debug_irqout = 0;
 	master_l10_counter = (u32 __iomem *)&dummy_master_l10_counter;
@@ -434,7 +420,7 @@ void __init leon_init_timers(void)
 	err = request_irq(irq, leon_percpu_timer_ce_interrupt,
 			  IRQF_PERCPU | IRQF_TIMER, "timer", NULL);
 #else
-	irq = _leon_build_device_irq(NULL, leon3_gptimer_irq);
+	irq = leon_build_device_irq(leon3_gptimer_irq, handle_simple_irq, "edge", 0);
 	err = request_irq(irq, timer_interrupt, IRQF_TIMER, "timer", NULL);
 #endif
 	if (err) {
@@ -453,7 +439,7 @@ void __init leon_init_timers(void)
 	return;
 }
 
-static void leon_clear_clock_irq(void)
+void leon_clear_clock_irq(void)
 {
 	u32 ctrl;
 
@@ -462,7 +448,7 @@ static void leon_clear_clock_irq(void)
 			      ctrl & leon3_gptimer_ackmask);
 }
 
-static void leon_load_profile_irq(int cpu, unsigned int limit)
+void leon_load_profile_irq(int cpu, unsigned int limit)
 {
 }
 
@@ -485,9 +471,4 @@ void leon_enable_irq_cpu(unsigned int irq_nr, unsigned int cpu)
 
 void __init leon_init_IRQ(void)
 {
-	sparc_config.init_timers      = leon_init_timers;
-	sparc_config.build_device_irq = _leon_build_device_irq;
-	sparc_config.clock_rate       = 1000000;
-	sparc_config.clear_clock_irq  = leon_clear_clock_irq;
-	sparc_config.load_profile_irq = leon_load_profile_irq;
 }
diff --git a/arch/sparc/kernel/of_device_32.c b/arch/sparc/kernel/of_device_32.c
index 06012e68bdca..ddb3b197d5e4 100644
--- a/arch/sparc/kernel/of_device_32.c
+++ b/arch/sparc/kernel/of_device_32.c
@@ -358,7 +358,7 @@ static struct platform_device * __init scan_one_device(struct device_node *dp,
 		op->archdata.num_irqs = len / sizeof(struct linux_prom_irqs);
 		for (i = 0; i < op->archdata.num_irqs; i++)
 			op->archdata.irqs[i] =
-			    sparc_config.build_device_irq(op, intr[i].pri);
+			    leon_build_device_irq(intr[i].pri, handle_simple_irq, "edge", 0);
 	} else {
 		const unsigned int *irq =
 			of_get_property(dp, "interrupts", &len);
@@ -367,7 +367,7 @@ static struct platform_device * __init scan_one_device(struct device_node *dp,
 			op->archdata.num_irqs = len / sizeof(unsigned int);
 			for (i = 0; i < op->archdata.num_irqs; i++)
 				op->archdata.irqs[i] =
-				    sparc_config.build_device_irq(op, irq[i]);
+				    leon_build_device_irq(irq[i], handle_simple_irq, "edge", 0);
 		} else {
 			op->archdata.num_irqs = 0;
 		}
diff --git a/arch/sparc/kernel/time_32.c b/arch/sparc/kernel/time_32.c
index 848404610b86..e6a2cb444777 100644
--- a/arch/sparc/kernel/time_32.c
+++ b/arch/sparc/kernel/time_32.c
@@ -44,6 +44,7 @@
 #include <asm/idprom.h>
 #include <asm/page.h>
 #include <asm/irq_regs.h>
+#include <asm/leon.h>
 #include <asm/setup.h>
 
 #include "kernel.h"
@@ -88,10 +89,10 @@ irqreturn_t notrace timer_interrupt(int dummy, void *dev_id)
 	if (timer_cs_enabled) {
 		write_seqlock(&timer_cs_lock);
 		timer_cs_internal_counter++;
-		sparc_config.clear_clock_irq();
+		leon_clear_clock_irq();
 		write_sequnlock(&timer_cs_lock);
 	} else {
-		sparc_config.clear_clock_irq();
+		leon_clear_clock_irq();
 	}
 
 	if (timer_ce_enabled)
@@ -100,6 +101,7 @@ irqreturn_t notrace timer_interrupt(int dummy, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+#ifndef CONFIG_SMP
 static int timer_ce_shutdown(struct clock_event_device *evt)
 {
 	timer_ce_enabled = 0;
@@ -128,24 +130,10 @@ static __init void setup_timer_ce(void)
 	ce->tick_resume = timer_ce_set_periodic;
 	ce->cpumask  = cpu_possible_mask;
 	ce->shift    = 32;
-	ce->mult     = div_sc(sparc_config.clock_rate, NSEC_PER_SEC,
-	                      ce->shift);
+	ce->mult     = div_sc(LEON_CLOCK_RATE, NSEC_PER_SEC, ce->shift);
 	clockevents_register_device(ce);
 }
-
-static unsigned int sbus_cycles_offset(void)
-{
-	u32 val, offset;
-
-	val = sbus_readl(master_l10_counter);
-	offset = (val >> TIMER_VALUE_SHIFT) & TIMER_VALUE_MASK;
-
-	/* Limit hit? */
-	if (val & TIMER_LIMIT_BIT)
-		offset += sparc_config.cs_period;
-
-	return offset;
-}
+#endif
 
 static u64 timer_cs_read(struct clocksource *cs)
 {
@@ -156,11 +144,11 @@ static u64 timer_cs_read(struct clocksource *cs)
 		seq = read_seqbegin(&timer_cs_lock);
 
 		cycles = timer_cs_internal_counter;
-		offset = sparc_config.get_cycles_offset();
+		offset = leon_cycles_offset();
 	} while (read_seqretry(&timer_cs_lock, seq));
 
 	/* Count absolute cycles */
-	cycles *= sparc_config.cs_period;
+	cycles *= LEON_CLOCK_RATE / HZ;
 	cycles += offset;
 
 	return cycles;
@@ -177,7 +165,7 @@ static struct clocksource timer_cs = {
 static __init int setup_timer_cs(void)
 {
 	timer_cs_enabled = 1;
-	return clocksource_register_hz(&timer_cs, sparc_config.clock_rate);
+	return clocksource_register_hz(&timer_cs, LEON_CLOCK_RATE);
 }
 
 #ifdef CONFIG_SMP
@@ -185,7 +173,7 @@ static int percpu_ce_shutdown(struct clock_event_device *evt)
 {
 	int cpu = cpumask_first(evt->cpumask);
 
-	sparc_config.load_profile_irq(cpu, 0);
+	leon_load_profile_irq(cpu, 0);
 	return 0;
 }
 
@@ -193,7 +181,7 @@ static int percpu_ce_set_periodic(struct clock_event_device *evt)
 {
 	int cpu = cpumask_first(evt->cpumask);
 
-	sparc_config.load_profile_irq(cpu, SBUS_CLOCK_RATE / HZ);
+	leon_load_profile_irq(cpu, SBUS_CLOCK_RATE / HZ);
 	return 0;
 }
 
@@ -203,7 +191,7 @@ static int percpu_ce_set_next_event(unsigned long delta,
 	int cpu = cpumask_first(evt->cpumask);
 	unsigned int next = (unsigned int)delta;
 
-	sparc_config.load_profile_irq(cpu, next);
+	leon_load_profile_irq(cpu, next);
 	return 0;
 }
 
@@ -212,9 +200,6 @@ void register_percpu_ce(int cpu)
 	struct clock_event_device *ce = &per_cpu(sparc32_clockevent, cpu);
 	unsigned int features = CLOCK_EVT_FEAT_PERIODIC;
 
-	if (sparc_config.features & FEAT_L14_ONESHOT)
-		features |= CLOCK_EVT_FEAT_ONESHOT;
-
 	ce->name           = "percpu_ce";
 	ce->rating         = 200;
 	ce->features       = features;
@@ -224,10 +209,9 @@ void register_percpu_ce(int cpu)
 	ce->set_next_event = percpu_ce_set_next_event;
 	ce->cpumask        = cpumask_of(cpu);
 	ce->shift          = 32;
-	ce->mult           = div_sc(sparc_config.clock_rate, NSEC_PER_SEC,
-	                            ce->shift);
-	ce->max_delta_ns   = clockevent_delta2ns(sparc_config.clock_rate, ce);
-	ce->max_delta_ticks = (unsigned long)sparc_config.clock_rate;
+	ce->mult           = div_sc(LEON_CLOCK_RATE, NSEC_PER_SEC, ce->shift);
+	ce->max_delta_ns   = clockevent_delta2ns(LEON_CLOCK_RATE, ce);
+	ce->max_delta_ticks = (unsigned long)LEON_CLOCK_RATE;
 	ce->min_delta_ns   = clockevent_delta2ns(100, ce);
 	ce->min_delta_ticks = 100;
 
@@ -326,26 +310,20 @@ fs_initcall(clock_init);
 
 static void __init sparc32_late_time_init(void)
 {
-	if (sparc_config.features & FEAT_L10_CLOCKEVENT)
-		setup_timer_ce();
-	if (sparc_config.features & FEAT_L10_CLOCKSOURCE)
-		setup_timer_cs();
+#ifndef CONFIG_SMP
+	setup_timer_ce();
+#endif
+	setup_timer_cs();
+
 #ifdef CONFIG_SMP
 	register_percpu_ce(smp_processor_id());
 #endif
 }
 
-static void __init sbus_time_init(void)
-{
-	sparc_config.get_cycles_offset = sbus_cycles_offset;
-	sparc_config.init_timers();
-}
-
 void __init time_init(void)
 {
-	sparc_config.features = 0;
 	late_time_init = sparc32_late_time_init;
 
-	sbus_time_init();
+	leon_init_timers();
 }
 

-- 
2.34.1

