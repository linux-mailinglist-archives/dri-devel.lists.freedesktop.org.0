Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC7A464C6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 16:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1118910E6B4;
	Wed, 26 Feb 2025 15:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tHm3NbX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3661810E6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 15:31:31 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so1141380566b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 07:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740583890; x=1741188690; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eqAmajrUkSWP+RSh/qNpOLcasBUoO/Rx4Ka24d+ReWk=;
 b=tHm3NbX/y2VaQ0IaUGliA2ClptTNVWalTSCigIH+3WUKfDvlmXy0Dor1Qwtv13t/U6
 YR6SQ2c7TZl0EOC3vv5mUgVSUWpM2vMmzEENb21xleh/QZPNNnL2k1FbhK2UkjGXh6uP
 E330AOjBTqUD2awfp9q84uxXrj24QcREuJ67zvqpK+l9GjH64BCOtzovRsXcl2RzZ6bu
 FfIZuNMZByrm1A7iN7ni4hfQa+ULoJSGp0Rexa43hwWSuNMrl6CR+jloX/SLYzmYYKtF
 8zdd/SCRBEErpU+dzTN9kaVdACWtjYWh0KfVzsuEWl+zVHH6CvReJpcvdWG8u1BmOUvM
 4AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740583890; x=1741188690;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqAmajrUkSWP+RSh/qNpOLcasBUoO/Rx4Ka24d+ReWk=;
 b=ENOvTB3m6hPgLQfNEMlEY2Yo6i9TgRdmc4HTxowLbgOonNl0ssL4AyTT6SPu76gkFW
 cKUAKFSksSlOGyo2b8ObdmdaFgO4ioyngotj3g0hwy0NXzbzRQcUPhh/IA4hoANKLVJK
 IyzA9yEhHFC8pkAxPtauyVIPuYzkd8HVtGc772+0qAdN6vspoStPUR7YQ32dFQOgPWq4
 cwk+nPhpi/H634SipIxUNwr/rRRxzTHh3AFHJR2cd8nsFcVuL/iw3n4ueHic/QkjIeI/
 YmY5sBZN/9kkEuJfTnfrvINXqC0vq4K2OG7yf7bvEMF+DwyvDxv4ujcDxwenQdV3Y+RA
 OiLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWuVMeHOzUQrANgXn96zawh5KzC6xOYXyiSBPG1SaFqkbrbX/ZFiZYGhcxv/XrMVqtwnPzoSCzSJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVQDOq75QQLOrSBtLH0M4z2j/ExzOmNpNLc8YfjpQTtqYJK6rj
 V1/8MQam0WudC7SvmqnbteNKofPnMeofTmz396xPuTKHNWbm8hS4r7YmT2izVi4=
X-Gm-Gg: ASbGncusvKOnDp5EqwvHF6oCEmAqiHaMiYaRVoRBJp2Ef0KbHlP8240gaExNFCQRsNf
 N0mJUUsYunH+55qfWEZhqE/iVeSvDfshbkBXj7+1GWthMHzpNw6TqmNIoP7ham1hzCiWW0HATUc
 ztDnvkYHv1DOKpWMK0dTdrsbzpnm7Bjf68GbFB42DDEySK0TekA4TtOBuIwFy/TWHEYe/BFAYFU
 9ShBqVYbj/zDDnJbeffd++hJ1Alx0zNsOz864FROoyYRnqV39ax/PiV/7hBTrkd22V59XVj1TUk
 MnuLE/ERhny5KtVvxohOitE5
X-Google-Smtp-Source: AGHT+IF0ukKgt11J8m92/F3mriaR7AMU8zhdZvDGdYgGmsDEjZlnfX63CFS/1zLHknAiaWI/zdCNdw==
X-Received: by 2002:a17:907:94cc:b0:ab7:f0fa:1341 with SMTP id
 a640c23a62f3a-abed10fecbbmr789811466b.56.1740583889548; 
 Wed, 26 Feb 2025 07:31:29 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdd82fsm347594766b.16.2025.02.26.07.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 07:31:28 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 26 Feb 2025 17:31:08 +0200
Subject: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
X-B4-Tracking: v=1; b=H4sIALszv2cC/x2NQQrCMBAAv1L27EK6oKjXgg/wWnpIk41dtE3YQ
 CuU/t3F48Aws0NlFa5wb3ZQXqVKXgzaUwNh8suLUaIxkKOzI7pg2WYcP6jsI44+vLFYIEdMmme
 cNnRXs0KgdCMHVinKSb7/Qw/PRwfDcfwAI/cPvXYAAAA=
X-Change-ID: 20250226-pwm-bl-read-back-period-from-hw-08226cc2f920
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, linux-pwm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=k4N0XlmGvdfOMTmWDEfUUGimUOVDhSaHXWbUuCud4bU=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnvzPErP7VvYpWIiwM5iOAh95Cl7Of3k5CJDYyY
 tofqZ7znOuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ78zxAAKCRAbX0TJAJUV
 VpsBD/0R5b7F9kLEtwbwLoSttnGFhMw8cAjfYdA10nLSwkzvBDW4C7Mkib3L8buwyAi6Hw7SQj3
 LZmlKHmppMYlXI0n8HP3d+JzOhACkZUXIlQvmOt5zthhRxY1rC2RZTGbL2VoFwR18edWyWl7xu6
 BTJKr1Pp49cScIWMfZkLRKtvrcwn6bUx/zW9iMKleWEu8ZlwTWvH/t7jSPPHqSOGXpR0By2dhtL
 CuEVvNdeXkqYAECaiIaDUh1P4H4sMVFHzE4370KM8SH3zYmpquz+9RnrOEZhG0hdfygqsjd3dtB
 kSY8K6nH4Zpg2WbNDg2VXmhVxdWqMEjyC/FfhxlEv6QDIRFl1vBTfLj1wXml9eN3pMwNEQPje4n
 7i3iULyvwcUPHnyfABIIo2IsZAJyzy9zipJ9r33u1zD5LAbFaVrETi+EExBcXAzfFEs5yD1Ocpp
 MnrkbT/QwfdB+Ef+VtsFuOJAkgNDpBhm9dZlI7B7Pzt7E0eqV+hNoseJ097j9aeiUD643lX5Ylk
 53avnd6zhE0nXhcq6CA2/Q9UbgHbGJ/43DmuW22CjDIiiBma5X06gMMIdENplUTfx8HWJJX51uL
 gig32r0zM8+p2rjEye7qZFH42x132GPTs7+37B3IRPzyUQv2JgixEjtYkzQVbBO+zFLGvSCkuIy
 kqBHK3JKeE0OpeA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

The current implementation assumes that the PWM provider will be able to
meet the requested period, but that is not always the case. Some PWM
providers have limited HW configuration capabilities and can only
provide a period that is somewhat close to the requested one. This
simply means that the duty cycle requested might either be above the
PWM's maximum value or the 100% duty cycle is never reached.

This could be easily fixed if the pwm_apply*() API family would allow
overriding the period within the PWM state that's used for providing the
duty cycle. But that is currently not the case.

So easiest fix here is to read back the period from the PWM provider via
the provider's ->get_state() op, if implemented, which should provide the
best matched period. Do this on probe after the first ->pwm_apply() op has
been done, which will allow the provider to determine the best match
period based on available configuration knobs. From there on, the
backlight will use the best matched period, since the driver's internal
PWM state is now synced up with the one from provider.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/video/backlight/pwm_bl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 237d3d3f3bb1a6d713c5f6ec3198af772bf1268c..71a3e9cd8844095e85c01b194d7466978f1ca78e 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -525,6 +525,17 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}
 
+	/*
+	 * The actual period might differ from the requested one due to HW
+	 * limitations, so sync up the period with one determined by the
+	 * provider driver.
+	 */
+	ret = pwm_get_state_hw(pb->pwm, &pb->pwm->state);
+	if (ret && ret != -EOPNOTSUPP) {
+		dev_err(&pdev->dev, "failed to get PWM HW state");
+		goto err_alloc;
+	}
+
 	memset(&props, 0, sizeof(struct backlight_properties));
 
 	if (data->levels) {

---
base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
change-id: 20250226-pwm-bl-read-back-period-from-hw-08226cc2f920

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

